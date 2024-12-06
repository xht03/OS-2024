#include <common/string.h>
#include <fs/inode.h>
#include <kernel/mem.h>
#include <kernel/printk.h>


static const SuperBlock* sblock;    // 超级块
static const BlockCache* cache;     // 块缓存
static SpinLock lock;       // inode 全局锁 (可以理解为：inode 链表锁)
static ListNode head;       // inode 链表头 (内存中所有的 inode)


// 查询 inode_no 对应的块号
static INLINE usize to_block_no(usize inode_no) {
    return sblock->inode_start + (inode_no / (INODE_PER_BLOCK));
}


// 获取 inode (根据 inode 编号和块指针)
static INLINE InodeEntry* get_entry(Block* block, usize inode_no) {
    return ((InodeEntry*)block->data) + (inode_no % INODE_PER_BLOCK);
}


// 获取间接块中的地址数组指针
static INLINE u32* get_addrs(Block* block) {
    return ((IndirectBlock*)block->data)->addrs;
}


// 初始化 inode 树
void init_inodes(const SuperBlock* _sblock, const BlockCache* _cache) {

    init_spinlock(&lock);       // 初始化 inode 全局锁
    init_list_node(&head);      // 初始化 inode 列表
    sblock = _sblock;           // 初始化超级块
    cache = _cache;             // 初始化块缓存

    // 初始化根目录 inode (如果存在，则获取之)
    if (ROOT_INODE_NO < sblock->num_inodes)
        inodes.root = inodes.get(ROOT_INODE_NO);
    else
        printk("(warn) init_inodes: no root inode.\n");
}

// 初始化内存中的 inode
static void init_inode(Inode* inode) {

    init_sleeplock(&inode->lock);   // 初始化 inode 睡眠锁
    init_rc(&inode->rc);            // 初始化 inode 引用计数 (为 0)
    init_list_node(&inode->node);   // 初始化 inode 链表节点
    inode->inode_no = 0;
    inode->valid = false;
}

// 在磁盘上分配一个新的 inode (初始化为 0)
static usize inode_alloc(OpContext* ctx, InodeType type) {
    ASSERT(type != INODE_INVALID);

    // 从 inode 区域中找到一个空闲的 inode
    for (usize i = ROOT_INODE_NO; i < sblock->num_inodes; i++) {
        
        usize block_no = to_block_no(i);                    // 获取 inode 对应的块号
        Block* block = cache->acquire(block_no);            // 获取缓存块
        InodeEntry* inode_entry = get_entry(block, i);      // 获取 inode 对应的 InodeEntry 指针

        if (inode_entry->type == INODE_INVALID) {
            memset(inode_entry, 0, sizeof(InodeEntry));     // 清空 inode_entry
            inode_entry->type = type;                       // 设置 inode 类型
            cache->sync(ctx, block);                        // 同步 inode_entry 到磁盘
            cache->release(block);                          // 释放缓存块
            return i;
        }

        cache->release(block);  // 释放缓存块
    }

    PANIC();
}


// 同步 inode 内存和磁盘内容
// do_write=true  && valid=true : 硬盘<==内存
// do_write=false && valid=false: 内存<==硬盘
// do_write=false && valid=true : 什么都不做
// do_write=true  && valid=false: PANIC
static void inode_sync(OpContext* ctx, Inode* inode, bool do_write) {
    
    ASSERT(inode != NULL);
    ASSERT(inode->rc.count > 0);    // 确保 inode 有被引用 (否则同步无意义)

    // 如果是：内存==>磁盘
    if (do_write && inode->valid) {
        Block* block = cache->acquire(to_block_no(inode->inode_no));    // 获取 inode 所在的块
        InodeEntry* entry = get_entry(block, inode->inode_no);          // 获取 inode 对应的 InodeEntry 指针
        
        *entry = inode->entry;                                          // inode 写入磁盘 
        cache->sync(ctx, block);                                        // 同步缓存块 (从内存到磁盘)
        cache->release(block);                                          // 释放缓存块
    }
    // 如果是：磁盘==>内存
    else if (!do_write && !inode->valid) {
        Block* block = cache->acquire(to_block_no(inode->inode_no));
        InodeEntry* entry = get_entry(block, inode->inode_no);

        inode->entry = *entry;                                          // inode 读入内存
        cache->release(block);                                          // 释放缓存块
        
        inode->valid = true;
    }
    // 其余情形
    else if (do_write && !inode->valid) {
        PANIC();
    }
    else if (!do_write && inode->valid) {
        return;
    }
}


