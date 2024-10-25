#include <aarch64/mmu.h>
#include <common/list.h>
#include <common/string.h>
#include <kernel/cpu.h>
#include <kernel/mem.h>
#include <kernel/printk.h>
#include <kernel/proc.h>
#include <kernel/sched.h>

#include <driver/memlayout.h>
#include <kernel/pt.h>

Proc root_proc;			 // the root process
SpinLock proc_lock;		 // the lock for proc

// pid 树的根节点
static struct rb_root_ pid_root;
static bool pid_cmp(rb_node lnode, rb_node rnode) {
	return container_of(lnode, Proc, pid_node)->pid < container_of(rnode, Proc, pid_node)->pid;
}

void kernel_entry();
void proc_entry();		// root_proc 进程跳转到这里

int next_pid = 1;

// 初始化第一个内核进程
// NOTE: should call after kinit
void init_kproc() {

	// 初始化进程锁
	init_spinlock(&proc_lock);

	// 初始化 pid 树
	// rb_init(&pid_root);

	// 初始化根进程
	init_proc(&root_proc);
	root_proc.parent = &root_proc;
	start_proc(&root_proc, kernel_entry, 123456);


	// 初始化CPU，为每个CPU创建一个idle进程，然后将其设置为当前进程
	for (int i = 0; i < NCPU; i++) {
		Proc *p = create_proc();
		p->idle = true;
		p->state = RUNNING;
		cpus[i].sched.idle = p;
		cpus[i].sched.current = p;
	}
}

// 初始化新的（用户态）进程
void init_proc(Proc *p) {

	// 初始化锁
	init_spinlock(&proc_lock);

	// 初始化进程信息
	p->killed = false;
	p->idle = false;

	// 分配pid，并插入pid树
	p->pid = next_pid++;
	ASSERT(0 == _rb_insert(&p->pid_node, &pid_root, pid_cmp));

	p->exitcode = 0;
	p->state = UNUSED;

	init_sem(&p->childexit, 0);
	init_list_node(&p->children);
	init_list_node(&p->ptnode);

	// 初始化调度信息
	init_schinfo(&p->schinfo);

	// 初始化页表
	init_pgdir(&p->pgdir);

	// 分配内核栈、用户态上下文
	p->kcontext = kalloc_page() + PAGE_SIZE - sizeof(KernelContext);
	p->ucontext = kalloc_page() + PAGE_SIZE - sizeof(UserContext);

	// 因为trap_ret会将ucontext加载完, 所以直接将sp设置为用户栈底
	p->ucontext->sp_el0 = round_up((u64)p->ucontext, PAGE_SIZE);

	release_spinlock(&proc_lock);
}

// 创建新的进程
Proc *create_proc() {
	Proc *p = kalloc(sizeof(Proc));
	init_proc(p);

	return p;
}

// 设置 进程 proc 的父进程为当前进程
// NOTE: it's ensured that the old proc->parent = NULL
void set_parent_to_this(Proc *proc) {
	
	acquire_spinlock(&proc->lock);

	Proc *p = thisproc();

	// 把 proc 的父进程设置为当前进程
	proc->parent = p;

	// 把 proc 加入到当前进程的子进程链表中
	_insert_into_list(&p->children, &proc->ptnode);

	release_spinlock(&proc->lock);
}

// 启动进程
// 1. set the parent to root_proc if NULL
// 2. setup the kcontext to make the proc start with proc_entry(entry, arg)
// 3. activate the proc and return its pid
// NOTE: be careful of concurrency
int start_proc(Proc *p, void (*entry)(u64), u64 arg) {
	
	acquire_spinlock(&proc_lock);

	// 如果 p 的父进程为空，则将其父进程设置为 root_proc
	if (p->parent == NULL) {
		p->parent = &root_proc;
		_insert_into_list(&root_proc.children, &p->ptnode);
	}

	// 设置内核上下文
	// 从用户态回到内核时，会到proc_entry()函数的首地址
	// 也即是：调用proc_entry，参数为entry和arg
	p->kcontext->x0 = (u64)entry;
	p->kcontext->x1 = (u64)arg;
	p->kcontext->x30 = (u64)proc_entry;

	release_spinlock(&proc_lock);

	// 激活进程
	activate_proc(p);

	return p->pid;
}

