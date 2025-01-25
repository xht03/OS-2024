#pragma once

#include <common/defines.h>
#include <common/sem.h>
#include <fs/defines.h>
#include <fs/fs.h>
#include <fs/inode.h>
#include <sys/stat.h>
#include <common/list.h>

#define NFILE 65536     // maximum number of open files in the whole system (系统中最多可以同时打开 2^16 个文件)
#define NOFILE 64       // maximum number of open files per process (每个进程最多可以打开 64 个文件)


typedef struct file {
    enum { FD_NONE, FD_PIPE, FD_INODE } type;   // 文件类型 (设备被视为 FD_INODE 类型的文件)
    int ref;                                    // 引用计数
    bool readable, writable;                    // 是否可读/写
    union {                                     // 对应文件的指针
        struct pipe* pipe;
        Inode* ip;
    };
    usize off;                                  // 文件偏移量 (对于管道，这是已写入或读取的字节数)
} File;


// 全局文件表
struct ftable {
    SpinLock lock;          // 文件表锁 (避免多个进程同时访问文件表)
    File files[NFILE];      // 全局文件数组
};

// 进程打开的文件表
struct oftable {
    File *files[NOFILE];     // 文件指针数组 (指向打开的文件的结构体)
};



void init_ftable();                     // 初始化全局文件表
void init_oftable(struct oftable*);     // 初始化进程的打开文件表

// 分配一个文件(结构体)
// 在全局文件表中查找一个未使用的文件对象，并将其引用计数设置为1
struct file* file_alloc();

/**
    @brief duplicate a file object by increasing its reference count.
    
    @return struct file* the same file object.

    @see `inode_share` does the similar thing for inode.
 */
// 复制文件
struct file* file_dup(struct file* f);

/**
    @brief decrease the reference count of a file object.

    If f->ref == 0, really close the file and put the inode (or close the pipe).

    @note since `cache.end_op` may sleep, you should not hold any lock (I mean, the lock for `ftable`)
    when calling `end_op`! Before you put the inode, release the lock first.

    @see `inode_put` does the similar thing for inode.
 */
// 关闭文件
void file_close(struct file* f);

/**
    @brief read the metadata of a file.

    You do not need to completely implement this method by yourself. Just call `stati`.
    
    @param[out] st the stat struct to be filled.
    @return int 0 on success, or -1 on error.

    @see `stati` will fill `st` for an inode.
 */
// 获取文件元数据
int file_stat(struct file* f, struct stat* st);

/**
    @brief read the content of `f` with range [f->off, f->off + n).

    
    @param[out] addr the buffer to be filled.
    @param n the number of bytes to read.
    @return isize the number of bytes actually read. -1 on error.
 */
// 读取文件
isize file_read(struct file* f, char* addr, isize n);

/**
    @brief write the content of `f` with range [f->off, f->off + n).

    @param addr the buffer to be written.
    @param n the number of bytes to write.
    @return isize the number of bytes actually written. -1 on error.
*/
// 写入文件
isize file_write(struct file* f, char* addr, isize n);