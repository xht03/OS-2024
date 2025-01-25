#include <aarch64/mmu.h>
#include <common/list.h>
#include <common/string.h>
#include <kernel/cpu.h>
#include <kernel/mem.h>
#include <kernel/printk.h>
#include <kernel/proc.h>
#include <kernel/sched.h>
#include <kernel/paging.h>
#include <fs/file.h>

#include <driver/memlayout.h>
#include <kernel/pt.h>


Proc root_proc;			 	// 根进程
Proc idle_proc[NCPU];	 	// 每个CPU的idle进程

void kernel_entry();	 	// 内核进程的入口函数

static int next_pid = 1;	// 下一个进程的pid


// pid 树
static struct rb_root_ pid_root;

static bool pid_cmp(rb_node lnode, rb_node rnode) {
	return container_of(lnode, Proc, pid_node)->pid < container_of(rnode, Proc, pid_node)->pid;
}


// 初始化第一个内核进程
// should call after kinit
void init_kproc() {
	// 初始化 pid 树
	rb_init(&pid_root);


	// 初始化CPU
	for (int i = 0; i < NCPU; i++) {
		// 为每个CPU创建一个idle进程
		Proc *p = &idle_proc[i];
		init_proc(p);
		p->idle = true;
		p->state = RUNNING;

		//idle进程栈 已在start.S中分配
		kfree_page(p->ucontext);
		p->kcontext = NULL;
		p->ucontext = NULL;

		// 设置idle进程为当前进程
		cpus[i].sched.proc = p;
	}


	// 初始化根进程
	init_proc(&root_proc);
	root_proc.parent = &root_proc;
	start_proc(&root_proc, kernel_entry, 0);
}

// 初始化新的（用户态）进程
void init_proc(Proc *p) {

	// 初始化锁
	init_spinlock(&p->lock);

	// 初始化进程
	p->killed = false;
	p->idle = false;


	// 将进程插入pid树
	acquire_spinlock(&pid_root.lock);
	p->pid = next_pid++;
	ASSERT(0 == _rb_insert(&p->pid_node, &pid_root, pid_cmp));
	release_spinlock(&pid_root.lock);

	p->exitcode = 0;
	p->state = UNUSED;

	init_sem(&p->childexit, 0);
	init_list_node(&p->children);
	init_list_node(&p->ptnode);

	// 初始化调度队列
	init_schinfo(&p->schinfo);

	// 初始化页表
	init_pgdir(&p->pgdir);

	// 分配内核栈
	void *page = kalloc_page();
	memset(page, 0, PAGE_SIZE);
	p->kcontext = page + PAGE_SIZE - sizeof(KernelContext);

	// 将初次的用户栈设置为内核栈顶
	p->ucontext = page;
}

// 创建新的进程
Proc *create_proc() {
	Proc *p = kalloc(sizeof(Proc));
	init_proc(p);

	return p;
}


// 设置 进程 proc 的父进程为当前进程
void set_parent_to_this(Proc *proc) {
	

	Proc *p = thisproc();

	// 把 proc 的父进程设置为当前进程
	acquire_spinlock(&proc->lock);
	proc->parent = p;
	release_spinlock(&proc->lock);

	// 把 proc 加入到当前进程的子进程链表中
	acquire_spinlock(&p->lock);
	_insert_into_list(&p->children, &proc->ptnode);
	release_spinlock(&p->lock);
}

// 启动进程
// 1. set the parent to root_proc if NULL
// 2. setup the kcontext to make the proc start with proc_entry(entry, arg)
// 3. activate the proc and return its pid
// NOTE: be careful of concurrency
int start_proc(Proc *p, void (*entry)(u64), u64 arg) {
	
	acquire_spinlock(&p->lock);

	// 如果 p 的父进程为空，则将其父进程设置为 root_proc
	if (p->parent == NULL) {
		p->parent = &root_proc;

		acquire_spinlock(&root_proc.lock);
		_insert_into_list(&root_proc.children, &p->ptnode);
		release_spinlock(&root_proc.lock);
	}

	// 设置内核上下文
	// 从用户态回到内核时，会到proc_entry()函数的首地址
	// 也即是：调用proc_entry，参数为entry和arg
	p->kcontext->x0 = (u64)entry;
	p->kcontext->x1 = (u64)arg;
	p->kcontext->x30 = (u64)proc_entry;

	release_spinlock(&p->lock);

	// 激活进程
	activate_proc(p);

	return p->pid;
}

