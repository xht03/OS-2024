//
// File-system system calls implementation.
// Mostly argument checking, since we don't trust
// user code, and calls into file.c and fs.c.
//

#include <fcntl.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/sysmacros.h>
#include <sys/mman.h>
#include <stddef.h>

#include "syscall.h"
#include <aarch64/mmu.h>
#include <common/defines.h>
#include <common/spinlock.h>
#include <common/string.h>
#include <fs/file.h>
#include <fs/fs.h>
#include <fs/inode.h>
#include <fs/pipe.h>
#include <kernel/mem.h>
#include <kernel/paging.h>
#include <kernel/printk.h>
#include <kernel/proc.h>
#include <kernel/sched.h>

struct iovec {
    void *iov_base; /* Starting address. */
    usize iov_len; /* Number of bytes to transfer. */
};


// 获取文件对象(通过fd)
// 如果文件描述符无效，则返回 NULL
static struct file *fd2file(int fd)
{
    if(fd < 0 || fd >= NFILE) {
        return NULL;
    }

    struct file *f = thisproc()->oftable.files[fd];

    if(f == NULL || f->ref < 1) {
        return NULL;
    }

    return f;
}

/*
 * Allocate a file descriptor for the given file.
 * Takes over file reference from caller on success.
 */
// 给文件f分配一个文件描述符fd
// (从进程文件表中分配一个空闲的位置给 f)
int fdalloc(struct file *f)
{
    Proc *p = thisproc();

    for (int fd = 0; fd < NOFILE; fd++) {
        if (p->oftable.files[fd] == NULL) {
            p->oftable.files[fd] = f;
            return fd;
        }
    }

    return -1;
}

define_syscall(ioctl, int fd, u64 request)
{
    // 0x5413 is TIOCGWINSZ (I/O Control to Get the WINdow SIZe, a magic request
    // to get the stdin terminal size) in our implementation. Just ignore it.
    ASSERT(request == 0x5413);
    (void)fd;
    return 0;
}

define_syscall(mmap, void *addr, int length, int prot, int flags, int fd,
               int offset)
{
    /* (Final) TODO BEGIN */
    return 0;
    /* (Final) TODO END */
}

define_syscall(munmap, void *addr, size_t length)
{
    /* (Final) TODO BEGIN */
    return 0;
    /* (Final) TODO END */
}

define_syscall(dup, int fd)
{
    struct file *f = fd2file(fd);
    if (!f)
        return -1;
    fd = fdalloc(f);
    if (fd < 0)
        return -1;
    file_dup(f);
    return fd;
}

define_syscall(read, int fd, char *buffer, int size)
{
    struct file *f = fd2file(fd);
    if (!f || size <= 0 || !user_writeable(buffer, size))
        return -1;
    return file_read(f, buffer, size);
}

define_syscall(write, int fd, char *buffer, int size)
{
    struct file *f = fd2file(fd);
    if (!f || size <= 0 || !user_readable(buffer, size))
        return -1;
    return file_write(f, buffer, size);
}

define_syscall(writev, int fd, struct iovec *iov, int iovcnt)
{
    struct file *f = fd2file(fd);
    struct iovec *p;
    if (!f || iovcnt <= 0 || !user_readable(iov, sizeof(struct iovec) * iovcnt))
        return -1;
    usize tot = 0;
    for (p = iov; p < iov + iovcnt; p++) {
        if (!user_readable(p->iov_base, p->iov_len))
            return -1;
        tot += file_write(f, p->iov_base, p->iov_len);
    }
    return tot;
}

define_syscall(close, int fd)
{
    struct file *f = fd2file(fd);
    if (!f) {
        return -1;
    }
    thisproc()->oftable.files[fd] = NULL;
    file_close(f);
    return 0;
}

define_syscall(fstat, int fd, struct stat *st)
{
    struct file *f = fd2file(fd);
    if (!f || !user_writeable(st, sizeof(*st)))
        return -1;
    return file_stat(f, st);
}

define_syscall(newfstatat, int dirfd, const char *path, struct stat *st,
               int flags)
{
    if (!user_strlen(path, 256) || !user_writeable(st, sizeof(*st)))
        return -1;
    if (dirfd != AT_FDCWD) {
        printk("sys_fstatat: dirfd unimplemented\n");
        return -1;
    }
    if (flags != 0) {
        printk("sys_fstatat: flags unimplemented\n");
        return -1;
    }

    Inode *ip;
    OpContext ctx;
    bcache.begin_op(&ctx);
    if ((ip = namei(path, &ctx)) == 0) {
        bcache.end_op(&ctx);
        return -1;
    }
    inodes.lock(ip);
    stati(ip, st);
    inodes.unlock(ip);
    inodes.put(&ctx, ip);
    bcache.end_op(&ctx);

    return 0;
}

