#pragma once
#include <common/list.h>
#include <common/sem.h>
#include <fs/block_device.h>
#include <fs/defines.h>


#define OP_MAX_NUM_BLOCKS 10    // 文件系统单次可写入的最大块数

#define EVICTION_THRESHOLD 20   // 块缓存开始驱逐的阈值 (缓存中的块数超过这个值时，开始进行缓存块的回收)

// 缓存块
typedef struct {
    usize block_no;     // 硬盘块号
    ListNode node;      // 链表节点
    usize ref_cnt;      // 引用计数

    // bool acquired;

    bool pinned;            // 是否被固定 (固定则不应被驱逐)

    SleepLock lock;         // 睡眠锁 (保护valid和data) 

    bool valid;             // 数据是否有效
    
    u8 data[BLOCK_SIZE];    // 缓存块数据
} Block;


// 日志状态
typedef struct {
    
    usize rm;   // 事务剩余可写块数
    usize ts;   // 时间戳     
} OpContext;


// 缓存块操作
typedef struct {
    usize (*get_num_cached_blocks)();   // 获取已缓存块数

    Block *(*acquire)(usize block_no);  // 获取缓存块

    void (*release)(Block *block);      // 释放缓存块

    // # NOTES FOR ATOMIC OPERATIONS
    //
    // atomic operation has three states:
    // * running: this atomic operation may have more modifications.
    // * committed: this atomic operation is ended. No more modifications.
    // * checkpointed: all modifications have been already persisted to disk.
    //
    // `begin_op` creates a new running atomic operation.
    // `end_op` commits an atomic operation, and waits for it to be
    // checkpointed.


    void (*begin_op)(OpContext *ctx);               // 开始文件事务

    void (*sync)(OpContext *ctx, Block *block);     // 将缓存中的数据同步到磁盘 (确保所有脏数据块都被写入磁)

    void (*end_op)(OpContext *ctx);                 // 结束文件事务

    // # NOTES FOR BITMAP
    //
    // every block on disk has a bit in bitmap, including blocks inside bitmap!
    //
    // usually, MBR block, super block, inode blocks, log blocks and bitmap
    // blocks are preallocated on disk, i.e. those bits for them are already set
    // in bitmap. therefore when we allocate a new block, it usually returns a
    // data block. however, nobody can prevent you freeing a non-data block :)

    
    usize (*alloc)(OpContext *ctx);                 // 从硬盘中分配一个块，返回块号

    void (*free)(OpContext *ctx, usize block_no);   // 释放硬盘块
} BlockCache;

extern BlockCache bcache;


// 初始化块缓存 (block cache)
// 需要在系统崩溃后恢复日志 (从日志部分读取未提交的块并将它们写回到原始位置)
void init_bcache(const SuperBlock *sblock, const BlockDevice *device);