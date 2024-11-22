#include <common/bitmap.h>
#include <common/string.h>
#include <fs/cache.h>
#include <kernel/mem.h>
#include <kernel/printk.h>
#include <kernel/proc.h>


static const SuperBlock *sblock;    // 超级块 (super block)
static const BlockDevice *device;   // 底层块设备 (块读写接口)

static SpinLock cache_lock;     // 缓存锁
static ListNode cache_head;     // 缓存块链表头

static LogHeader header;        // 日志头 (内存中的日志头副本)

struct {
    SpinLock lock;  // 日志锁
    Semaphore sem;  // 日志信号量
    usize outstanding;   // 未完成的事务数
    bool committing;    // 是否正在提交
} log;

// 从磁盘读取内容
static INLINE void device_read(Block *block) {
    device->read(block->block_no, block->data);
}

// 将内容写入磁盘
static INLINE void device_write(Block *block) {
    device->write(block->block_no, block->data);
}

// 从磁盘读取日志头
static INLINE void read_header() {
    device->read(sblock->log_start, (u8 *)&header);
}

// 将日志头写入磁盘
static INLINE void write_header() {
    device->write(sblock->log_start, (u8 *)&header);
}

// 初始化缓存块
static void init_block(Block *block) {
    block->block_no = 0;                    // 硬盘块号
    block->ref_cnt = 0;                     // 引用计数
    block->pinned = false;                  // 是否被固定
    init_list_node(&block->node);       // 初始化链表节点
    init_sleeplock(&block->lock);           // 初始化睡眠锁
    block->valid = false;                     // 数据无效
    memset(block->data, 0, sizeof(block->data));
}

// 获取已缓存块数
static usize get_num_cached_blocks() {
    usize count =0;
    for(ListNode *node = cache_head.next; node != &cache_head; node = node->next) {
        count++;
    }
    return count;
}

// 从缓存中获取块 (LRU)
static Block* cache_get(usize block_no) {

    acquire_spinlock(&cache_lock);

    usize num_cached_blocks = get_num_cached_blocks();

    // 从后往前，移除多余的缓存块
    if (num_cached_blocks >= EVICTION_THRESHOLD) {
        for(ListNode *node = cache_head.prev; node != &cache_head;) {
            auto prev = node->prev;

            Block *block = container_of(node, Block, node);

            // 如果块未被固定且引用计数为0，则释放该块
            if (!block->pinned && block->ref_cnt == 0) {
                _detach_from_list(node);
                kfree(block);
                num_cached_blocks--;
                if(num_cached_blocks < EVICTION_THRESHOLD) {
                    break;
                }
            }

            node = prev;
        }
    }


    // 遍历缓存块链表，查找指定块
    for (ListNode *node = cache_head.next; node != &cache_head; node = node->next) {
        Block *block = container_of(node, Block, node);
        if (block->block_no == block_no) {
            block->ref_cnt++;
            _detach_from_list(&block->node);
            _insert_into_list(&cache_head, &block->node);   // 将块移到链表头
            release_spinlock(&cache_lock);
            return block;
        }
    }

    // 如果未找到指定块，创建新块
    Block *block = kalloc(sizeof(Block));
    init_block(block);
    block->block_no = block_no;
    block->ref_cnt = 1;
    _insert_into_list(&cache_head, &block->node);   // 将块插入链表头
    release_spinlock(&cache_lock);
    return block;

}


// 获得并锁定缓存块
static Block *cache_acquire(usize block_no) {

    Block *block = cache_get(block_no);

    acquire_sleeplock(&block->lock);    // 获取睡眠锁

    // 如果数据无效，则从磁盘读取
    if (!block->valid) {
        device_read(block);
        block->valid = true;
    }

    return block;
}

// 释放缓存块
static void cache_release(Block *block) {

    release_sleeplock(&block->lock);    // 释放睡眠锁

    acquire_spinlock(&cache_lock);
    ASSERT(block->ref_cnt > 0);
    block->ref_cnt--;
    /*
    if (block->ref_cnt == 0) {
        _detach_from_list(&block->node);
    }
    */
    release_spinlock(&cache_lock);
}