// 锁定 inode
static void inode_lock(Inode* inode) {

    ASSERT(inode != NULL);
    ASSERT(inode->rc.count > 0);        // 保证 inode 有效
    
    acquire_sleeplock(&inode->lock);    // 获取 inode 睡眠锁

    inode_sync(NULL, inode, false);     // 如果 inode 未加载到内存, 则加载数据
}

// 解锁 inode
static void inode_unlock(Inode* inode) {

    ASSERT(inode != NULL);
    ASSERT(inode->rc.count > 0);        // 保证 inode 有效
    
    release_sleeplock(&inode->lock);    // 释放 inode 睡眠锁
}



// 获取 inode
static Inode* inode_get(usize inode_no) {

    ASSERT(inode_no > 0);
    ASSERT(inode_no < sblock->num_inodes);      // 确保 inode_no 合法

    acquire_spinlock(&lock);

    // 遍历链表查找 inode
    for (ListNode* node = head.next; node != &head; node = node->next) {
        Inode* inode = container_of(node, Inode, node);
        if (inode->inode_no == inode_no) {
            increment_rc(&inode->rc);
            release_spinlock(&lock);
            return inode;
        }
    }

    // 如果未找到，则分配新的 inode
    Inode* inode = kalloc(sizeof(Inode));
    init_inode(inode);
    inode->inode_no = inode_no;
    inode->rc.count = 1;
    _insert_into_list(&head, &inode->node);
    release_spinlock(&lock);
    return inode;
}


// 清空 inode 所指向的文件块
static void inode_clear(OpContext* ctx, Inode* inode) {

    // 释放直接块
    for (usize i = 0; i < INODE_NUM_DIRECT; i++) {
        if (inode->entry.addrs[i] != 0) {
            cache->free(ctx, inode->entry.addrs[i]);
            inode->entry.addrs[i] = 0;
        }
    }

    // 释放间接块
    if (inode->entry.indirect != 0) {
        Block* block = cache->acquire(inode->entry.indirect);
        u32* addrs = get_addrs(block);

        for (usize i = 0; i < INODE_NUM_INDIRECT; i++) {
            if (addrs[i] != 0) {
                cache->free(ctx, addrs[i]);
            }
        }
        cache->release(block);

        cache->free(ctx, inode->entry.indirect);
        inode->entry.indirect = 0;
        
    }


    inode->entry.num_bytes = 0;     // 文件大小清零
    inode_sync(ctx, inode, true);   // 同步 inode 到磁盘
}


// 拷贝 inode
static Inode* inode_share(Inode* inode) {

    acquire_spinlock(&lock);
    increment_rc(&inode->rc);   // 增加引用计数
    release_spinlock(&lock);

    return inode;
}


// 释放 inode (通告 inode 不再需要)
static void inode_put(OpContext* ctx, Inode* inode) {

    acquire_spinlock(&lock);

    // 如果在自己释放后，inode 无人引用
    if (inode->rc.count == 1 && inode->entry.num_links == 0) {

        // 清空 inode
        acquire_sleeplock(&inode->lock);

        if(inode->valid) {
            inode_clear(ctx, inode);    // 清空 inode 所指向的文件块
        }
        inode->entry.type = INODE_INVALID;  // 设置 inode 为无效
        inode->valid = true;
        inode_sync(ctx, inode, true);       // 同步 inode 到磁盘
        inode->valid = false;

        release_sleeplock(&inode->lock);

        _detach_from_list(&inode->node);
        kfree(inode);
    }

    decrement_rc(&inode->rc);   // 减少引用计数
    release_spinlock(&lock);
}

/**
    @brief get which block is the offset of the inode in.

    e.g. `inode_map(ctx, my_inode, 1234, &modified)` will return the block_no
    of the block that contains the 1234th byte of the file
    represented by `my_inode`.

    If a block has not been allocated for that byte, `inode_map` will
    allocate a new block and update `my_inode`, at which time, `modified`
    will be set to true.

    HOWEVER, if `ctx == NULL`, `inode_map` will NOT try to allocate any new block,
    and when it finds that the block has not been allocated, it will return 0.
    
    @param[out] modified true if some new block is allocated and `inode`
    has been changed.

    @return usize the block number of that block, or 0 if `ctx == NULL` and
    the required block has not been allocated.

    @note the caller must hold the lock of `inode`.
 */


