#include <test/test.h>
#include <common/rc.h>
#include <kernel/pt.h>
#include <kernel/mem.h>
#include <kernel/printk.h>
#include <common/sem.h>
#include <kernel/proc.h>
#include <kernel/syscall.h>
#include <driver/memlayout.h>
#include <kernel/sched.h>

PTEntriesPtr get_pte(struct pgdir *pgdir, u64 va, bool alloc);

void vm_test()
{
    printk("vm_test\n");
    static void *p[100000];
    extern RefCount kalloc_page_cnt;
    struct pgdir pg;
    int p0 = kalloc_page_cnt.count;
    init_pgdir(&pg);
    for (u64 i = 0; i < 100000; i++) {
        p[i] = kalloc_page();
        *get_pte(&pg, i << 12, true) = K2P(p[i]) | PTE_USER_DATA;
        *(int *)p[i] = i;
    }
    attach_pgdir(&pg);
    for (u64 i = 0; i < 100000; i++) {
        ASSERT(*(int *)(P2K(PTE_ADDRESS(*get_pte(&pg, i << 12, false)))) ==
               (int)i);
        ASSERT(*(int *)(i << 12) == (int)i);
    }
    free_pgdir(&pg);
    attach_pgdir(&pg);
    for (u64 i = 0; i < 100000; i++)
        kfree_page(p[i]);
    ASSERT(kalloc_page_cnt.count == p0);
    printk("vm_test PASS\n");
}

void trap_return(u64);

static u64 proc_cnt[22] = { 0 }, cpu_cnt[4] = { 0 };
static Semaphore myrepot_done;


// syscall.c->syscall_entry 跳转到这里
u64 myreport(u64 id)
{
    static bool stop;
    ASSERT(id < 22);
    if (stop)
        return 0;
    proc_cnt[id]++;
    cpu_cnt[cpuid()]++;
    if (proc_cnt[id] > 12345) {
        stop = true;
        post_sem(&myrepot_done);
    }
    return 0;
}

void user_proc_test()
{
    printk("user_proc_test\n");
    init_sem(&myrepot_done, 0);

    // // 初始化22个用户进程 执行loop.S
    extern char loop_start[], loop_end[];
    int pids[22];
    for (int i = 0; i < 22; i++) {
        auto p = create_proc();
        for (u64 q = (u64)loop_start; q < (u64)loop_end; q += PAGE_SIZE) {
            *get_pte(&p->pgdir, EXTMEM + q - (u64)loop_start, true) =
                    K2P(q) | PTE_USER_DATA;
        }

        // 确保页表已分配 
        ASSERT(p->pgdir.pt);

        // TODO: setup the user context
        // 1. set x0 = i
        // 2. set elr = EXTMEM
        // 3. set spsr = 0


        // 设置用户上下文
        p->ucontext->x0 = i;
        p->ucontext->elr_el1 = EXTMEM;
        p->ucontext->spsr_el1 = 0;


        // 跳转到 trap.S 的 trap_return
        pids[i] = start_proc(p, trap_return, (u64)p->ucontext);
        printk("pid[%d] = %d\n", i, pids[i]);
    }

    // 等待某个进程唤醒myrepot_done
    ASSERT(wait_sem(&myrepot_done));
    printk("done\n");

    // kill所有进程
    for (int i = 0; i < 22; i++)
        ASSERT(kill(pids[i]) == 0);


    // 等待所有进程结束    
    for (int i = 0; i < 22; i++) {
        int code;
        int pid = wait(&code);
        printk("pid %d killed\n", pid);
        ASSERT(code == -1);
    }


    // 确认CPU是否负载均衡
    printk("user_proc_test PASS\nRuntime:\n");
    for (int i = 0; i < 4; i++)
        printk("CPU %d: %llu\n", i, cpu_cnt[i]);
    for (int i = 0; i < 22; i++)
        printk("Proc %d: %llu\n", i, proc_cnt[i]);
}
