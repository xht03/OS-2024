#pragma once
#include <common/list.h>
#include <common/rc.h>
#include <common/spinlock.h>
#include <fs/cache.h>
#include <fs/defines.h>


#define ROOT_INODE_NO 1     // 根目录 inode 编号

/**
    @brief an inode in memory.

    You can compare it to a `Block` because they have similar operating ways.

    @see Block
 */

// 内存中的 inode 结构
typedef struct {
    SleepLock lock;     // 睡眠锁   用于保护 inode 的元数据和内容。注意，它不保护 rc、node、valid 等运行时变量。
    RefCount rc;        // 引用计数 用于跟踪引用此inode的线程或进程的数量。与块不同，inode可以被多个线程或进程共享，因此需要引用计数。
    ListNode node;      // 链表节点
    usize inode_no;     // inode编号 注意，它与块中的block_no不同，inode_no是从inode区域开始的偏移量。
    bool valid;         // entry 是否已经从磁盘加载内存中
    InodeEntry entry;   // 磁盘上inode的副本 (在内存中)
} Inode;

/**
    @brief interface of inode layer.
 */
typedef struct {
    /**
        @brief the root inode of the file system.

        @see `init_inodes` should initialize it to a valid inode.
     */
    Inode* root;                                        // 根目录 inode

    /**
        @brief allocate a new zero-initialized inode on disk.
        
        @param type the type of the inode to allocate.

        @return the number of newly allocated inode.

        @throw panic if allocation fails (e.g. no more free inode).
     */
    usize (*alloc)(OpContext* ctx, InodeType type);     // 分配一个新的 inode (初始化为0)

    /**
        @brief acquire the sleep lock of `inode`.
        
        This method should be called before any write operation to `inode` and its
        file content.

        If the inode has not been loaded, this method should load it from disk.

        @see `unlock` - the counterpart of this method.
     */
    void (*lock)(Inode* inode);                         // 获取 inode 的睡眠锁 (任何写操作之前，都应先获取锁)

    /**
        @brief release the sleep lock of `inode`.
        
        @see `lock` - the counterpart of this method.
     */
    void (*unlock)(Inode* inode);                       // 释放 inode 的睡眠锁

    /**
        @brief synchronize the content of `inode` between memory and disk.
        
        Different from block cache, this method can either read or write the inode.

        If `do_write` is true and the inode is valid, write the content of `inode` to disk.

        If `do_write` is false and the inode is invalid, read the content of `inode` from disk.

        If `do_write` is false and the inode is valid, do nothing.

        @note here "write to disk" means "sync with block cache", not "directly
        write to underneath SD card".

        @note caller must hold the lock of `inode`.

        @throw panic if `do_write` is true and `inode` is invalid.
     */
    void (*sync)(OpContext* ctx, Inode* inode, bool do_write);      // 同步 inode 内存和磁盘内容 (需要持有锁)

    /**
        @brief get an inode by its inode number.
        
        This method should increment the reference count of the inode by one.

        @note it does NOT have to load the inode from disk!

        @see `sync` will be responsible to load the content of inode.
        
        @return the `inode` of `inode_no`. `inode->valid` can be false.

        @see `put` - the counterpart of this method.
     */
    Inode* (*get)(usize inode_no);                          // 通过 inode 编号获取 inode

    /**
        @brief truncate all contents of `inode`.
        
        This method removes (i.e. "frees") all file blocks of `inode`.

        @note do not forget to reset related metadata of `inode`, e.g. `inode->entry.num_bytes`.

        @note caller must hold the lock of `inode`.
     */
    void (*clear)(OpContext* ctx, Inode* inode);            // 清空 inode 内容，即：释放其所有的文件块 (需要持有锁)

    /**
        @brief duplicate an inode.
        
        Call this if you want to share an inode with others.

        It should increment the reference count of `inode` by one.

        @return the duplicated inode (i.e. may just return `inode`).
     */
    Inode* (*share)(Inode* inode);                          // 复制 inode

    /**
        @brief notify that you no longer need `inode`.
        
        This method is also responsible to free the inode if no one needs it:

        "No one needs it" means it is useless BOTH in-memory (`inode->rc == 0`) and on-disk
        (`inode->entry.num_links == 0`).

        "Free the inode" means freeing all related file blocks and the inode itself.

        @note do not forget `kfree(inode)` after you have done them all!

        @note caller must NOT hold the lock of `inode`. i.e. caller should have `unlock`ed it.

        @see `get` - the counterpart of this method.

        @see `clear` can be used to free all file blocks of `inode`.
     */
    void (*put)(OpContext* ctx, Inode* inode);              // 通知 inode 不再需要 (如果无人需要，则还需释放 inode)

    /**
        @brief read `count` bytes from `inode`, beginning at `offset`, to `dest`.
        
        @return how many bytes you actually read.

        @note caller must hold the lock of `inode`.
     */
    usize (*read)(Inode* inode, u8* dest, usize offset, usize count);       // 从 inode 读取数据 (需要持有锁)

    /**
        @brief write `count` bytes from `src` to `inode`, beginning at `offset`.
        
        @return how many bytes you actually write.

        @note caller must hold the lock of `inode`.
     */
    usize (*write)(OpContext* ctx,
                   Inode* inode,
                   u8* src,
                   usize offset,
                   usize count);                                            // 向 inode 写入数据 (需要持有锁)

    /**
        @brief look up an entry named `name` in directory `inode`.

        @param[out] index the index of found entry in this directory.

        @return the inode number of the corresponding inode, or 0 if not found.
        
        @note caller must hold the lock of `inode`.

        @throw panic if `inode` is not a directory.
     */
    usize (*lookup)(Inode* inode, const char* name, usize* index);          // 在 inode 中查找条目 (需要持有锁)

    /**
        @brief insert a new directory entry in directory `inode`.
        
        Add a new directory entry in `inode` called `name`, which points to inode 
        with `inode_no`.

        @return the index of new directory entry, or -1 if `name` already exists.

        @note if the directory inode is full, you should grow the size of directory inode.

        @note you do NOT need to change `inode->entry.num_links`. Another function
        to be finished in our final lab will do this.

        @note caller must hold the lock of `inode`.

        @throw panic if `inode` is not a directory.
     */
    usize (*insert)(OpContext* ctx,
                    Inode* inode,
                    const char* name,
                    usize inode_no);                                // 在 inode 中插入新的目录条目 (需要持有锁)

    /**
        @brief remove the directory entry at `index`.
        
        If the corresponding entry is not used before, `remove` does nothing.

        @note if the last entry is removed, you can shrink the size of directory inode.
        If you like, you can also move entries to fill the hole.

        @note caller must hold the lock of `inode`.

        @throw panic if `inode` is not a directory.
     */
    void (*remove)(OpContext* ctx, Inode* inode, usize index);      // 移除 inode 中的目录条目 (需要持有锁)
} InodeTree;


// inode 层函数接口
extern InodeTree inodes;


/**
    @brief initialize the inode layer.

    @note do not forget to read the root inode from disk!

    @param sblock the loaded super block.
    @param cache the initialized block cache.
 */
void init_inodes(const SuperBlock* sblock, const BlockCache* cache);    // 初始化 inode 层


Inode* namei(const char* path, OpContext* ctx);
Inode* nameiparent(const char* path, char* name, OpContext* ctx);
void stati(Inode* ip, struct stat* st);
