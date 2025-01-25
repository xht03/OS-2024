#pragma once

#include <common/defines.h>
#include <common/sem.h>

#define BSIZE 512
#define B_FREE 0x0  // Buffer is free.
#define B_VALID 0x2 // Buffer has been read from disk.
#define B_DIRTY 0x4 // Buffer needs to be written to disk.

typedef struct {
    int flags;          // 标志位 B_VALID or B_DIRTY
    u8 data[BSIZE];     // 缓冲区数据
    u32 block_no;       // 硬盘编号

    int disk;           // 虚拟硬盘是否正在处理buf
    Semaphore sem;      // 信号量
    // bool done;
} Buf;