// 硬盘: 目标块 <== 日志块
static void install_trans(bool recovering)
{
    // 遍历当前已记录的日志块
    for (usize tail = 0; tail < header.num_blocks; tail++) {
        // 锁定日志块和目标块
        Block* log_buf = cache_acquire((sblock->log_start + 1) + tail);
        Block* disk_buf = cache_acquire(header.block_no[tail]);

        // 目标块<==日志块 并写回
        memcpy(disk_buf->data, log_buf->data, BLOCK_SIZE);
        device_write(disk_buf);

        // 如果不是重启恢复, 则取消日志绑定
        if (recovering == false)
            disk_buf->pinned = false;

        //* 释放日志块和目标块
        cache_release(log_buf);
        cache_release(disk_buf);
    }
}


// 初始化文件系统，恢复事务
void init_bcache(const SuperBlock *_sblock, const BlockDevice *_device) {
    sblock = _sblock;
    device = _device;

    // 初始化缓存
    init_list_node(&cache_head);
    init_spinlock(&cache_lock);

    // 初始化日志
    init_spinlock(&log.lock);       // 初始化日志锁
    init_sem(&log.sem, 0);      // 初始化日志信号量
    log.outstanding = 0;            // 未完成的事务数
    log.committing = false;         // 是否正在提交


    read_header();                      // 日志头: 硬盘=>内存
    install_trans(true);    // 硬盘: 日志块=>目标块 (恢复事务)
    header.num_blocks = 0;              // 清空日志块
    write_header();                     // 日志头: 内存=>硬盘 (提交事务)
}


// 写日志
static void write_log() {

    // 遍历当前正在使用的日志块
    for (usize tail = 0; tail < header.num_blocks; tail++) {
        // 锁定日志块和目标块
        Block* log_buf = cache_acquire((sblock->log_start + 1) + tail);
        Block* disk_buf = cache_acquire(header.block_no[tail]);

        // 日志块<==目标块 并写回
        memcpy(log_buf->data, disk_buf->data, BLOCK_SIZE);
        device_write(log_buf); // (休眠)

        // 释放日志块和目标块
        cache_release(log_buf);
        cache_release(disk_buf);
    }
}


// 提交事务
static void commit()
{
    // 先移动数据, 再更新日志头
    if (header.num_blocks > 0) {
        write_log();        // 内存-目标块=>硬盘-日志块
        write_header();     // 日志头: 内存=>硬盘 (事务提交)

        install_trans(false);  // 硬盘: 日志块=>目标块
        header.num_blocks = 0; // 清空内存-日志数
        write_header();        // 日志头: 内存=>硬盘 (事务提交)
    }
}


// 开始文件事务
static void cache_begin_op(OpContext *ctx) {
    
    ASSERT(ctx != NULL);
    acquire_spinlock(&log.lock); //* 获取日志锁

    for(;;) {

        // 如果日志正在提交, 则等待提交完成
        if (log.committing) {
            release_spinlock(&log.lock);
            wait_sem(&log.sem);
            acquire_spinlock(&log.lock);
        }
        // 如果日志空间不足，则等待
       else if (header.num_blocks + (log.outstanding + 1) * OP_MAX_NUM_BLOCKS
            >= MIN(sblock->num_log_blocks, LOG_MAX_SIZE)) {
            
            release_spinlock(&log.lock);
            wait_sem(&log.sem);
            acquire_spinlock(&log.lock);
        }
        // 否则，开始事务
        else {
            log.outstanding++;              // 未完成的事务数+1
            ctx->rm = OP_MAX_NUM_BLOCKS;    // 事务剩余可写块数
            break;
        }
    }

    release_spinlock(&log.lock); //* 释放日志锁
}


