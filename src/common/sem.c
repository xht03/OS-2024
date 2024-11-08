#include <common/sem.h>
#include <kernel/mem.h>
#include <kernel/sched.h>
#include <kernel/printk.h>
#include <common/list.h>


// 初始化信号量
void init_sem(Semaphore *sem, int val)
{
    sem->val = val;
    init_spinlock(&sem->lock);
    init_list_node(&sem->sleeplist);
}

void _lock_sem(Semaphore *sem)
{
    acquire_spinlock(&sem->lock);
}

void _unlock_sem(Semaphore *sem)
{
    release_spinlock(&sem->lock);
}

bool _get_sem(Semaphore *sem)
{
    bool ret = false;
    if (sem->val > 0) {
        sem->val--;
        ret = true;
    }
    return ret;
}

int _query_sem(Semaphore *sem)
{
    return sem->val;
}

int get_all_sem(Semaphore *sem)
{
    int ret = 0;
    _lock_sem(sem);
    if (sem->val > 0) {
        ret = sem->val;
        sem->val = 0;
    }
    _unlock_sem(sem);
    return ret;
}

int post_all_sem(Semaphore *sem)
{
    int ret = -1;
    _lock_sem(sem);
    do
        _post_sem(sem), ret++;
    while (!_get_sem(sem));
    _unlock_sem(sem);
    return ret;
}


// 等待信号量sem
// 如果是被唤醒的, 返回true
// 如果是自己醒来的, 返回false
// 如果信号量的值 >= 0，则表示资源可用，当前进程可以继续执行；
// 如果信号量的值 < 0，则表示资源不可用，当前进程需要进入等待队列并睡眠，直到信号量的值增加。
bool _wait_sem(Semaphore *sem, bool alertable)
{
    // 尝试获取信号量，如果信号量的值大于等于0，表示资源可用，释放自旋锁并返回 true
    if (--sem->val >= 0) {
        release_spinlock(&sem->lock);
        return true;
    }

    // 如果信号量的值小于0，表示资源不可用，当前进程需要进入等待队列并睡眠
    WaitData *wait = kalloc(sizeof(WaitData));
    wait->proc = thisproc();
    wait->up = false;
    _insert_into_list(&sem->sleeplist, &wait->slnode);
    
    // 获取调度器锁并释放信号量的自旋锁 
    // 将当前进程设置为睡眠状态并调用调度器选择下一个进程
    acquire_sched_lock();
    release_spinlock(&sem->lock);
    sched(alertable ? SLEEPING : DEEPSLEEPING);
    acquire_spinlock(&sem->lock); // also the lock for waitdata

    // 检查当前进程是否被唤醒
    // 当前进程已经被唤醒，可能是由于其他进程调用了 post_sem 函数
    // 当前进程没有被唤醒，能是由于其他原因（如超时或被中断），需要增加信号量的值并从等待队列中移除该进程
    if (!wait->up) // wakeup by other sources
    {
        ASSERT(++sem->val <= 0);
        _detach_from_list(&wait->slnode);
    }

    release_spinlock(&sem->lock);
    bool ret = wait->up;
    kfree(wait);
    return ret;
}


void _post_sem(Semaphore *sem)
{
    if (++sem->val <= 0) {
        ASSERT(!_empty_list(&sem->sleeplist));
        auto wait = container_of(sem->sleeplist.prev, WaitData, slnode);
        wait->up = true;
        _detach_from_list(&wait->slnode);
        activate_proc(wait->proc);
    }
}