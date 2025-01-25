#include <kernel/mem.h>
#include <kernel/sched.h>
#include <fs/pipe.h>
#include <common/string.h>
#include <kernel/printk.h>

void init_pipe(Pipe *pi)
{
    init_spinlock(&pi->lock);
    init_sem(&pi->wlock, 1);    // 初始时，管道是空的，写操作可以立即进行
    init_sem(&pi->rlock, 0);    // 读操作则需要等待
    pi->nread = 0;
    pi->nwrite = 0;
    pi->readopen = 1;
    pi->writeopen = 1;
}

void init_read_pipe(File *readp, Pipe *pipe)
{
    readp->type = FD_PIPE;
    readp->readable = true;
    readp->writable = false;
    readp->pipe = pipe;
    readp->ref = 1;
    readp->off = 0;
}

void init_write_pipe(File *writep, Pipe *pipe)
{
    writep->type = FD_PIPE;
    writep->readable = false;
    writep->writable = true;
    writep->pipe = pipe;
    writep->ref = 1;
    writep->off = 0;
}

// 分配管道 (及其读写文件)
int pipe_alloc(File **f0, File **f1)
{
    // 分配管道结构体
    Pipe *pi = (Pipe*)kalloc(sizeof(Pipe));
    if (pi == NULL)
    {
        return -1;
    }
    init_pipe(pi);

    // 分配读文件结构体
    File *readp = file_alloc();
    if (readp == NULL)
    {
        kfree((void *)pi);
        return -1;
    }
    init_read_pipe(readp, pi);

    // 分配写文件结构体
    File *writep = file_alloc();
    if (writep == NULL)
    {
        kfree((void *)pi);
        file_close(readp);
        return -1;
    }
    init_write_pipe(writep, pi);

    *f0 = readp;
    *f1 = writep;
    return 0;
}

// 关闭管道的一端（读端或写端）
void pipe_close(Pipe *pi, int writable)
{
    acquire_spinlock(&pi->lock);

    if (writable)
    {
        pi->writeopen = 0;          // 关闭写端
        post_all_sem(&pi->rlock);
    }
    else
    {
        pi->readopen = 0;           // 关闭读端
        post_all_sem(&pi->wlock);
    }

    // 如果两端都关闭了，释放管道
    if (pi->readopen == 0 && pi->writeopen == 0)
    {
        release_spinlock(&pi->lock);
        kfree((void *)pi);
        return;
    }
    else
    {
        release_spinlock(&pi->lock);
    }
}

// 将数据(n字节)从用户空间写入管道
// addr是用户空间地址
// 返回值：已写入的字节数
int pipe_write(Pipe *pi, u64 addr, int n)
{
    int i = 0;
    Proc *p = thisproc();

    acquire_spinlock(&pi->lock);
    while(i < n) {
        // 如果读端已关闭，或者进程被杀死，则返回
        if(pi->readopen == 0 || p->killed) {
            release_spinlock(&pi->lock);
            return -1;
        }
        // 如果管道已满，唤醒等待读取数据的进程，并将当前进程睡眠，
        if(pi->nwrite == pi->nread + PIPE_SIZE) {
            post_all_sem(&pi->rlock);
            
            // sleep(&pi->wlock, &pi->lock);
            release_spinlock(&pi->lock);
            if(!_wait_sem(&pi->wlock, true)){
                return i;
            }
            acquire_spinlock(&pi->lock);
        } 
        else {
            char ch;
            if(copyin(&p->pgdir, &ch, (void *)(addr + i), 1) == -1) {
                break;
            }
            pi->data[pi->nwrite++ % PIPE_SIZE] = ch;
            i++;
        }
    }

    // 唤醒等待读取数据的进程
    post_all_sem(&pi->rlock);
    release_spinlock(&pi->lock);

    return i;
}

// 将数据(n字节)从管道读取到用户空间
// addr是用户空间地址
// 返回值：已读取的字节数
int pipe_read(Pipe *pi, u64 addr, int n)
{
    int i = 0;
    Proc *p = thisproc();

    acquire_spinlock(&pi->lock);

    // 如果写端还开着，但是管道中没有数据，则等待
    while(pi->nread == pi->nwrite && pi->writeopen) {
        if(p->killed) {
            release_spinlock(&pi->lock);
            return -1;
        }

        // sleep(&pi->rlock, &pi->lock);
        release_spinlock(&pi->lock);
        if(!_wait_sem(&pi->rlock, true)) {
            return i;
        }
        acquire_spinlock(&pi->lock);
    }

    // 读取数据 
    for(i = 0; i < n; i++) {
        if(pi->nread == pi->nwrite) {
            break;
        }
        char ch = pi->data[pi->nread++ % PIPE_SIZE];
        if (copyout(&p->pgdir, (void *)(addr + i), &ch, 1) == -1) {
            break;
        }
    }

    // 唤醒等待写入数据的进程
    post_all_sem(&pi->wlock);
    release_spinlock(&pi->lock);

    return i;
}