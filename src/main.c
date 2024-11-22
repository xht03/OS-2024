#include <aarch64/intrinsic.h>
#include <common/string.h>
#include <driver/uart.h>
#include <kernel/core.h>
#include <kernel/cpu.h>
#include <kernel/mem.h>
#include <kernel/printk.h>
#include <kernel/sched.h>
#include <driver/interrupt.h>
#include <kernel/proc.h>
#include <driver/gicv3.h>
#include <driver/timer.h>
#include <driver/virtio.h>

static volatile bool boot_secondary_cpus = false;

void main()
{
    if (cpuid() == 0) {
        extern char edata[], end[];
        memset(edata, 0, (usize)(end - edata));

        init_interrupt();       // 初始化中断处理函数

        uart_init();            // 初始化终端 (UART)
        printk_init();          // 初始化printk

        gicv3_init();
        gicv3_init_percpu();

        init_clock_handler();   // 初始化时钟中断处理函数

        kinit();                // 初始化内核内存分配器

        init_sched();           // 初始化调度器

        init_kproc();           // 初始化第一个内核进程 (root_proc)

        virtio_init();          // 初始化virtio设备

        smp_init();             // 初始化多核处理器

        arch_fence();           // 内存屏障

        // Set a flag indicating that the secondary CPUs can start executing.
        boot_secondary_cpus = true;
    } else {
        while (!boot_secondary_cpus)
            ;
        arch_fence();
        gicv3_init_percpu();
    }

    // Start the first process
    // 设置跳转入口为idle_entry
    set_return_addr(idle_entry);
}
