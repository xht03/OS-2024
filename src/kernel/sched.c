#include <aarch64/intrinsic.h>
#include <common/rbtree.h>
#include <kernel/cpu.h>
#include <kernel/mem.h>
#include <kernel/printk.h>
#include <kernel/proc.h>
#include <kernel/sched.h>

extern bool panic_flag; // 是否处于恐慌状态

extern Proc idle_proc[NCPU]; // 每个CPU的idle进程

static Queue sched_queue; // 调度队列（先拿锁，再使用）

static struct timer sched_timer[NCPU];  // 调度器的定时器

// 定时器调度函数
static void time_sched(struct timer* t) { 
    acquire_sched();
    sched(RUNNABLE); 
}

// 切换进程上下文
extern void swtch(KernelContext** old_ctx, KernelContext* new_ctx);

// 初始化调度器
void init_sched()
{
    queue_init(&sched_queue); // 初始化调度队列

    // 初始化调度定时器
    for (int i = 0; i < NCPU; i++) {
        sched_timer[i].elapse = 20; // 间隔时间
        sched_timer[i].handler = time_sched;
    }
}

// 返回当前进程的指针
Proc* thisproc() { return cpus[cpuid()].sched.proc; }

// 为每个新进程，初始化自定义的 schinfo 调度信息
void init_schinfo(struct schinfo* p) { init_list_node(&p->sched_node); }


void acquire_sched() {
    
    // 如果不是 idle 进程, 则获取当前进程锁
    if(thisproc()->idle == false) {
        acquire_spinlock(&thisproc()->lock);
    }
}
// void release_sched() { release_spinlock(&sched_lock); }


// 唤醒进程
// 如果进程状态是 RUNNING/RUNNABLE/ZOMBIE:      什么都不做 并返回false
// 如果进程状态是 UNUSED/SLEEPING:              更新RUNNABLE 添加到调度队列 并返回true
// 如果进程状态是 DEEPSLEEPING & onalert=false: 更新RUNNABLE 添加到调度队列 并返回true
// 如果进程状态是 DEEPSLEEPING & onalert=true : 什么都不做 并返回false (unalertable_wait_sem)
bool _activate_proc(Proc* p, bool onalert)
{
    acquire_spinlock(&p->lock);


    if (p->state == RUNNING || p->state == RUNNABLE || p->state == ZOMBIE) {
        release_spinlock(&p->lock); //*
        return false;
    }


    if ((p->state == SLEEPING || p->state == UNUSED)
        || (p->state == DEEPSLEEPING && !onalert)) {
        
        // 设置进程状态为RUNNABLE
        p->state = RUNNABLE;

        // 将进程加入调度队列
        queue_lock(&sched_queue);
        queue_push(&sched_queue, &p->schinfo.sched_node);
        queue_unlock(&sched_queue);

        release_spinlock(&p->lock);
        return true;
    }


    if (p->state == DEEPSLEEPING && onalert) {
        release_spinlock(&p->lock);
        return false;
    }

    printk("activate_proc: unexpected state %d\n", p->state);
    PANIC();
}

// 更新当前进程的状态为new_state (需持有进程锁)
static void update_this_state(enum procstate new_state)
{
    // 更新当前进程的状态
    Proc* p = thisproc();
    p->state = new_state;

    // 如果进程处于 SLEEPING/DEEPSLEEPING/ZOMBIE 状态，将其从调度队列中移除
    if (new_state == SLEEPING || new_state == DEEPSLEEPING || new_state == ZOMBIE) {
        queue_lock(&sched_queue);
        queue_detach(&sched_queue, &p->schinfo.sched_node);
        queue_unlock(&sched_queue);
    }
}

// 从调度队列中选择下一个运行的进程
// (并一并获取选择的进程的锁)
static Proc* pick_next()
{
    // 如果调度队列为空，返回idle进程
    if (queue_empty(&sched_queue)) {
        return &idle_proc[cpuid()];
    }

    // 从调度队列中选择下一个进程
    queue_lock(&sched_queue);

    // 再次判断队列是否为空
    // 拿锁的过程中，队列可能已经被其他CPU的进程修改
    if (queue_empty(&sched_queue)) {
        queue_unlock(&sched_queue);
        return &idle_proc[cpuid()];
    }

    ListNode* node = queue_front(&sched_queue); // 队列头部
    for (;;) {
        Proc* p = container_of(node, Proc, schinfo.sched_node);
        ListNode* next = node->next;

        // 如果找到了一个RUNNABLE的进程，则尝试获取其锁
        // (抢不到就作罢，继续下一个)
        if (p != thisproc() && p->state == RUNNABLE && try_acquire_spinlock(&p->lock)) {
            
            // 再次判断状态, 避免抢锁时被其他CPU修改
            if(p->state == RUNNABLE) { 
                queue_detach(&sched_queue, node);
                queue_push(&sched_queue, node);
                queue_unlock(&sched_queue);
                return p;
            }
            release_spinlock(&p->lock);
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
    return &idle_proc[cpuid()];
}


// 调度器（需要调度队列的锁）
// 调度到下一个进程，并将当前进程的状态更新为new_state
void sched(enum procstate new_state)
{
    struct cpu *c = &cpus[cpuid()];
    Proc* this = thisproc();
    Proc* next;
    Proc* pre;

    // 如果当前进程不是idle进程，则切换到idle进程
    if(this->idle == false) {
        
        // 如果有终止标记, 且新状态不为ZOMBIE, 则调度器直接返回
        if (this->killed && new_state != ZOMBIE)
            return;

        // 保证当前进程是 RUNNING 状态
        ASSERT(this->state == RUNNING);

        // 更新当前进程的状态为 new_state
        update_this_state(new_state);

        // 将CPU切换到idle进程
        next = &idle_proc[cpuid()];
        c->sched.proc = next;
        c->sched.pre_proc = this;   // 记录当前进程 (用于释放锁)

        // 加载idle进程的上下文
        attach_pgdir(&next->pgdir);  // 切换页表
        swtch(&this->kcontext, next->kcontext);

        // idle进程执行完毕, 切换回当前进程后，持有锁
        release_spinlock(&this->lock);
    }

    // 如果当前进程是idle进程，则选择下一个进程
    else {
        for(;;) {
            // 选择下一个进程 (并获取锁)
            next = pick_next();

            // 如果还是idle进程, 则退出执行 wfi(Wait For Interrupt)
            // (idle进程会在有中断时被唤醒)
            if(next == this) {
                break;
            }

            // 切换到下一个进程
            ASSERT(next->state == RUNNABLE);
            next->state = RUNNING;
            c->sched.proc = next;
            attach_pgdir(&next->pgdir);             // 切换页表
            set_cpu_timer(&sched_timer[cpuid()]);   // 启用调度定时器
            swtch(&this->kcontext, next->kcontext);

            // 进程执行完后，切换回idle进程
            pre = c->sched.pre_proc;
            release_spinlock(&pre->lock);  // 释放pre进程的锁
        }
    }
}

u64 proc_entry(void (*entry)(u64), u64 arg)
{
    // 释放在sched()中获取的锁
    release_spinlock(&thisproc()->lock);

    // 设置返回地址为entry
    set_return_addr(entry);
    return arg;
}
