#pragma once
#include <common/defines.h>
#include <fs/inode.h>

#define IBUF_SIZE 128
#define C(x) ((x) - '@') // Control-x

struct console {
    SpinLock lock;          // 终端锁
    Semaphore sem;          // 终端信号量
    char buf[IBUF_SIZE];    // 终端缓冲区
    usize read_idx;         // 读取索引
    usize write_idx;        // 写入索引
    usize edit_idx;         // 编辑(光标)索引
};

void console_init();
void console_intr(char c);
isize console_write(Inode *ip, char *buf, isize n);
isize console_read(Inode *ip, char *dst, isize n);