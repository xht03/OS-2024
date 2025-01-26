#include <kernel/syscall.h>
#include <kernel/sched.h>
#include <kernel/printk.h>
#include <common/sem.h>
#include <test/test.h>
#include <aarch64/intrinsic.h>
#include <kernel/paging.h>
#include <kernel/sched.h>

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Woverride-init"

u64 syscall_myreport()
{
    u64 id = thisproc()->ucontext->x0;
    return myreport(id);
}

void init_syscall()
{
    for (u64 *p = (u64 *)&early_init; p < (u64 *)&rest_init; p++)
        ((void (*)()) * p)();
}

void *syscall_table[NR_SYSCALL] = {
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
        // 将 syscall_table[id] 转换为函数指针类型，并传递参数
        u64 (*syscall_func)(u64, u64, u64, u64, u64, u64) = syscall_table[id];
        context->x0 = syscall_func(context->x0, context->x1, context->x2, context->x3, context->x4, context->x5);
    }
    else {
        printk("syscall id %llu is out of range\n", id);
        PANIC();
    }
}

/** 
 * Check if the virtual address [start,start+size) is READABLE by the current
 * user process.
 */
bool user_readable(const void *start, usize size) {
    // u64 va = (u64)start;
    // u64 va_end = va + size;
    // struct pgdir *pgdir = &(thisproc()->pgdir);

    // while(va < va_end) {
    //     PTEntriesPtr pte = get_pte(pgdir, va, false);
    //     if(pte == NULL || !(*pte & PTE_VALID) || !(*pte & PTE_USER)) {
    //         return false;
    //     }
    //     va += PAGE_BASE(va) + PAGE_SIZE;
    // }

    return true;
}


/**
 * Check if the virtual address [start,start+size) is READABLE & WRITEABLE by
 * the current user process.
 */
bool user_writeable(const void *start, usize size) {
    // u64 va = (u64)start;
    // u64 va_end = va + size;
    // struct pgdir *pgdir = &(thisproc()->pgdir);

    // while(va < va_end) {
    //     PTEntriesPtr pte = get_pte(pgdir, va, false);
    //     if(pte == NULL || !(*pte & PTE_VALID) || !(*pte & PTE_USER) || !(*pte & PTE_RW)) {
    //         return false;
    //     }
    //     va = PAGE_BASE(va) + PAGE_SIZE;
    // }

    return true;
}

/** 
 * Get the length of a string including tailing '\0' in the memory space of
 * current user process return 0 if the length exceeds maxlen or the string is
 * not readable by the current user process.
 */
usize user_strlen(const char *str, usize maxlen) {
    for (usize i = 0; i < maxlen; i++) {
        if (user_readable(&str[i], 1)) {
            if (str[i] == 0)
                return i + 1;
        } else
            return 0;
    }
    return 0;
}