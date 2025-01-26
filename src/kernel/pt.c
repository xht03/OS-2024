#include <aarch64/intrinsic.h>
#include <common/string.h>
#include <kernel/mem.h>
#include <kernel/pt.h>
#include <kernel/printk.h>
#include <kernel/paging.h>

PTEntriesPtr get_pte(struct pgdir *pgdir, u64 va, bool alloc)
{
    /*
    * Return a pointer to the PTE (Page Table Entry) for virtual address 'va'
    * If the entry not exists (NEEDN'T BE VALID), allocate it if alloc=true, or return NULL if false.
    * THIS ROUTINUE GETS THE PTE, NOT THE PAGE DESCRIBED BY PTE.
    */

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
    init_spinlock(&pgdir->lock);
    pgdir->section_head.next = &pgdir->section_head;
    pgdir->section_head.prev = &pgdir->section_head;
}

void free_pgdir(struct pgdir *pgdir)
{
    /*
    * Free pages used by the page table. If pgdir->pt=NULL, do nothing.
    * DONT FREE PAGES DESCRIBED BY THE PAGE TABLE
    */

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

    // 释放内存段 (释放了会pagefault)
    // free_sections(pgdir);
}

void attach_pgdir(struct pgdir *pgdir)
{
    extern PTEntries invalid_pt;
    if (pgdir->pt)
        arch_set_ttbr0(K2P(pgdir->pt));
    else
        arch_set_ttbr0(K2P(&invalid_pt));
}

// 将虚拟地址va映射到ka(ka是内核地址)所表示的物理地址
void vmmap(struct pgdir *pd, u64 va, void *ka, u64 flags)
{
    /*
    * 在页目录 pd 中设置相应的页表项
    * flags 用于设置页表项的标志位
    */
   
    PTEntriesPtr pte = get_pte(pd, va, true);
    if (pte == NULL) {
        printk("vmmap: get_pte failed\n");
        PANIC();
    }
    *pte = (K2P(ka) & ~0xFFF) | (flags & 0xFFF);

    // 刷新TLB
    arch_tlbi_vmalle1is();
}


// 从 内核空间 复制数据到 用户空间
// 从 src 复制 len 字节到给定页表中的虚拟地址 dstva
int copyout(struct pgdir* pd, void* dstva, void* src, u64 len)
{
    while (len > 0) {
        // 获取dstva所在页的首地址
        u64 va0 = round_down((u64)dstva, PAGE_SIZE);

        // 获取dstva对应的页表项
        PTEntriesPtr pte = get_pte(pd, va0, false);

        // 获取va0对应的内核地址
        u64 ka = P2K(PTE_ADDRESS(*pte));

        // 计算dstva到页末的字节数
        u64 bias = (u64)dstva - va0;
        u64 n = PAGE_SIZE - bias;
        if (n > len)
            n = len;

        // 拷贝数据到对应内核地址
        memcpy((void*)(ka + bias), src, n);

        len -= n;
        src += n;
        dstva = (void*)(va0 + PAGE_SIZE);
    }

    return 0;
}


// 将用户空间数据拷贝到内核空间
// 成功返回0，失败返回-1
int copyin(struct pgdir *pd, void *p, void *va, usize len)
{
    u64 n = 0;                  // 一次拷贝的字节数
    u64 va0;                    // 虚拟地址的基地址
    u64 pa0;                    // 物理页地址
    u64 va_addr = (u64)va;      // 虚拟地址

    while(len > 0){
        va0 = PAGE_BASE((u64)va_addr);                       // 虚拟地址的基地址
        PTEntriesPtr pte = get_pte(pd, va0, false);     // 获取页表项
        if(pte == NULL) {
            return -1;
        }
        pa0 = PTE_ADDRESS(*pte);                        // 物理页地址

        n = PAGE_SIZE - VA_OFFSET(va_addr);                  // 拷贝的字节数
        if(n > len) {
            n = len;
        }
        memmove(p, (void *)(pa0 + VA_OFFSET(va_addr)), n);

        len -= n;
        p += n;
        va_addr = va0 + PAGE_SIZE;
    }

    return 0;
}


// 扩展进程的用户内存 oldsz => newsz
// (oldsz和newsz不需要页对齐)
u64 uvmalloc(struct pgdir* pd, u64 oldsz, u64 newsz)
{
    // 确保newsz大于oldsz
    if (newsz < oldsz)
        return oldsz;

    // 向上对齐PGSIZE, 得到需新分配的起始页
    oldsz = round_up(oldsz, PAGE_SIZE);

    for (u64 va = oldsz; va < newsz; va += PAGE_SIZE) {
        // 分配一页新内存并清空
        char* mem = kalloc_page();
        memset(mem, 0, PAGE_SIZE);

        // 将新内存映射到页表
        auto pte = get_pte(pd, va, true);
        *pte = K2P(mem) | PTE_USER_DATA;
    }
    return newsz;
}


// 将父进程的地址空间复制到子进程
// (既复制页表页, 又复制物理内存页)
int uvmcopy(struct pgdir* old, struct pgdir* new, u64 sz)
{
    for (u64 i = 0; i < sz; i += PAGE_SIZE) {
        // 获取父进程的页表项对应的内核地址
        PTEntriesPtr pte = get_pte(old, i, false);
        u64 ka = P2K(PTE_ADDRESS(*pte));

        // 分配一页新内存并拷贝
        char* mem = kalloc_page();
        memcpy(mem, (void*)ka, PAGE_SIZE);

        // 将新内存映射到页表
        *get_pte(new, i, true) = K2P(mem) | PTE_USER_DATA;
    }

    return 0;
}

