#include <aarch64/intrinsic.h>
#include <kernel/cpu.h>
#include <kernel/printk.h>
#include <kernel/sched.h>
#include <test/test.h>
#include <common/buf.h>
#include <string.h>
#include <driver/virtio.h>
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

    /* LAB 4 TODO 3 BEGIN */

    Buf MBR_buf;
    MBR_buf.flags = 0;
    MBR_buf.block_no = 0;
    virtio_blk_rw(&MBR_buf);

    u8 * MBR = MBR_buf.data;
    LBA = *(u32 *)(MBR + 0x1ce + 0x8);


    init_filesystem();

    printk("Hello world! (Core %lld)\n", cpuid());
    
    /* LAB 4 TODO 3 END */

    /**
     * (Final) TODO BEGIN 
     * 
     * Map init.S to user space and trap_return to run icode.
     */

    Proc *initproc = create_proc();

    initproc->ucontext->x0 = 0;
    initproc->ucontext->elr_el1 = 0x400000;
    initproc->ucontext->sp_el0 = 0x7ffff000;    // not sure
    initproc->ucontext->spsr_el1 = 0;

    struct section *section = kalloc(sizeof(struct section));
    section->begin = 0x400000;
    section->end = section->begin + (u64)eicode - (u64)icode;
    section->flags = ST_TEXT;

    _insert_into_list(&initproc->pgdir.section_head, &section->stnode);

    void *page = kalloc_page();
    memcpy(page, (void *)icode, PAGE_SIZE);
    vmmap(&initproc->pgdir, 0x400000, page, PTE_USER_DATA | PTE_RO);

    start_proc(initproc, trap_return, 0);
    printk("init proc done\n");
    
    while (1) {
        int code;
        auto pid = wait(&code);
        (void)pid;
    }
    
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