// 获取 inode 中指定偏移量的所在的块号
static usize inode_map(OpContext* ctx, Inode* inode, usize offset, bool* modified) {
    
    // ASSERT(inode->rc.count > 0);
    // ASSERT(inode->valid);

    InodeEntry* entry = &inode->entry;
    usize block_no = 0;
    usize block_index = offset / BLOCK_SIZE;
    usize indirect_index;

    // 如果是直接块
    if (block_index < INODE_NUM_DIRECT) {
        block_no = entry->addrs[block_index];

        // 如果块还未分配 (块号为 0)，则需要分配新的块
        if (block_no == 0 && ctx != NULL) {
            // block_no = cache_alloc(ctx);
            block_no = cache->alloc(ctx);
            entry->addrs[block_index] = block_no;
            *modified = true;
        }
    }
    // 如果是间接块
    else {
        block_index -= INODE_NUM_DIRECT;    // 计算间接块的索引

        // 如果间接块还未分配 (块号为 0)，则需要分配新的间接块
        if (entry->indirect == 0 && ctx != NULL) {
            // entry->indirect = cache_alloc(ctx);             // 新的间接块 (还未写入任何数据，不需要同步到磁盘)
            entry->indirect = cache->alloc(ctx);             // 新的间接块 (还未写入任何数据，不需要同步到磁盘)
            *modified = true;
        }

        // 间接块
        if (entry->indirect != 0) {
            // Block* block = cache_acquire(entry->indirect);  // 获取间接块
            Block* block = cache->acquire(entry->indirect);  // 获取间接块
            u32* addrs = get_addrs(block);                  // 获取间接块中的地址数组指针
            block_no = addrs[block_index];                  // 获取块号

            // 如果块还未分配 (块号为 0)，则需要分配新的块
            if (block_no == 0 && ctx != NULL) {
                // block_no = cache_alloc(ctx);
                block_no = cache->alloc(ctx);
                addrs[block_index] = block_no;
                *modified = true;
                // cache_sync(ctx, block);
                cache->sync(ctx, block);
            }
            // cache_release(block);
            cache->release(block);
        }
    }

    return block_no;
}


// 从 inode 读取数据 (caller 需要持有锁)
static usize inode_read(Inode* inode, u8* dest, usize offset, usize count) {
    InodeEntry* entry = &inode->entry;

    // 如果读取的数据超出文件大小
    if (count + offset > entry->num_bytes)
        count = entry->num_bytes - offset;

    usize end = offset + count;

    // 确保读取的数据在文件范围内
    ASSERT(offset <= entry->num_bytes);
    ASSERT(end <= entry->num_bytes);
    ASSERT(offset <= end);

    
    usize total_read = 0;   // 总共读取的字节数

    while (offset < end) {
        usize block_index = offset / BLOCK_SIZE;                                // 块索引
        usize block_offset = offset % BLOCK_SIZE;                               // 块内偏移
        usize bytes_to_read = MIN(BLOCK_SIZE - block_offset, end - offset);     // 本次读取的字节数

        usize block_no = inode_map(NULL, inode, offset, NULL);                  // 获取当前偏移量所在的块号

        // 如果块号为 0，则说明块还未分配，直接填充 0
        if (block_no == 0) {
            memset(dest + total_read, 0, bytes_to_read);
        } 
        // 否则，从缓存块中读取块数据
        else {
            // Block* block = cache_acquire(block_no);
            Block* block = cache->acquire(block_no);
            memcpy(dest + total_read, block->data + block_offset, bytes_to_read);
            // cache_release(block);
            cache->release(block);
        }

        offset += bytes_to_read;
        total_read += bytes_to_read;
    }
    return total_read;
}


// 向 inode 写入数据 (caller 需要持有锁)
static usize inode_write(OpContext* ctx, Inode* inode, u8* src, usize offset, usize count) {
    InodeEntry* entry = &inode->entry;
    usize end = offset + count;

    // 确保写入数据的位置合法
    ASSERT(offset <= entry->num_bytes);
    ASSERT(end <= INODE_MAX_BYTES);
    ASSERT(offset <= end);

    usize total_written = 0;    // 总共写入的字节数
    bool modified = false;

    while (offset < end) {
        usize block_index = offset / BLOCK_SIZE;                                // 块索引
        usize block_offset = offset % BLOCK_SIZE;                               // 块内偏移
        usize bytes_to_write = MIN(BLOCK_SIZE - block_offset, end - offset);    // 本次写入的字节数
        usize block_no = inode_map(ctx, inode, offset, &modified);              // 获取当前偏移量所在的块号 (inode_map会处理块未分配的情况)

        // Block* block = cache_acquire(block_no);
        Block* block = cache->acquire(block_no);
        memcpy(block->data + block_offset, src + total_written, bytes_to_write);
        // cache_sync(ctx, block);
        cache->sync(ctx, block);
        // cache_release(block);
        cache->release(block);

        offset += bytes_to_write;
        total_written += bytes_to_write;
    }

    // 更新文件大小
    if (end > entry->num_bytes) {
        entry->num_bytes = end;
        modified = true;
    }

    // 同步 inode 到磁盘
    if (modified) {
        inode_sync(ctx, inode, true);
    }

    return total_written;
}