// 等待子进程退出
// 如果没有子进程，则返回 -1
// 保存退出状态到exitcode 并返回其pid
int wait(int *exitcode) {

	Proc *p = thisproc();
	acquire_spinlock(&p->lock);

	// 如果没有子进程，则返回-1
	if (_empty_list(&p->children)) {
		release_spinlock(&p->lock);
		return -1;
	}


	for (;;) {
		ListNode *node = p->children.next;	// 子进程链表的头结点

		// 遍历所有子进程
		while (node != &p->children) {
			Proc *child = container_of(node, Proc, ptnode);	// 子进程
			node = node->next;


			// 如果子进程已经退出，则清理子进程并返回
			acquire_spinlock(&child->lock);
			if (child->state == ZOMBIE) {

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

				// 释放子进程结构体
				release_spinlock(&child->lock);	
				kfree(child);

				release_spinlock(&p->lock);
				return child_pid;
			}
			release_spinlock(&child->lock);
		}

		// 释放锁，并在sleeplist上休眠，醒来时重新获取锁
		release_spinlock(&p->lock);
		wait_sem(&p->childexit);
		acquire_spinlock(&p->lock);
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
	acquire_spinlock(&p->lock);

	if (_empty_list(&p->children) == false) {
		ListNode *node = p->children.next;
		while (node != &p->children) {
			Proc *child = container_of(node, Proc, ptnode);
			node = node->next;

			// 将子进程的父进程设置为根进程
			acquire_spinlock(&child->lock);
			child->parent = &root_proc;
			{
				acquire_spinlock(&root_proc.lock);
				_insert_into_list(&root_proc.children, &child->ptnode);
				release_spinlock(&root_proc.lock);
			}
			release_spinlock(&child->lock);

			// 唤醒 root_proc
			activate_proc(&root_proc);
		}
	}

	post_sem(&p->parent->childexit);	// 释放父进程的信号量
	p->exitcode = code;					// 设置退出状态
	release_spinlock(&p->lock);

	// 调度进程，当前进程设为ZOMBIE
	acquire_sched();
	sched(ZOMBIE);

	printk("Should not reach here!\n");
	PANIC();
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

	// 设置进程的 killed 标志
	acquire_spinlock(&p->lock);
    p->killed = true;
	release_spinlock(&p->lock);

    // 提醒如果在睡眠的进程
    alert_proc(p);
    return 0;
}

/*
 * Create a new process copying p as the parent.
 * Sets up stack to return as if from system call.
 */
void trap_return();


// 将父进程的地址空间复制到子进程
int copyuvm(Proc *parent, Proc *child)
{
	struct pgdir *pgdir_parent = &parent->pgdir;
    struct pgdir *pgdir_child = &child->pgdir;

	init_pgdir(pgdir_child);

	// 一级页表
	 for (int i = 0; i < N_PTE_PER_TABLE; i++) {
		
		// 如果父进程的页表项有效
		if (pgdir_parent->pt[i] & PTE_VALID) {
            PTEntriesPtr pt1_parent = (PTEntriesPtr)P2K(PTE_ADDRESS(pgdir_parent->pt[i]));		// 父进程的一级页表的内核地址
            PTEntriesPtr pt1_child = (PTEntriesPtr)kalloc_page();								// 子进程的一级页表的内核地址(新分配的)
            if (pt1_child == NULL) {
                free_pgdir(pgdir_child);
                return -1;
            }
            pgdir_child->pt[i] = K2P(pt1_child) | PTE_VALID | PTE_TABLE | PTE_USER | PTE_RW;

			// 二级页表
            for (int j = 0; j < N_PTE_PER_TABLE; j++) {
                if (pt1_parent[j] & PTE_VALID) {
                    PTEntriesPtr pt2_parent = (PTEntriesPtr)P2K(PTE_ADDRESS(pt1_parent[j]));
                    PTEntriesPtr pt2_child = (PTEntriesPtr)kalloc_page();
                    if (pt2_child == NULL) {
                        free_pgdir(pgdir_child);
                        return -1;
                    }
                    pt1_child[j] = K2P(pt2_child) | PTE_VALID | PTE_TABLE | PTE_USER | PTE_RW;

					// 三级页表
                    for (int k = 0; k < N_PTE_PER_TABLE; k++) {
                        if (pt2_parent[k] & PTE_VALID) {
                            PTEntriesPtr pt3_parent = (PTEntriesPtr)P2K(PTE_ADDRESS(pt2_parent[k]));
                            PTEntriesPtr pt3_child = (PTEntriesPtr)kalloc_page();
                            if (pt3_child == NULL) {
                                free_pgdir(pgdir_child);
                                return -1;
                            }
                            pt2_child[k] = K2P(pt3_child) | PTE_VALID | PTE_TABLE | PTE_USER | PTE_RW;

							// 四级页表
                            for (int l = 0; l < N_PTE_PER_TABLE; l++) {
                                if (pt3_parent[l] & PTE_VALID) {
                                    PTEntriesPtr pt4_parent = (PTEntriesPtr)P2K(PTE_ADDRESS(pt3_parent[l]));
                                    PTEntriesPtr pt4_child = (PTEntriesPtr)kalloc_page();
                                    if (pt4_child == NULL) {
                                        free_pgdir(pgdir_child);
                                        return -1;
                                    }
                                    pt3_child[l] = K2P(pt4_child) | PTE_VALID | PTE_TABLE | PTE_USER | PTE_RW;

                                    // 复制页表项内容
                                    memcpy(pt4_child, pt4_parent, PAGE_SIZE);
                                }
                            }
                        }
                    }
                }
            }
        }
	 }

	return 0;
}



// lock may go wrong

int fork()
{
    /*
     * 1. Create a new child process.
     * 2. Copy the parent's memory space.
     * 3. Copy the parent's trapframe.
     * 4. Set the parent of the new proc to the parent of the parent.
     * 5. Set the state of the new proc to RUNNABLE.
     * 6. Activate the new proc and return its pid.
     */

	Proc *parent = thisproc();
	Proc *child = create_proc();

	int pid;

	if(child == NULL) {
		return -1;
	}

	// 复制父进程的内存空间
	if (copyuvm(parent, child) == -1) {
		kfree(child);
		return -1;
	}

	// 复制父进程的 usercontext
	acquire_spinlock(&child->lock);

	memcpy(child->ucontext, parent->ucontext, sizeof(UserContext));
	child->ucontext->x0 = 0;	// 设置返回值为0

	release_spinlock(&child->lock);


	// 增加父进程打开的文件的引用计数
	acquire_spinlock(&child->lock);
	for(int i = 0; i < NOFILE; i++) {
		if(parent->oftable.files[i] != NULL) {
			child->oftable.files[i] = file_dup(parent->oftable.files[i]);
		}
	}
	child->cwd = inodes.share(parent->cwd);
	release_spinlock(&child->lock);

	// 获取新进程的pid
	pid = child->pid;

	// 设置新进程的父进程为当前进程
	set_parent_to_this(child);

	// 激活新进程
	activate_proc(child);

	return pid;
}