// 等待子进程退出
// 如果没有子进程，则返回 -1
// 保存退出状态到exitcode 并返回其pid
int wait(int *exitcode) {

	
	acquire_spinlock(&proc_lock);

	// 如果没有子进程，则返回-1
	if (_empty_list(&thisproc()->children)) {
		release_spinlock(&proc_lock);
		return -1;
	}

	
	ListNode *node = thisproc()->children.next;
	while (node != &thisproc()->children) {
		// Proc *child = container_of(node, Proc, ptnode);
		node = node->next;
		// printk("  child %d\n", child->pid);
	}

	for (;;) {
		Proc *p = thisproc();
		ListNode *node = p->children.next;

		// 遍历所有子进程
		while (node != &p->children) {
			Proc *child = container_of(node, Proc, ptnode);
			node = node->next;


			// 如果子进程已经退出，则清理子进程并返回
			if (child->state == ZOMBIE) {
				// 调试
				// printk("process %d 's child process %d is a zombie and will be
				// released.\n",
				//    p->pid, child->pid);

				// 保存子进程的pid
				int child_pid = child->pid;
				_rb_erase(&child->pid_node, &pid_root);

				// 保存退出状态
				if (exitcode != 0) *exitcode = child->exitcode;

				// 从父进程的子进程链表中移除
				_detach_from_list(&child->ptnode);

				// 释放子进程的页表
				free_pgdir(&child->pgdir);

				// 释放子进程的资源
				kfree_page(
						(void *)round_down((u64)child->kcontext - 1, PAGE_SIZE));
				kfree_page(
						(void *)round_down((u64)child->ucontext - 1, PAGE_SIZE));

				// 释放子进程的内存
				kfree(child);

				release_spinlock(&proc_lock);
				return child_pid;
			}
		}

		// 如果没有子进程退出，则等待
		release_spinlock(&proc_lock);
		wait_sem(&p->childexit);
		acquire_spinlock(&proc_lock);
	}

	printk("Should not reach here!\n");
	PANIC();
}

// 退出当前进程, 不会返回
// 退出进程会保持ZOMBIE状态, 直到其父进程调用wait回收
NO_RETURN void exit(int code) {
	Proc *p = thisproc();

	// 保证不是根进程退出
	if (p == &root_proc) {
		printk("root proc exit\n");
		PANIC();
	}

	// 如果进程p有子进程，则将其子进程的父进程设置为根进程
	if (_empty_list(&p->children) == false) {
		ListNode *node = p->children.next;
		while (node != &p->children) {
			Proc *child = container_of(node, Proc, ptnode);
			node = node->next;

			// 将子进程的父进程设置为根进程
			child->parent = &root_proc;
			_insert_into_list(&root_proc.children, &child->ptnode);

			// 唤醒 root_proc
			activate_proc(&root_proc);
		}
	}

	post_sem(&p->parent->childexit);	// 释放父进程的信号量
	p->exitcode = code;					// 设置退出状态

	// free_pgdir(&p->pgdir);	// 释放页表

	// 调度进程
	acquire_sched_lock();
	sched(ZOMBIE);

	printk("Should not reach here!\n");
	PANIC();	// prevent the warning of 'no_return function returns'
}


// 通过 pid 来杀死进程
// Set the killed flag of the proc to true and return 0.
// Return -1 if the pid is invalid (proc not found).
int kill(int pid) {

	// 确保不是root_proc和idle进程
    ASSERT(pid > 1 + NCPU);

    // 从pid树中查找进程
    Proc pid_p = { .pid = pid };
    auto node_p = rb_lookup_lock(&pid_p.pid_node, &pid_root, pid_cmp);
    if (node_p == NULL)
        return -1;

    auto p = container_of(node_p, Proc, pid_node);
	if (p->state == UNUSED) {
		return -1;
	}

	// 设置进程的 killed 标志
    p->killed = true;

	release_spinlock(&proc_lock);

    // 唤醒如果在睡眠的进程
    activate_proc(p);

    return 0;
}