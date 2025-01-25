#include "file.h"
#include <common/defines.h>
#include <common/spinlock.h>
#include <common/sem.h>
#include <fs/inode.h>
#include <common/list.h>
#include <kernel/mem.h>
#include <kernel/printk.h>
#include <fs/pipe.h>

// 全局文件表
static struct ftable ftable;

// 初始化全局文件表
void init_ftable() {
    init_spinlock(&ftable.lock);
    for(int i = 0; i < NFILE; i++) {
        ftable.files[i].type = FD_NONE;
        ftable.files[i].ref = 0;
        ftable.files[i].readable = false;
        ftable.files[i].writable = false;
        ftable.files[i].off = 0;
    }
}

// (为新进程) 初始化打开文件表
void init_oftable(struct oftable *oftable) {
    for(int i = 0; i < NFILE; i++) {
        oftable->files[i] = NULL;
    }
}

// 分配一个文件(结构体)
struct file* file_alloc() {
    acquire_spinlock(&ftable.lock);             // 获取全局文件表锁
    for (int i = 0; i < NFILE; i++) {
        if (ftable.files[i].ref == 0) {         // 找到一个未使用的文件对象
            ftable.files[i].ref = 1;
            release_spinlock(&ftable.lock);     // 释放全局文件表锁
            return &ftable.files[i];
        }
    }
    release_spinlock(&ftable.lock);
    return 0;
}

// 文件的引用数+1
struct file* file_dup(struct file* f) {
    acquire_spinlock(&ftable.lock);
    if (f->ref < 1) {
        printk("file_dup wrong: cannot duplicate a file with ref < 1\n");
        PANIC();
    }
    f->ref++;
    release_spinlock(&ftable.lock);
    return f;
}

// 关闭文件 (少文件的引用计数，当引用计数为 0 时，释放文件结构体)
void file_close(struct file* f) {

    struct file ff;     // file的副本

    acquire_spinlock(&ftable.lock);

    if(f->ref < 1) {
        printk("file_close wrong: cannot close a file twice\n");
        PANIC();
    }
    if(--f->ref > 0) {
        release_spinlock(&ftable.lock);
        return;
    }

    ff = *f;

    // 将文件结构体重置
    f->ref = 0;
    f->type = FD_NONE;
    f->readable = false;
    f->writable = false;
    f->off = 0;
    release_spinlock(&ftable.lock);

    // 根据文件类型，执行相应的关闭操作
    if(ff.type == FD_PIPE) {
        pipe_close(ff.pipe, ff.writable);
    } else if (ff.type == FD_INODE) {
        OpContext ctx;
        bcache.begin_op(&ctx);
        inodes.put(&ctx, ff.ip);
        bcache.end_op(&ctx);
    }
}

// 获取文件的元数据
int file_stat(struct file* f, struct stat* st) {
    if (f->type == FD_INODE) {
        inodes.lock(f->ip);
        stati(f->ip, st);
        inodes.unlock(f->ip);
        return 0;
    }
    return -1;
}

// 读取文件
isize file_read(struct file* f, char* addr, isize n) {
    int r = 0;

    if(f->readable == false) {
        return -1;
    }

    if(f->type == FD_PIPE) {
        r = pipe_read(f->pipe, (u64)addr, n);
    } 
    else if(f->type == FD_INODE) {
        inodes.lock(f->ip);
        if((r = inodes.read(f->ip, (u8*)addr, f->off, n)) > 0) {
            f->off += r;   
        }
        inodes.unlock(f->ip);
    }
    else {
        printk("file_read: read error.\n");
        PANIC();
    }
    return r;
}

// 写入文件
isize file_write(struct file* f, char* addr, isize n) {
    int r = 0;

    if(f->writable == false) {
        return -1;
    }

    if(f->type == FD_PIPE) {
        r = pipe_write(f->pipe, (u64)addr, n);
    } 
    else if(f->type == FD_INODE) {
        OpContext ctx;
        bcache.begin_op(&ctx);
        inodes.lock(f->ip);
        if((r = inodes.write(&ctx, f->ip, (u8*)addr, f->off, n)) > 0) {
            f->off += r;   
        }
        inodes.unlock(f->ip);
        bcache.end_op(&ctx);
    }
    else {
        printk("file_write: write error.\n");
        PANIC();
    }

    return 0;
}