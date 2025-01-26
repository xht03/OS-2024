#include <aarch64/intrinsic.h>
#include <kernel/cpu.h>
#include <kernel/printk.h>
#include <kernel/sched.h>
#include <test/test.h>
#include <common/buf.h>
#include <string.h>
#include <driver/virtio.h>
#include <driver/memlayout.h>
#include <kernel/paging.h>
#include <kernel/mem.h>


volatile bool panic_flag;

u32 LBA;

extern char icode[], eicode[];

void trap_return();

NO_RETURN void idle_entry()
{
    set_cpu_on();
    while (1) {
        //yield();

        acquire_sched();
        sched(RUNNABLE);

        if (panic_flag)
            break;

        arch_with_trap
        {
            arch_wfi();
        }
    }
    set_cpu_off();
    arch_stop_cpu();
}

NO_RETURN void kernel_entry()
{
    // proc_test();
    // vm_test();
    // user_proc_test();
    // io_test();

    printk("Hello world! (Core %lld)\n", cpuid());

    // 初始化文件系统
    init_filesystem();
    

    /**
     * (Final) TODO BEGIN 
     * 
     * Map init.S to user space and trap_return to run icode.
     */

    Proc *p = create_proc();

    // 将init.S映射到用户空间EXTMEM
    extern char icode[], eicode[];
    for (u64 q = (u64)icode; q < (u64)eicode; q += PAGE_SIZE) {
        *get_pte(&p->pgdir, EXTMEM + q - (u64)icode, true) = K2P(q) | PTE_USER_DATA;
    }

    // 确保页表已分配
    ASSERT(p->pgdir.pt);

    // 设置用户态上下文
    p->ucontext->sp_el0 = EXTMEM + PAGE_SIZE; // 用户栈
    p->ucontext->spsr_el1 = 0;                // 用户模式
    p->ucontext->elr_el1 = EXTMEM;            // init.S

    // 设置当前工作目录
    p->cwd = inodes.get(ROOT_INODE_NO);
    
    // 启动 root_proc
    start_proc(p, trap_return, 0);

    // 等待所有进程退出
    int exitcode;
    while (wait(&exitcode) != -1)
        printk("kernel_entry: exit with pid %d\n", exitcode);

    PANIC();

    /* (Final) TODO END */
}

NO_INLINE NO_RETURN void _panic(const char *file, int line)
{
    printk("=====%s:%d PANIC%lld!=====\n", file, line, cpuid());
    panic_flag = true;
    set_cpu_off();
    for (int i = 0; i < NCPU; i++) {
        if (cpus[i].online)
            i--;
    }
    printk("Kernel PANIC invoked at %s:%d. Stopped.\n", file, line);
    arch_stop_cpu();
}