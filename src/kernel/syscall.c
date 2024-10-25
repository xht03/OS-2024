#include <kernel/syscall.h>
#include <kernel/sched.h>
#include <kernel/printk.h>
#include <common/sem.h>
#include <test/test.h>
#include <aarch64/intrinsic.h>

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Woverride-init"


u64 syscall_myreport()
{
    u64 id = thisproc()->ucontext->x0;
    return myreport(id);
}


// 系统调用函数映射表
static u64 (*syscall_table[NR_SYSCALL])(void) = {
    [0 ... NR_SYSCALL - 1] = NULL,
    [SYS_myreport] = (void*)syscall_myreport,
};


void syscall_entry(UserContext *context)
{
    // TODO
    // Invoke syscall_table[id] with args and set the return value.
    // id is stored in x8. args are stored in x0-x5. return value is stored in x0.
    // be sure to check the range of id. if id >= NR_SYSCALL, panic.

    // 获取 系统调用号
    u64 id = context->x8;
    if(id > 0 && id < NR_SYSCALL && syscall_table[id] != NULL) {
        context->x0 = syscall_table[id]();
    }
    else {
        printk("syscall id %llu is out of range\n", id);
        PANIC();
    }
}

#pragma GCC diagnostic pop