static int isdirempty(Inode *dp)
{
    usize off;
    DirEntry de;

    for (off = 2 * sizeof(de); off < dp->entry.num_bytes; off += sizeof(de)) {
        if (inodes.read(dp, (u8 *)&de, off, sizeof(de)) != sizeof(de))
            PANIC();
        if (de.inode_no != 0)
            return 0;
    }
    return 1;
}

define_syscall(unlinkat, int fd, const char *path, int flag)
{
    ASSERT(fd == AT_FDCWD && flag == 0);
    Inode *ip, *dp;
    DirEntry de;
    char name[FILE_NAME_MAX_LENGTH];
    usize off;
    if (!user_strlen(path, 256))
        return -1;
    OpContext ctx;
    bcache.begin_op(&ctx);
    if ((dp = nameiparent(path, name, &ctx)) == 0) {
        bcache.end_op(&ctx);
        return -1;
    }

    inodes.lock(dp);

    // Cannot unlink "." or "..".
    if (strncmp(name, ".", FILE_NAME_MAX_LENGTH) == 0 ||
        strncmp(name, "..", FILE_NAME_MAX_LENGTH) == 0)
        goto bad;

    usize inumber = inodes.lookup(dp, name, &off);
    if (inumber == 0)
        goto bad;
    ip = inodes.get(inumber);
    inodes.lock(ip);

    if (ip->entry.num_links < 1)
        PANIC();
    if (ip->entry.type == INODE_DIRECTORY && !isdirempty(ip)) {
        inodes.unlock(ip);
        inodes.put(&ctx, ip);
        goto bad;
    }

    memset(&de, 0, sizeof(de));
    if (inodes.write(&ctx, dp, (u8 *)&de, off, sizeof(de)) != sizeof(de))
        PANIC();
    if (ip->entry.type == INODE_DIRECTORY) {
        dp->entry.num_links--;
        inodes.sync(&ctx, dp, true);
    }
    inodes.unlock(dp);
    inodes.put(&ctx, dp);
    ip->entry.num_links--;
    inodes.sync(&ctx, ip, true);
    inodes.unlock(ip);
    inodes.put(&ctx, ip);
    bcache.end_op(&ctx);
    return 0;

bad:
    inodes.unlock(dp);
    inodes.put(&ctx, dp);
    bcache.end_op(&ctx);
    return -1;
}

/**
    @brief create an inode at `path` with `type`.

    If the inode exists, just return it.

    If `type` is directory, you should also create "." and ".." entries and link
   them with the new inode.

    @note BE careful of handling error! You should clean up ALL the resources
   you allocated and free ALL acquired locks when error occurs. e.g. if you
   allocate a new inode "/my/dir", but failed to create ".", you should free the
   inode "/my/dir" before return.

    @see `nameiparent` will find the parent directory of `path`.

    @return Inode* the created inode, or NULL if failed.
 */

// 在路径 path 下创建一个新的 inode (如果inode是目录，则还需要创建 "." 和 ".." 条目)
// type: inode 类型
// major: 设备的主设备号 (如果inode是设备类型)
// minor: 设备的次设备号 (如果inode是设备类型)
Inode *create(const char *path, short type, short major, short minor,
              OpContext *ctx)
{
    
    char name[FILE_NAME_MAX_LENGTH]; 
    Inode *dp, *ip;
    usize inode_no;

    // 获取父目录的 inode
    if ((dp = nameiparent(path, name, ctx)) == NULL) {
        return NULL;
    }

    inodes.lock(dp);        // 获取父目录的锁

    // 确保路径对应文件，当前不存在
    if ((inode_no = inodes.lookup(dp, name, NULL)) != 0) {
        inodes.unlock(dp);
        inodes.put(ctx, dp);

        ip = inodes.get(inode_no);
        inodes.lock(ip);                // 获取目录项的锁

        if (type == INODE_REGULAR && (ip->entry.type == INODE_REGULAR || ip->entry.type == INODE_DEVICE))
            return ip;

        inodes.unlock(ip);
        inodes.put(ctx, ip);
        return NULL;

    }

    // 分配新的 inode
    inode_no = inodes.alloc(ctx, type);
    if ((ip = inodes.get(inode_no)) == NULL) {
        inodes.unlock(dp);
        inodes.put(ctx, dp);
        return 0;
    };

    inodes.lock(ip);                    // 获取新 inode 的锁

    // 初始化新 inode
    ip->entry.major = major;
    ip->entry.minor = minor;
    ip->entry.num_links = 1;
    inodes.sync(ctx, ip, true);

    // 如果是目录类型，则创建 "." 和 ".." 条目
    if (type == INODE_DIRECTORY) {
        // 创建 "." 和 ".." 条目
        if (inodes.insert(ctx, ip, ".", ip->inode_no) == (usize)(-1) || 
            inodes.insert(ctx, ip, "..", dp->inode_no) == (usize)(-1)) {
            goto fail;
        }
    }

    // 插入到父目录项
    if (inodes.insert(ctx, dp, name, ip->inode_no) == (usize)(-1)) {
        goto fail;
    }

    // 如果创建的是文件夹，增加其父目录的引用 (..)
    if (type == INODE_DIRECTORY) {
        dp->entry.num_links++;
        inodes.sync(ctx, dp, true);
    }

    inodes.unlock(dp);
    inodes.put(ctx, dp);

    return ip;

fail:
    ip->entry.num_links = 0;        // 设置为无人引用，则 put 时会释放 ip
    inodes.sync(ctx, ip, true);
    inodes.unlock(ip);
    inodes.put(ctx, ip);
    inodes.unlock(dp);
    inodes.put(ctx, dp);
    return NULL;
}

