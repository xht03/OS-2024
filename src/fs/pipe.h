#pragma once

#include <common/spinlock.h>
#include <common/defines.h>
#include <fs/file.h>
#include <common/sem.h>

#define PIPE_SIZE 512   // 管道(缓冲区)大小

typedef struct pipe {
    SpinLock lock;              // 管道锁
    Semaphore wlock, rlock;     // 写锁和读锁
    char data[PIPE_SIZE];       // 管道数据
    u32 nread;                  // 已读取字节数
    u32 nwrite;                 // 已写入字节数
    int readopen;               // 读文件描述符是否仍然打开
    int writeopen;              // 写文件描述符是否仍然打开
} Pipe;

int pipe_alloc(File **f0, File **f1);
void pipe_close(Pipe *pi, int writable);
int pipe_write(Pipe *pi, u64 addr, int n);
int pipe_read(Pipe *pi, u64 addr, int n);