// 在 inode 目录中查找条目 index (caller 需要持有锁)
static usize inode_lookup(Inode* inode, const char* name, usize* index) {
    InodeEntry* entry = &inode->entry;
    ASSERT(entry->type == INODE_DIRECTORY);     // 确保 inode 是目录

    DirEntry de;
    usize off;
    for (off = 0; off < entry->num_bytes; off += sizeof(de)) {
        // 读取目录项
        if (inode_read(inode, (u8*)&de, off, sizeof(de)) != sizeof(de)) {
            printk("inode_lookup: read error.\n");
            PANIC();
        }

        // 如果目录项未使用，则跳过
        if (de.inode_no == 0)
            continue;

        // 如果找到目录项
        if (strncmp(name, de.name, FILE_NAME_MAX_LENGTH) == 0) {
            
            if (index)
                *index = off / sizeof(de);
            return de.inode_no;
        }
    }

    return 0;

}


// 在目录 inode 中插入一个新的目录项 (caller 需要持有锁)
static usize inode_insert(OpContext* ctx, Inode* inode, const char* name, usize inode_no) {
    InodeEntry* entry = &inode->entry;
    ASSERT(entry->type == INODE_DIRECTORY);     // 确保 inode 是目录

    
    DirEntry de;
    usize off;

    // 检查目录项是否已存在
    for (off = 0; off < entry->num_bytes; off += sizeof(de)) {
        if (inode_read(inode, (u8*)&de, off, sizeof(de)) != sizeof(de)) {
            printk("inode_insert: read error.\n");
            PANIC();
        }

        if (de.inode_no != 0 && strncmp(name, de.name, FILE_NAME_MAX_LENGTH) == 0) {
            return -1;  // 目录项已存在
        }
    }

    // 查找空闲目录项
    for (off = 0; off < entry->num_bytes; off += sizeof(de)) {
        // 读取目录项
        if (inode_read(inode, (u8*)&de, off, sizeof(de)) != sizeof(de)) {
            printk("inode_insert: read error.\n");
            PANIC();
        }

        // 找到空闲目录项
        if (de.inode_no == 0)
            break;
    }

    // 如果目录已满，则需要扩展目录
    if (off >= entry->num_bytes) {
        de.inode_no = 0;
        strncpy(de.name, "", FILE_NAME_MAX_LENGTH);
        if (inode_write(ctx, inode, (u8*)&de, off, sizeof(de)) != sizeof(de)) {
            printk("inode_insert: write error.\n");
            PANIC();
        }
        entry->num_bytes += sizeof(de);
    }

    strncpy(de.name, name, FILE_NAME_MAX_LENGTH);
    de.inode_no = inode_no;

    // 写入目录项
    if (inode_write(ctx, inode, (u8*)&de, off, sizeof(de)) != sizeof(de)) {
        printk("inode_insert: write error.\n");
        PANIC();
    }

    return off / sizeof(de);
}

// 从目录 inode 中删除目录项 (caller 需要持有锁)
static void inode_remove(OpContext* ctx, Inode* inode, usize index) {
    InodeEntry* entry = &inode->entry;
    ASSERT(entry->type == INODE_DIRECTORY);     // 确保 inode 是目录

    DirEntry de;
    usize off = index * sizeof(de);

    if (inode_read(inode, (u8*)&de, off, sizeof(de)) != sizeof(de)) {
        printk("inode_remove: read error.\n");
        PANIC();
    }

    // 如果目录项未使用，则不执行任何操作
    if (de.inode_no == 0) {
        return;
    }

    // 清空目录项
    memset(&de, 0, sizeof(de));

    if (inode_write(ctx, inode, (u8*)&de, off, sizeof(de)) != sizeof(de)) {
        printk("inode_remove: write error.\n");
        PANIC();
    }

    // 如果删除的是最后一个目录项，则需要缩小目录大小
    if (off + sizeof(de) == entry->num_bytes) {
        entry->num_bytes -= sizeof(de);
    }
}

InodeTree inodes = {
    .alloc = inode_alloc,
    .lock = inode_lock,
    .unlock = inode_unlock,
    .sync = inode_sync,
    .get = inode_get,
    .clear = inode_clear,
    .share = inode_share,
    .put = inode_put,
    .read = inode_read,
    .write = inode_write,
    .lookup = inode_lookup,
    .insert = inode_insert,
    .remove = inode_remove,
};