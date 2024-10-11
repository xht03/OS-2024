#include <kernel/sched.h>
#include <kernel/proc.h>
#include <kernel/mem.h>
#include <kernel/printk.h>
#include <aarch64/intrinsic.h>
#include <kernel/cpu.h>
#include <common/rbtree.h>

extern bool panic_flag; // 是否处于恐慌状态
extern SpinLock proc_lock; // 进程树的锁
static SpinLock sched_lock; // 调度器的锁（防止多个CPU同时尝试调度）
static Queue sched_queue; // 调度队列

extern void swtch(KernelContext **old_ctx, KernelContext *new_ctx);

// 初始化调度器
void init_sched()
{
    init_spinlock(&sched_lock); // 初始化调度器的锁
    queue_init(&sched_queue); // 初始化调度队列
}

// 返回当前进程的指针
Proc *thisproc()
{
    return cpus[cpuid()].sched.current;
}

// 为每个新进程，初始化自定义的schinfo
void init_schinfo(struct schinfo *p)
{
    return;
}

void acquire_sched_lock()
{
    acquire_spinlock(&sched_lock);
}
void release_sched_lock()
{
    release_spinlock(&sched_lock);
}

// 判断进程是否为僵尸进程
bool is_zombie(Proc *p)
{
    bool r;
    acquire_sched_lock();
    r = p->state == ZOMBIE;
    release_sched_lock();
    return r;
}

bool is_unused(Proc *p)
{
    bool r;
    acquire_sched_lock();
    r = p->state == UNUSED;
    release_sched_lock();
    return r;
}

// 激活进程
// if the proc->state is RUNNING/RUNNABLE, do nothing
// if the proc->state if SLEEPING/UNUSED, set the process state to RUNNABLE and add it to the sched queue
// else: panic
bool activate_proc(Proc *p)
{
    if (p->state == RUNNING || p->state == RUNNABLE)
        return true;
    if (p->state == SLEEPING || p->state == UNUSED) {
        // 设置进程状态为RUNNABLE
        acquire_spinlock(&proc_lock);
        p->state = RUNNABLE;
        release_spinlock(&proc_lock);

        // 将进程加入调度队列
        queue_lock(&sched_queue);
        queue_push(&sched_queue, &p->schinfo.sched_node);
        queue_unlock(&sched_queue);

        return true;
    }

    printk("activate_proc: unexpected state %d\n", p->state);
    PANIC();
    return false;
}

// 更新进程状态
static void update_this_state(enum procstate new_state)
{
    acquire_spinlock(&proc_lock);

    // 更新当前进程的状态
    Proc *p = thisproc();
    p->state = new_state;

    // 如果进程处于SLEEPING或ZOMBIE状态，将其从调度队列中移除
    if (new_state == SLEEPING || new_state == ZOMBIE) {
        queue_lock(&sched_queue);
        queue_detach(&sched_queue, &p->schinfo.sched_node);
        queue_unlock(&sched_queue);
    }

    release_spinlock(&proc_lock);
}

// 从调度队列中选择下一个运行的进程，如果没有可运行的进程，则返回idle进程
static Proc *pick_next()
{
    // 如果调度队列为空，返回idle进程
    if (queue_empty(&sched_queue)) {
        return cpus[cpuid()].sched.idle;
    }

    // 从调度队列中选择下一个进程
    queue_lock(&sched_queue);
    ListNode *node = queue_front(&sched_queue);
    for (;;) {
        ListNode *next = node->next;
        Proc *p = container_of(node, Proc, schinfo.sched_node);

        // 如果找到了一个RUNNABLE的进程，则将其移到队列尾部，并返回
        if (p->state == RUNNABLE) {
            queue_detach(&sched_queue, node);
            queue_push(&sched_queue, node);
            queue_unlock(&sched_queue);
            return p;
        }

        // 如果已经遍历了整个队列，则break，否则下一个节点
        if (next == queue_front(&sched_queue)) {
            break;
        } else {
            node = next;
        }
    }
    queue_unlock(&sched_queue);

    // 如果没有找到RUNNABLE的进程，则返回idle进程
    return cpus[cpuid()].sched.idle;
}

// 更新 进程p 为当前CPU正在执行的进程
static void update_this_proc(Proc *p)
{
    acquire_spinlock(&proc_lock);
    cpus[cpuid()].sched.current = p;
    release_spinlock(&proc_lock);
}

// 调度器（需要调度队列的锁）
// 选择下一个进程并切换到该进程
void sched(enum procstate new_state)
{
    auto this = thisproc();

    ASSERT(this->state == RUNNING);

    update_this_state(new_state);

    auto next = pick_next();

    update_this_proc(next);

    ASSERT(next->state == RUNNABLE);

    next->state = RUNNING;

    if (next != this) {
        attach_pgdir(&next->pgdir);
        swtch(&this->kcontext, next->kcontext);
    }

    release_sched_lock();
}

u64 proc_entry(void (*entry)(u64), u64 arg)
{
    release_sched_lock();
    set_return_addr(entry); // 设置返回地址为entry
    return arg;
}
