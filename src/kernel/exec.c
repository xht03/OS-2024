#include <elf.h>
#include <common/string.h>
#include <common/defines.h>
#include <kernel/console.h>
#include <kernel/proc.h>
#include <kernel/sched.h>
#include <kernel/syscall.h>
#include <kernel/pt.h>
#include <kernel/mem.h>
#include <kernel/paging.h>
#include <aarch64/trap.h>
#include <fs/file.h>
#include <fs/inode.h>
#include <kernel/printk.h>

#define USER_STACK_TOP 0x800000000000
#define USER_STACK_SIZE 0x800000
#define RESERVE_SIZE 0x40

extern int fdalloc(struct file *f);

static int loadseg(struct pgdir* pagetable, u64 va, Inode* mip, u64 offset, u64 sz);

// 在当前进程的上下文中执行一个新的程序
// path: 可执行文件路径
// argv: 参数列表
// envp: 环境变量列表
int execve(const char *path, char *const argv[], char *const envp[])
{
    OpContext ctx;
    bcache.begin_op(&ctx); //* 事务开始

    // 获取路径对应inode
    Inode* mip;
    if ((mip = namei(path, &ctx)) == NULL) {
        bcache.end_op(&ctx); //* 事务结束
        return -1;
    }

    inodes.lock(mip); //** 获取inode锁

    // 读取并检查ELF文件头
    Elf64_Ehdr elf;
    if (inodes.read(mip, (u8*)&elf, 0, sizeof(elf)) != sizeof(elf))
        PANIC();
    if (elf.e_ident[0] != ELFMAG0 || elf.e_ident[1] != ELFMAG1 || elf.e_ident[2] != ELFMAG2
        || elf.e_ident[3] != ELFMAG3)
        PANIC();

    // ------------------------------------------------

    // 创建一个新的用户页表
    struct pgdir pd;
    init_pgdir(&pd);

    // 加载用户程序到内存
    u64 sz = 0;
    Elf64_Phdr ph;
    for (int i = 0, off = elf.e_phoff; i < elf.e_phnum; i++, off += sizeof(ph)) {
        // 读取第i个程序头
        if (inodes.read(mip, (u8*)&ph, off, sizeof(ph)) != sizeof(ph))
            PANIC();
        // 跳过不可加载的段
        if (ph.p_type != PT_LOAD)
            continue;
        // 确保段在内存大小>=文件大小
        if (ph.p_memsz < ph.p_filesz)
            PANIC();
        // 确保段的内存大小非负
        if (ph.p_vaddr + ph.p_memsz < ph.p_vaddr)
            PANIC();

        sz = uvmalloc(&pd, sz, ph.p_vaddr + ph.p_memsz);

        // 加载段到内存
        if (loadseg(&pd, ph.p_vaddr, mip, ph.p_offset, ph.p_filesz) < 0)
            PANIC();
    }

    inodes.unlock(mip);    //** 释放inode锁
    inodes.put(&ctx, mip); // 减少引用计数
    bcache.end_op(&ctx);   //* 事务结束

    // ------------------------------------------------

    // 扩展扩展3页用户内存 (保护页+用户栈+保护页)
    sz = round_up(sz, PAGE_SIZE);
    sz = uvmalloc(&pd, sz, sz + 3 * PAGE_SIZE);
    u64 sp = sz - PAGE_SIZE;

    // ------------------------------------------------

    u64 envc = 0;
    u64 env_stack[32];
    if (envp != NULL) {
        for (; envp[envc]; envc++) {
            sp -= strlen(envp[envc]) + 1;
            sp -= sp % 16; // 16字节对齐

            // 将环境变量字符串复制到用户栈
            copyout(&pd, (void*)sp, envp[envc], strlen(envp[envc]) + 1);
            env_stack[envc] = sp;
        }
        env_stack[envc] = NULL;
    }

    u64 argc = 0;
    u64 arg_stack[32];
    if (argv != NULL) {
        // 加载参数字符串, 准备ustack
        for (; argv[argc]; argc++) {
            sp -= strlen(argv[argc]) + 1;
            sp -= sp % 16; // 16字节对齐

            // 将参数字符串复制到用户栈
            copyout(&pd, (void*)sp, argv[argc], strlen(argv[argc]) + 1);
            arg_stack[argc] = sp;
        }
        arg_stack[argc] = NULL;
    }

    // ------------------------------------------------
    //   +-------------+
    //   | envp[m] = 0 |  m == envc
    //   +-------------+
    //   |    ....     |
    //   +-------------+
    //   |   envp[0]   |
    //   +-------------+
    //   | argv[n] = 0 |  n == argc
    //   +-------------+
    //   |    ....     |
    //   +-------------+
    //   |   argv[0]   |
    //   +-------------+
    //   |    argc     |
    //   +-------------+  <== sp

    // 将envp[]指针数组复制到用户栈
    sp -= (envc + 1) * sizeof(u64);
    sp -= sp % 16; // 16字节对齐
    copyout(&pd, (void*)sp, (char*)env_stack, (envc + 1) * sizeof(u64));

    // 将argv[]指针数组复制到用户栈
    sp -= (argc + 1) * sizeof(u64);
    sp -= sp % 16; // 16字节对齐
    copyout(&pd, (void*)sp, (char*)arg_stack, (argc + 1) * sizeof(u64));

    // 将argc复制到用户栈
    sp -= sizeof(u64);
    copyout(&pd, (void*)sp, (char*)&argc, sizeof(u64));

    // ------------------------------------------------

    // 切换到新的页表
    Proc* p = thisproc();
    p->pgdir = pd;
    yield();

    p->sz = sz;                          // 更新用户内存大小
    p->ucontext->elr_el1 = elf.e_entry; // 设置程序入口地址
    p->ucontext->sp_el0 = sp;           // 设置用户栈指针

    return 0;

}

// 加载程序段到页表的虚拟地址
// (不需要va页对齐 需要已映射到页表)
static int loadseg(struct pgdir* pagetable, u64 va, Inode* mip, u64 offset, u64 sz)
{
    u64 n;
    u64 va1 = round_down(va, PAGE_SIZE);
    u64 bias = va - va1;

    if (bias > 0) {
        // 获取对应的内核地址
        const auto pte = get_pte(pagetable, va1, false);
        u64 ka = P2K(PTE_ADDRESS(*pte)) + bias;

        // 该页剩余大小
        if (sz < PAGE_SIZE - bias)
            n = sz;
        else
            n = PAGE_SIZE - bias;

        // 读取数据到对应物理地址
        inodes.read(mip, (u8*)ka, offset, n);

        sz -= n;
        offset += n;
        va = va1 + PAGE_SIZE;
    }

    for (u64 i = 0; i < sz; i += PAGE_SIZE) {
        // 获取对应的内核地址
        const auto pte = get_pte(pagetable, va + i, false);
        u64 ka = P2K(PTE_ADDRESS(*pte));
        if (ka == 0)
            PANIC();

        // 该页剩余大小
        if (sz - i < PAGE_SIZE)
            n = sz - i;
        else
            n = PAGE_SIZE;

        // 读取数据到对应内核地址
        if (inodes.read(mip, (u8*)ka, offset + i, n) != n)
            return -1;
    }
    return 0;
}