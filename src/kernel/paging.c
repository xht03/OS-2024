#include <aarch64/mmu.h>
#include <common/defines.h>
#include <common/list.h>
#include <common/sem.h>
#include <common/string.h>
#include <fs/block_device.h>
#include <fs/cache.h>
#include <kernel/mem.h>
#include <kernel/paging.h>
#include <kernel/printk.h>
#include <kernel/proc.h>
#include <kernel/pt.h>
#include <kernel/sched.h>

void init_sections(ListNode *section_head) {
    init_list_node(section_head);
}

void free_sections(struct pgdir *pd) {

    acquire_spinlock(&pd->lock);

    ListNode *node = pd->section_head.next;
    while (node != &pd->section_head) {
        struct section *section = container_of(node, struct section, stnode);
        ListNode *next = node->next;

        _detach_from_list(node);

        if(section->fp != NULL) {
            if(section->fp->ref > 0) {
                file_close(section->fp);
            }
            kfree(section->fp);
        }

        kfree(section);
        node = next;
    }

    release_spinlock(&pd->lock);

}

u64 sbrk(i64 size) {
    /*
     * Increase the heap size of current process by `size`.
     * If `size` is negative, decrease heap size. `size` must
     * be a multiple of PAGE_SIZE.
     * 
     * Return the previous heap_end.
     */

    ASSERT(size % PAGE_SIZE == 0);

    Proc *p = thisproc();

    acquire_spinlock(&p->pgdir.lock);

    ListNode *node = p->pgdir.section_head.next;
    struct section *heap_section = NULL;

    // 寻找 heap 段
    while (node != &p->pgdir.section_head) {
        struct section *section = container_of(node, struct section, stnode);
        // This section is heap
        if (section->flags & ST_HEAP) {
            heap_section = section;
            break;
        }

        node = node->next;
    }
    
    if (heap_section == NULL) {
        printk("proc %d has no heap section\n", p->pid);
        return -1;
    }

    if (heap_section->end + size < heap_section->begin) {
        printk("invalid heap shrinking size\n");
        return -1;
    }

    u64 old_end = heap_section->end;        // 原来的堆顶
    heap_section->end += size;              // 更新堆顶

    // 释放多余的页
    if(size < 0) {
        // 需要释放页表的区间
        u64 free_start = PAGE_BASE(heap_section->end + PAGE_SIZE - 1);
        u64 free_end = PAGE_BASE(old_end - 1);

        for (u64 va = free_start; va <= free_end; va += PAGE_SIZE) {
            PTEntriesPtr pte = get_pte(&p->pgdir, va, false);
            if (pte == NULL || ((u64)pte & PTE_VALID) == 0) {
                printk("invalid pte\n");
                return -1;
            }
            void *ka = (void *)P2K(PTE_ADDRESS(*pte));
            kfree_page(ka);
            *pte = 0;
        }

        // 刷新TLB
        arch_tlbi_vmalle1is();
    }

    release_spinlock(&p->pgdir.lock);

    return old_end;
}

// 处理页错误
// iss: 异常信息
int pgfault_handler(u64 iss) {
    Proc *p = thisproc();
    struct pgdir *pd = &p->pgdir;
    u64 addr =
            arch_get_far(); // Attempting to access this address caused the page fault

    /*
     * 1. Find the section struct which contains the faulting address `addr`.
     * 2. Check section flags to determine page fault type.
     * 3. Handle the page fault accordingly.
     * 4. Return to user code or kill the process.
     */

    // Ensure that `far`(Fault Address Register) is valid
    if ((iss << 10) & 0x1) {
        printk("ERROR: Invalid FAR, cannot handle. \n");
        return -1;
    }

    ListNode *node = pd->section_head.next;
    struct section *wrong_section = NULL;       // 出错的 section

    // 寻找包含出错地址的 section
    while(node != &pd->section_head) {
        struct section *section = container_of(node, struct section, stnode);
        if (addr >= section->begin && addr < section->end) {
            // This is the section which contains the faulting address
            wrong_section = section;
            break;
        }
        node = node->next;
    }

    if (wrong_section == NULL) {
        printk("ERROR: Cannot find the section which contains the faulting address. \n");
        return -1;
    }

    u64 page_addr = PAGE_BASE(addr);        // 所在页的页地址

    // 解析错误类型
    // Reference: https://developer.arm.com/documentation/ddi0601/2024-09/AArch32-Registers/HSR--Hyp-Syndrome-Register
    u64 dfsc = iss & 0x3F;                  // Data Fault Status Code

    // Translation fault
    // 虚拟地址没有映射到物理地址 (页表项不存在或无效)
    if((dfsc >> 2) == 0x1) {
        if(wrong_section->flags & ST_HEAP || wrong_section->fp != NULL) {
            void *new_page = kalloc_page();
            if (new_page == NULL) {
                printk("ERROR: No memory to handle translation fault. \n");
                return -1;
            }

            vmmap(pd, page_addr, new_page, PTE_USER_DATA);

            // If this is a file-backed section, read data from file
            if(wrong_section->fp != NULL) {
                inodes.lock(wrong_section->fp->ip);

                u64 offset = page_addr - wrong_section->begin;
                inodes.read(wrong_section->fp->ip, new_page, wrong_section->offset + offset,
                            MIN((u64)PAGE_SIZE, wrong_section->length - offset));

                inodes.unlock(wrong_section->fp->ip);
            }

            return 0;
        }
        else {
            printk("Invalid Translation Error. \n");
            return -1;
        }
    }

    // Permission fault
    // 进程试图访问一个它没有适当权限的内存页
    if((dfsc >> 2) == 0x3) {
        // 检查 WnR 位，确保这个错误是由写操作引起的
        ASSERT(iss & 0x40);

        // copy on write
        PTEntriesPtr pte = get_pte(pd, page_addr, false);
        ASSERT(pte != NULL && (*pte & PTE_VALID));

        void *old_addr = (void *)P2K(PTE_ADDRESS(*pte));

        void *new_page = kalloc_page();
        if(new_page == NULL) {
            printk("ERROR: No memory to handle Permission fault. \n");
            return -1;
        }

        memcpy(new_page, old_addr, PAGE_SIZE);
        vmmap(pd, page_addr, new_page, PTE_USER_DATA);

        return 0;
    }

    // etc
    printk("ERROR: Unknown page fault. \n");
    return -1;
}

void copy_sections(ListNode *from_head, ListNode *to_head)
{
    ListNode *node = from_head->next;
    while (node != from_head)
    {
        struct section *section = container_of(node, struct section, stnode);
        struct section *new_section = kalloc(sizeof(struct section));

        new_section->begin = section->begin;
        new_section->end = section->end;
        new_section->flags = section->flags;
        new_section->fp = NULL;
        if(section->fp != NULL) {
            new_section->fp = section->fp;
            new_section->offset = section->offset;
            new_section->length = section->length;
        }

        _insert_into_list(to_head, &new_section->stnode);

        node = node->next;
    }
}
