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

// 获取信号量
// 获取成功返回true, 失败返回false
bool get_sem(Semaphore *sem)
{
    bool ret = false;
    acquire_spinlock(&sem->lock);
    if (sem->val > 0) {
        sem->val--;
        ret = true;
    }
    release_spinlock(&sem->lock);
    return ret;
}

// 获取信号量的值
// 获取后信号量的值变为0
int get_all_sem(Semaphore *sem)
{
    int ret = 0;
    acquire_spinlock(&sem->lock);
    if (sem->val > 0) {
        ret = sem->val;
        sem->val = 0;
    }
    release_spinlock(&sem->lock);
    return ret;
}

// 等待信号量
bool wait_sem(Semaphore *sem)
{
    acquire_spinlock(&sem->lock);
    if (--sem->val >= 0) {
        release_spinlock(&sem->lock);
        return true;
    }
    WaitData *wait = kalloc(sizeof(WaitData));
    wait->proc = thisproc();
    wait->up = false;
    _insert_into_list(&sem->sleeplist, &wait->slnode);
    acquire_sched_lock();
    release_spinlock(&sem->lock);
    sched(SLEEPING);
    acquire_spinlock(&sem->lock); // also the lock for waitdata
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

// 释放信号量，
void post_sem(Semaphore *sem)
{
    acquire_spinlock(&sem->lock);
    if (++sem->val <= 0) {
        ASSERT(!_empty_list(&sem->sleeplist));
        auto wait = container_of(sem->sleeplist.prev, WaitData, slnode);
        wait->up = true;
        _detach_from_list(&wait->slnode);
        activate_proc(wait->proc);
    }
    release_spinlock(&sem->lock);
}