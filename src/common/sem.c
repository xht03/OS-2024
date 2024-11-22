#include <common/sem.h>
#include <kernel/mem.h>
#include <kernel/sched.h>
#include <kernel/printk.h>
#include <common/list.h>


// 函数名前有下划线的：没有加锁
// 函数名前没有下划线的：有锁版本


// 初始化信号量
void init_sem(Semaphore *sem, int val)
{
    sem->val = val;
    init_spinlock(&sem->lock);
    init_list_node(&sem->sleeplist);
}


void _lock_sem(Semaphore *sem) { acquire_spinlock(&sem->lock); }
void _unlock_sem(Semaphore *sem) { release_spinlock(&sem->lock); }


// 尝试获取信号量sem（调用时需要先拿锁）
bool _get_sem(Semaphore *sem)
{
    bool ret = false;
    if (sem->val > 0) {
        sem->val--;
        ret = true;
    }
    return ret;
}


int _query_sem(Semaphore *sem) { return sem->val; }


// 获取信号量sem的所有值
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
    // 尝试获取信号量
    // 如果资源可用，释放自旋锁并返回 true
    if (--sem->val >= 0) {
        release_spinlock(&sem->lock);
        return true;
    }


    // 如果资源不可用，当前进程需要进入等待队列并睡眠
    WaitData *wait = kalloc(sizeof(WaitData));
    wait->proc = thisproc();
    wait->up = false;
    _insert_into_list(&sem->sleeplist, &wait->slnode);
    

    // 先获取调度器的锁，再释放信号量的锁
    // 将当前进程设置为睡眠状态并调用调度器选择下一个进程
    acquire_sched();
    release_spinlock(&sem->lock);
    sched(alertable ? SLEEPING : DEEPSLEEPING);
    
    
    // 当前进程被唤醒后，重新获取信号量的锁
    acquire_spinlock(&sem->lock);


    // 如果不是被信号量唤醒的
    if (!wait->up) // wakeup by other sources
    {
        ASSERT(++sem->val <= 0);
        _detach_from_list(&wait->slnode);
    }


    // 被唤醒
    release_spinlock(&sem->lock);   // 释放信号量锁
    bool ret = wait->up;
    kfree(wait);
    return ret;
}

// 释放信号量sem，唤醒一个等待的进程
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