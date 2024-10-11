#include <kernel/proc.h>
#include <kernel/mem.h>
#include <kernel/sched.h>
#include <aarch64/mmu.h>
#include <common/list.h>
#include <common/string.h>
#include <kernel/printk.h>
#include <kernel/cpu.h>

Proc root_proc; // the root process
SpinLock proc_lock; // lock for process tree

void kernel_entry();
void proc_entry();

int next_pid = 1;

// 初始化第一个内核进程
// NOTE: should call after kinit
void init_kproc()
{
    // 初始化进程树的锁
    init_spinlock(&proc_lock);

    // 初始化根进程
    init_proc(&root_proc);
    root_proc.parent = &root_proc;
    start_proc(&root_proc, kernel_entry, 123456);

    // 调试
    printk("root process %d is created.\n", root_proc.pid);

    // 初始化CPU，为每个CPU创建一个idle进程，然后将其设置为当前进程
    for (int i = 0; i < NCPU; i++) {
        Proc *p = create_proc();
        p->idle = true;
        p->state = RUNNING;
        cpus[i].sched.idle = p;
        cpus[i].sched.current = p;

        // 调试
        printk("idle process %d is created for cpu %d.\n", p->pid, i);
    }
}

// 初始化新的（用户态）进程
void init_proc(Proc *p)
{
    acquire_spinlock(&proc_lock);

    // 初始化进程信息
    p->killed = false;
    p->idle = false;
    p->pid = next_pid++;
    p->exitcode = 0;
    p->state = UNUSED;
    init_sem(&p->childexit, 0);
    init_list_node(&p->children);
    init_list_node(&p->ptnode);

    // 初始化调度信息
    init_schinfo(&p->schinfo);

    // 分配内核栈
    p->kcontext = kalloc_page() + PAGE_SIZE - sizeof(KernelContext);

    release_spinlock(&proc_lock);
}

// 创建新的进程
Proc *create_proc()
{
    Proc *p = kalloc(sizeof(Proc));
    init_proc(p);

    return p;
}

// 设置 进程proc 的父进程为当前进程
// NOTE: it's ensured that the old proc->parent = NULL
void set_parent_to_this(Proc *proc)
{
    acquire_spinlock(&proc_lock);
    Proc *p = thisproc();
    proc->parent = p;
    _insert_into_list(&p->children, &proc->ptnode);
    release_spinlock(&proc_lock);
}

// 启动进程
// 1. set the parent to root_proc if NULL
// 2. setup the kcontext to make the proc start with proc_entry(entry, arg)
// 3. activate the proc and return its pid
// NOTE: be careful of concurrency
int start_proc(Proc *p, void (*entry)(u64), u64 arg)
{
    acquire_spinlock(&proc_lock);

    // 如果p的父进程为空，则将其父进程设置为根进程
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

    // 调试
    // printk("process %d is started.\n", p->pid);

    return p->pid;
}

// 等待子进程退出
// 如果没有子进程，则返回 -1
// 保存退出状态到exitcode 并返回其pid
int wait(int *exitcode)
{
    // 调试
    // printk("process %d is waiting.\n", thisproc()->pid);

    // 打印子进程
    // printk("children of process %d:\n", thisproc()->pid);
    ListNode *node = thisproc()->children.next;
    while (node != &thisproc()->children) {
        // Proc *child = container_of(node, Proc, ptnode);
        node = node->next;
        // printk("  child %d\n", child->pid);
    }

    acquire_spinlock(&proc_lock);

    // 如果没有子进程，则返回-1
    if (_empty_list(&thisproc()->children)) {
        release_spinlock(&proc_lock);
        return -1;
    }

    for (;;) {
        Proc *p = thisproc();
        ListNode *node = p->children.next;

        // 遍历所有子进程
        while (node != &p->children) {
            Proc *child = container_of(node, Proc, ptnode);
            node = node->next;

            // 如果子进程已经退出，则清理子进程并返回
            if (is_zombie(child)) {
                // 调试
                // printk("process %d 's child process %d is a zombie and will be released.\n",
                    //    p->pid, child->pid);

                // 保存子进程的pid
                int child_pid = child->pid;

                // 保存退出状态
                if (exitcode != 0)
                    *exitcode = child->exitcode;

                // 从父进程的子进程链表中移除
                _detach_from_list(&child->ptnode);

                // 释放子进程的资源
                kfree_page((void *)round_up((u64)child->kcontext - PAGE_SIZE,
                                            PAGE_SIZE));

                // 释放子进程的内存
                kfree(child);

                release_spinlock(&proc_lock);
                return child_pid;
            }
        }

        // 如果没有子进程退出，则等待
        release_spinlock(&proc_lock);
        wait_sem(&thisproc()->childexit);
        acquire_spinlock(&proc_lock);
    }

    printk("Should not reach here!\n");
    PANIC();
}

// 退出当前进程, 不会返回
// 退出进程会保持ZOMBIE状态, 直到其父进程调用wait回收
NO_RETURN void exit(int code)
{
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
            activate_proc(&root_proc);
        }
    }

    post_sem(&p->parent->childexit); // 释放父进程的信号量
    p->exitcode = code; // 设置退出状态

    // 调度进程
    acquire_sched_lock();
    sched(ZOMBIE);

    printk("Should not reach here!\n");
    PANIC(); // prevent the warning of 'no_return function returns'
}

int kill(int pid)
{
    // TODO:
    // Set the killed flag of the proc to true and return 0.
    // Return -1 if the pid is invalid (proc not found).
}