// 结束文件事务
static void cache_end_op(OpContext *ctx) {
    
    ASSERT(ctx != NULL);
    ctx->rm = 0;

    int do_commit = false;              // 是否提交事务

    acquire_spinlock(&log.lock);        // 锁定日志

    log.outstanding--;                  // 未完成的事务数-1

    ASSERT(log.committing == false);    // 确保没有正在提交

    // 如果未完成的事务数为0, 则提交事务
    if (log.outstanding == 0) {
        do_commit = true;
        log.committing = true;
    }
    // 否则，唤醒等待的线程
    else {
        post_sem(&log.sem);
    }

    release_spinlock(&log.lock);        // 释放日志锁

    // 如果要提交事务
    if (do_commit) {
        commit();                       // (内存-目标块)=>(硬盘-日志块)=>(硬盘-目标块)
        acquire_spinlock(&log.lock);
        log.committing = false;
        post_sem(&log.sem);
        release_spinlock(&log.lock);
    }
}



// 同步缓存块 (写回日志)
static void cache_sync(OpContext *ctx, Block *block) {
    
    // 如果不处于事务 则直接写回
    if (ctx == NULL) {
        device_write(block);
        return;
    }

    acquire_spinlock(&log.lock); //* 获取日志锁

    ASSERT(header.num_blocks + 1 < sblock->num_log_blocks); // 确保日志空间足够
    ASSERT(log.outstanding >= 1);                           // 确保当前在事务中

    // 遍历检查是否有日志
    bool havelog = false;
    for (usize i = 0; i < header.num_blocks; i++)
        if (header.block_no[i] == block->block_no) {
            havelog = true;
            break;
        }

    // 如果不在日志, 则添加
    if (havelog == false) {
        ASSERT(ctx->rm >= 1); // 确保有剩余可写块数
        ctx->rm--;            // 减少剩余可写块数
        block->pinned = true; // 绑定日志
        header.block_no[header.num_blocks] = block->block_no;
        header.num_blocks++;
    }

    release_spinlock(&log.lock); //* 释放日志锁
}



// 分配硬盘块，返回块号
static usize cache_alloc(OpContext *ctx) {
    // 遍历所有的位图分区
    for (usize part = 0; part < sblock->num_blocks; part += BIT_PER_BLOCK) {
        
        Block* bp = cache_acquire(BBLOCK(part, sblock)); // 锁定位图块

        // 遍历该分区的所有位
        for (usize bi = 0; bi < BIT_PER_BLOCK && part + bi < sblock->num_blocks; bi++) {
            u8 mask = 1 << (bi % 8);

            // 如果当前位是空闲的
            if ((bp->data[bi / 8] & mask) == 0) {
                bp->data[bi / 8] |= mask; // 标记此位
                cache_sync(ctx, bp);      // 写回日志
                cache_release(bp);        // 释放位图块

                // 分配新块并清空数据
                usize bno = part + bi;
                Block* block = cache_acquire(bno);  // 锁定分配块
                memset(block->data, 0, BLOCK_SIZE); // 清空数据
                cache_sync(ctx, block);             // 写回日志
                cache_release(block);               // 释放分配块
                return bno;
            }
        }
        cache_release(bp); // 释放位图块
    }

    PANIC(); // 硬盘无空闲块
}

// 释放硬盘块
static void cache_free(OpContext *ctx, usize block_no) {
    usize bi = block_no % BIT_PER_BLOCK;
    u8 mask = 1 << (bi % 8);
    Block* bp = cache_acquire(BBLOCK(block_no, sblock)); // 锁定位图块

    bp->data[bi / 8] &= ~mask; // 清除标记
    cache_sync(ctx, bp);       // 写回日志
    cache_release(bp);         // 释放位图块
}

BlockCache bcache = {
    .get_num_cached_blocks = get_num_cached_blocks,
    .acquire = cache_acquire,
    .release = cache_release,
    .begin_op = cache_begin_op,
    .sync = cache_sync,
    .end_op = cache_end_op,
    .alloc = cache_alloc,
    .free = cache_free,
};