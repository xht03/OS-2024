#include <aarch64/intrinsic.h>
#include <common/string.h>
#include <kernel/mem.h>
#include <kernel/pt.h>

PTEntriesPtr get_pte(struct pgdir *pgdir, u64 va, bool alloc)
{
    // TODO:
    // Return a pointer to the PTE (Page Table Entry) for virtual address 'va'
    // If the entry not exists (NEEDN'T BE VALID), allocate it if alloc=true, or return NULL if false.
    // THIS ROUTINUE GETS THE PTE, NOT THE PAGE DESCRIBED BY PTE.

    const int levels = 4;           // 4级页表
    int index0 = VA_PART0(va);      // 最高级页表的索引 [47:39]
    int index1 = VA_PART1(va);      // 第二级页表的索引 [38:30]
    int index2 = VA_PART2(va);      // 第三级页表的索引 [29:21]
    int index3 = VA_PART3(va);      // 最低级页表的索引 [20:12]


    /*
    * 页表结构：
    * 每级索引9位，共4级，每级页表占用一个页（4KB）
    * 页表项大小为8byte，64位，其中[47:12]位表示物理地址，[11:0]表示标志位，其余不用细究。
    */


    // 如果进程页表为空，且alloc为真，则分配一个新页表
    if(pgdir->pt == NULL) {
        if(alloc == false) return NULL;
        pgdir->pt = (PTEntriesPtr)kalloc_page();
    }
    
    // 遍历页表层次结构
    PTEntry *pt = pgdir->pt;
    for (int level = 0; level < levels - 1; level++) {
        
        // 获取页表项
        int index;
        switch (level) {
            case 0: index = index0; break;
            case 1: index = index1; break;
            case 2: index = index2; break;
            default: return NULL; // 不应该到达这里
        }
        PTEntry *entry = &pt[index];

        // 如果页表项不存在，则分配一个新页表
        if (!(*entry & PTE_VALID)) {
            if (!alloc) return NULL;
            PTEntriesPtr new_pt = (PTEntriesPtr)kalloc_page();
            if (!new_pt) return NULL;
            *entry = K2P(new_pt) | PTE_VALID | PTE_TABLE | PTE_USER | PTE_RW;
        }

        // 获取下一级页表的地址
        pt = (PTEntriesPtr)P2K(PTE_ADDRESS(*entry));
    }

    // 返回页表项的地址
    return &pt[index3];
}

void init_pgdir(struct pgdir *pgdir)
{
    pgdir->pt = NULL;
}

void free_pgdir(struct pgdir *pgdir)
{
    // TODO:
    // Free pages used by the page table. If pgdir->pt=NULL, do nothing.
    // DONT FREE PAGES DESCRIBED BY THE PAGE TABLE

    // 如果页表为空，则不做任何事情
    if (pgdir->pt == NULL) {
        return;
    }

    // 遍历页表层次结构，释放每一级页表
    PTEntriesPtr pt0 = pgdir->pt;
    for(int i = 0; i < N_PTE_PER_TABLE; i++) {
        if(pt0[i] & PTE_VALID) {
            PTEntriesPtr pt1 = (PTEntriesPtr)P2K(PTE_ADDRESS(pt0[i]));  // 第二级页表
            for(int j = 0; j < N_PTE_PER_TABLE; j++) {
                if(pt1[j] & PTE_VALID) {
                    PTEntriesPtr pt2 = (PTEntriesPtr)P2K(PTE_ADDRESS(pt1[j]));  // 第三级页表
                    for(int k = 0; k < N_PTE_PER_TABLE; k++) {
                        if(pt2[k] & PTE_VALID) {
                            PTEntriesPtr pt3 = (PTEntriesPtr)P2K(PTE_ADDRESS(pt2[k]));  // 第四级页表
                            kfree_page(pt3);
                        }
                    }
                    kfree_page(pt2);
                }
            }
            kfree_page(pt1);
        }
    }

    // 释放顶级页表
    kfree_page(pt0);
    pgdir->pt = NULL;
}

void attach_pgdir(struct pgdir *pgdir)
{
    extern PTEntries invalid_pt;
    if (pgdir->pt)
        arch_set_ttbr0(K2P(pgdir->pt));
    else
        arch_set_ttbr0(K2P(&invalid_pt));
}

/**
 * Map virtual address 'va' to the physical address represented by kernel
 * address 'ka' in page directory 'pd', 'flags' is the flags for the page
 * table entry.
 */
void vmmap(struct pgdir *pd, u64 va, void *ka, u64 flags)
{
    /* (Final) TODO BEGIN */

    /* (Final) TODO END */
}

/*
 * Copy len bytes from p to user address va in page table pgdir.
 * Allocate physical pages if required.
 * Useful when pgdir is not the current page table.
 */
int copyout(struct pgdir *pd, void *va, void *p, usize len)
{
    /* (Final) TODO BEGIN */

    /* (Final) TODO END */
}