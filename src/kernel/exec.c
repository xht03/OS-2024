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

// 在当前进程的上下文中执行一个新的程序
// path: 可执行文件路径
// argv: 参数列表
// envp: 环境变量列表
int execve(const char *path, char *const argv[], char *const envp[])
{
    Inode *ip;   
    Elf64_Ehdr elf;
    Elf64_Phdr phdr;
    struct pgdir *pgdir = (struct pgdir *)kalloc(sizeof(struct pgdir));
    Proc *p = thisproc();

    init_pgdir(pgdir);

    /*
    * Step1: Load data from the file stored in `path`.
    * The first `sizeof(struct Elf64_Ehdr)` bytes is the ELF header part.
    * You should check the ELF magic number and get the `e_phoff` and `e_phnum` which is the starting byte of program header.
    */

    OpContext ctx;
    bcache.begin_op(&ctx);

    // 打开可执行文件
    if ((ip = namei(path, &ctx)) == 0) {
        bcache.end_op(&ctx);
        printk("execve: cannot open %s\n", path);
        return -1;
    }

    inodes.lock(ip);

    // 读取 ELF 文件头
    if(inodes.read(ip, (u8 *)&elf, 0, sizeof(Elf64_Ehdr)) != sizeof(Elf64_Ehdr)) {
        printk("execve: cannot read ELF header\n");
        goto bad;
    }

    // 检查 ELF 魔数
    if(elf.e_ident[0] != ELFMAG0 || elf.e_ident[1] != ELFMAG1 || elf.e_ident[2] != ELFMAG2
        || elf.e_ident[3] != ELFMAG3) {
        printk("execve: not an ELF file\n");
        goto bad;
    }


    /*
    * Step2: Load program headers and the program itself
    * Program headers are stored like: struct Elf64_Phdr phdr[e_phnum];
    * e_phoff is the offset of the headers in file, namely, the address of phdr[0].
    * For each program header, if the type(p_type) is LOAD, you should load them:
    * A naive way is 
    * (1) allocate memory, va region [vaddr, vaddr+filesz)
    * (2) copy [offset, offset + filesz) of file to va [vaddr, vaddr+filesz) of memory
    * Since we have applied dynamic virtual memory management, you can try to only set the file and offset (lazy allocation)
    * (hints: there are two loadable program headers in most exectuable file at this lab, the first header indicates the text section(flag=RX) and the second one is the data+bss section(flag=RW). You can verify that by check the header flags. The second header has [p_vaddr, p_vaddr+p_filesz) the data section and [p_vaddr+p_filesz, p_vaddr+p_memsz) the bss section which is required to set to 0, you may have to put data and bss in a single struct section. COW by using the zero page is encouraged)
    */


    Elf64_Off phoff = elf.e_phoff;      // Program Header 的偏移
    Elf64_Half phnum = elf.e_phnum;     // Program Header 的数量

    u64 section_top = 0;                // 所有段的最高地址

    for (u64 i = 0, off = phoff; i < phnum; i++, off += sizeof(Elf64_Phdr)) {
        // 读取每个段的 Program Header
        if(inodes.read(ip, (u8 *)&phdr, off, sizeof(Elf64_Phdr)) != sizeof(Elf64_Phdr)) {
            printk("execve: cannot read program header\n");
            goto bad;
        }

        section_top = MAX(section_top, phdr.p_vaddr + phdr.p_memsz);

        // 跳过不可加载的段
        if(phdr.p_type != PT_LOAD) {
            continue;
        }

        struct section *section = (struct section*)kalloc(sizeof(struct section));  
        memset(section, 0, sizeof(struct section));
        init_sections(&section->stnode);
        
        section->begin = phdr.p_vaddr;

        if(phdr.p_flags == (PF_R|PF_X)) {
            // text section
            section->flags = ST_TEXT;
            section->end = section->begin + phdr.p_filesz;

            section->fp =file_alloc();
            section->fp->ip = inodes.share(ip);
            section->fp->type = FD_INODE;
            section->fp->readable = true;
            section->fp->writable = false;
            section->fp->ref = 1;
            section->fp->off = 0;
            section->offset = phdr.p_offset;
            section->length = phdr.p_filesz;
        }
        else if (phdr.p_flags == (PF_R|PF_W)) {
            // data or bss section
            section->flags = ST_DATA;
            section->end = section->begin + phdr.p_memsz;

            // 加载 data section 
            // [phdr.p_offset, phdr.p_offset + phdr.p_filesz)
            u64 filesz = phdr.p_filesz;
            u64 va = phdr.p_vaddr;
            u64 offset = phdr.p_offset;

            while(filesz) {
                u64 size = MIN(filesz, (u64)PAGE_SIZE - VA_OFFSET(va));     // 一次迭代写入的字节数

                void *page = kalloc_page();
                memset(page, 0, size);
                vmmap(pgdir, PAGE_BASE(va), page, PTE_USER_DATA | PTE_RW);

                if(inodes.read(ip, (u8 *)(page + VA_OFFSET(va)), offset, size) != size) {
                    printk("execve: cannot read data section\n");
                    goto bad;
                } 

                filesz -= size;
                va += size;
                offset += size;
            }

            ASSERT(va == phdr.p_vaddr + phdr.p_filesz);

            // 加载 bss section
            // [phdr.p_vaddr + phdr.p_filesz, phdr.p_vaddr + phdr.p_memsz)
            if (PAGE_BASE(va) + PAGE_SIZE < phdr.p_vaddr + phdr.p_memsz) {
                va = PAGE_BASE(va) + PAGE_SIZE;                 // 下一个页
                filesz = phdr.p_vaddr + phdr.p_memsz - va;      // BSS 大小
                while (filesz > 0) {
                    u64 size = MIN((u64)PAGE_SIZE, filesz);
                    vmmap(pgdir, PAGE_BASE(va), get_zero_page(), PTE_USER_DATA | PTE_RO);
                    filesz -= size;
                    va += size;
                }
                ASSERT(filesz == 0);
                ASSERT(va == phdr.p_vaddr + phdr.p_memsz);
            }
        }
        else {
            printk("execve: unknown program header flag\n");
            goto bad;
        }

        _insert_into_list(&pgdir->section_head, &section->stnode);
    }

    inodes.unlock(ip);
    inodes.put(&ctx,ip);
    bcache.end_op(&ctx);


    // 初始化 heap section
    struct section *heap_section = (struct section*)kalloc(sizeof(struct section));
    memset(heap_section, 0, sizeof(struct section));
    heap_section->begin = PAGE_BASE(section_top) + PAGE_SIZE;
    heap_section->end = PAGE_BASE(section_top) + PAGE_SIZE;
    heap_section->flags = ST_HEAP;
    _insert_into_list(&pgdir->section_head, &heap_section->stnode);
    

    /*
    * Step3: Allocate and initialize user stack.
    * The va of the user stack is not required to be any fixed value. It can be randomized. (hints: you can directly allocate user stack at one time, or apply lazy allocation)
    * Push argument strings.
    * The initial stack may like
    *   +-------------+
    *   | envp[m] = 0 |  m == envc
    *   +-------------+
    *   |    ....     |
    *   +-------------+
    *   |   envp[0]   |  ignore the envp if you do not want to implement
    *   +-------------+
    *   | argv[n] = 0 |  n == argc
    *   +-------------+
    *   |    ....     |
    *   +-------------+
    *   |   argv[0]   |
    *   +-------------+
    *   |    argc     |
    *   +-------------+  <== sp

    * ## Example
    * sp -= 8; *(size_t *)sp = argc; (hints: sp can be directly written if current pgdir is the new one)
    * thisproc()->tf->sp = sp; (hints: Stack pointer must be aligned to 16B!)
    * The entry point addresses is stored in elf_header.entry
    */ 

    // 初始化用户栈
    u64 top = USER_STACK_TOP - RESERVE_SIZE;

    struct section *stack_section = (struct section*)kalloc(sizeof(struct section));
   
    memset(stack_section, 0, sizeof(struct section));
    stack_section->begin = USER_STACK_TOP - USER_STACK_SIZE;
    stack_section->end = USER_STACK_TOP;

    init_list_node(&stack_section->stnode);
    _insert_into_list(&pgdir->section_head, &stack_section->stnode);

    // 填入参数
    u64 envc = 0;
    u64 env_len = 0;
    if(envp) {
        while(envp[envc]) {
            env_len += strlen(envp[envc]) + 1;
            envc++;
        }
    }

    u64 argc = 0;
    u64 argv_len = 0;
    if(argv) {
        while(argv[argc]) {
            argv_len += strlen(argv[argc]) + 1;
            argc++;
        }
    }

    u64 total_len = argv_len + env_len + 2;
    u64 argc_start = (top - total_len - 8) & ~0xF;
    u64 argv_start = argc_start + 8;
    u64 env_start = argv_start + argv_len + 1;

    copyout(pgdir, (void *)argc_start, (void *)&argc, 8);
    copyout(pgdir, (void *)argv_start, (void *)argv, argv_len);
    copyout(pgdir, (void *)env_start, (void *)envp, env_len);

    u8 zero = 0;

    copyout(pgdir, (void *)argv_start + argv_len, &zero, 1);
    copyout(pgdir, (void *)env_start + env_len, &zero, 1);
    
    p->ucontext->sp_el0 = argc_start;
    p->ucontext->elr_el1 = elf.e_entry;

    // 更新页表
    free_pgdir(&p->pgdir);

    memcpy(&p->pgdir, pgdir, sizeof(struct pgdir));

    init_list_node(&p->pgdir.section_head);
    _insert_into_list(&pgdir->section_head, &p->pgdir.section_head);
    _detach_from_list(&pgdir->section_head);
    attach_pgdir(&p->pgdir);

    kfree(pgdir);

    return 0;


bad:
    if(pgdir) {
        free_pgdir(pgdir);
    }
    if(ip) {
        inodes.unlock(ip);
        inodes.put(&ctx,ip);
        bcache.end_op(&ctx);
    }
    return -1;

}
