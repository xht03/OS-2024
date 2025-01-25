#pragma once

#include <aarch64/mmu.h>
#include <common/list.h>
#include <common/spinlock.h>

struct pgdir {
    PTEntriesPtr pt;            // 页表顶级指针，指向页表的最高级页表
    SpinLock lock;              // 页表锁
    ListNode section_head;      // 内存段链表头，每个内存段（section）描述了进程地址空间中的一个连续区域，例如代码段、数据段、堆等。
};

void init_pgdir(struct pgdir *pgdir);
WARN_RESULT PTEntriesPtr get_pte(struct pgdir *pgdir, u64 va, bool alloc);
void free_pgdir(struct pgdir *pgdir);
void attach_pgdir(struct pgdir *pgdir);
void vmmap(struct pgdir *pd, u64 va, void *ka, u64 flags);
int copyout(struct pgdir *pd, void *va, void *p, usize len);
int copyin(struct pgdir *pd, void *p, void *va, usize len);