define_syscall(openat, int dirfd, const char *path, int omode)
{
    int fd;
    struct file *f;
    Inode *ip;

    if (!user_strlen(path, 256))
        return -1;

    if (dirfd != AT_FDCWD) {
        printk("sys_openat: dirfd unimplemented\n");
        return -1;
    }

    OpContext ctx;
    bcache.begin_op(&ctx);
    if (omode & O_CREAT) {
        // FIXME: Support acl mode.
        ip = create(path, INODE_REGULAR, 0, 0, &ctx);
        if (ip == 0) {
            bcache.end_op(&ctx);
            return -1;
        }
    } else {
        if ((ip = namei(path, &ctx)) == 0) {
            bcache.end_op(&ctx);
            return -1;
        }
        inodes.lock(ip);
    }

    if ((f = file_alloc()) == 0 || (fd = fdalloc(f)) < 0) {
        if (f)
            file_close(f);
        inodes.unlock(ip);
        inodes.put(&ctx, ip);
        bcache.end_op(&ctx);
        return -1;
    }
    inodes.unlock(ip);
    bcache.end_op(&ctx);

    f->type = FD_INODE;
    f->ip = ip;
    f->off = 0;
    f->readable = !(omode & O_WRONLY);
    f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    return fd;
}

define_syscall(mkdirat, int dirfd, const char *path, int mode)
{
    Inode *ip;
    if (!user_strlen(path, 256))
        return -1;
    if (dirfd != AT_FDCWD) {
        printk("sys_mkdirat: dirfd unimplemented\n");
        return -1;
    }
    if (mode != 0) {
        printk("sys_mkdirat: mode unimplemented\n");
        return -1;
    }
    OpContext ctx;
    bcache.begin_op(&ctx);
    if ((ip = create(path, INODE_DIRECTORY, 0, 0, &ctx)) == 0) {
        bcache.end_op(&ctx);
        return -1;
    }
    inodes.unlock(ip);
    inodes.put(&ctx, ip);
    bcache.end_op(&ctx);
    return 0;
}

define_syscall(mknodat, int dirfd, const char *path, mode_t mode, dev_t dev)
{
    Inode *ip;
    if (!user_strlen(path, 256))
        return -1;
    if (dirfd != AT_FDCWD) {
        printk("sys_mknodat: dirfd unimplemented\n");
        return -1;
    }

    unsigned int ma = major(dev);
    unsigned int mi = minor(dev);
    printk("mknodat: path '%s', major:minor %u:%u\n", path, ma, mi);
    OpContext ctx;
    bcache.begin_op(&ctx);
    if ((ip = create(path, INODE_DEVICE, (short)ma, (short)mi, &ctx)) == 0) {
        bcache.end_op(&ctx);
        return -1;
    }
    inodes.unlock(ip);
    inodes.put(&ctx, ip);
    bcache.end_op(&ctx);
    return 0;
}


define_syscall(chdir, const char *path)
{
    /*
     * Change the cwd (current working dictionary) of current process to 'path'.
     * You may need to do some validations.
     */

    Inode *ip;
    Proc *p = thisproc();
    OpContext ctx;

    // 验证路径长度
    if (!user_strlen(path, PATH_NAME_MAX_LENGTH)) {
        return -1;
    }

    bcache.begin_op(&ctx);      //* 开始文件系统事务

    // 获取路径对应的 inode
    if ((ip = namei(path, &ctx)) == NULL) {
        bcache.end_op(&ctx);
        return -1;
    }

    inodes.lock(ip);

    // 检查 inode 类型是否为目录
    if (ip->entry.type != INODE_DIRECTORY) {
        inodes.unlock(ip);
        inodes.put(&ctx, ip);
        bcache.end_op(&ctx);
        return -1;
    }

    inodes.unlock(ip);

    inodes.put(&ctx, p->cwd);

    bcache.end_op(&ctx);        //* 结束文件系统事务

    // 更新进程的当前工作目录
    p->cwd = ip;

    return 0;    
}

define_syscall(pipe2, int pipefd[2], int flags)
{

    /* (Final) TODO BEGIN */
    return 0;
    /* (Final) TODO END */
}