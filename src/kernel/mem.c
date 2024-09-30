#include <aarch64/mmu.h>
#include <common/rc.h>
#include <common/spinlock.h>
#include <driver/memlayout.h>
#include <kernel/mem.h>
 #include <kernel/printk.h>
#define PGROUNDUP(sz)  (((sz)+PAGE_SIZE-1) & ~(PAGE_SIZE-1))
#define PGROUNDDOWN(a) (((a)) & ~(PAGE_SIZE-1))
#define NUM_CACHE 10    // 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096(可能4088)

RefCount kalloc_page_cnt;

void freerange(void* pa_start, void* pa_end);

extern char end[];  // first address after kernel.(but it is a virtual address)

// 空闲物理页节点
struct run {
    struct run* next;
};

// 空闲物理页的链表（的头节点）
struct {
    SpinLock lock;  // 1 byte
    struct run* freelist;
} kmem;



// 厚块节点（25个字节）
struct Slab {
    struct Slab* next;
    void* free_list;    // 空闲对象的链表
    usize free_count;     // 空闲对象的数量
    SpinLock lock;
};

// 厚块链表
struct Cache {
    struct Slab* slabs;
    usize slab_count; // slab的数量
    usize obj_size;   // 每个对象的大小（划分成几个字节的块）
} cache[NUM_CACHE];


void init_cache(struct Cache* cache, usize obj_size) {
    cache->slabs = NULL;
    cache->slab_count = 0;
    cache->obj_size = obj_size;
    //printk("init_cache() done for size %lld\n", obj_size);
}

void init_caches() {
    for(int i = 0; i < NUM_CACHE; i++) {
        init_cache(&cache[i], 8 << i);
    }
    //printk("init_caches done\n");
}

struct Cache* get_cache(usize size) {
    for (int i = 0; i < NUM_CACHE; i++) {
        if (size <= cache[i].obj_size) {
            return &cache[i];
        }
    }
    return NULL; // 如果没有合适的 cache
}


void* slab_alloc(struct Cache* cache) {
    
    //printk("CPU%lld slab_alloc: size = %lld\n", cpuid(), cache->obj_size);
    //for(int i = 0; i < NUM_CACHE; i++) {
    //    printk("  cache[%d]: slab_count = %lld\n", i, cache[i].slab_count);
    //}

    //-------------------- 从已有的slab中分配对象 --------------------
    struct Slab* slab = cache->slabs;
    while (slab != NULL) {
        acquire_spinlock(&slab->lock);
        if (slab->free_count > 0) {
            void* obj = slab->free_list;
            slab->free_list = *(void**)obj; // 指向下一个空闲对象
            slab->free_count--;
            release_spinlock(&slab->lock);
            return obj;
        }
        release_spinlock(&slab->lock);
        slab = slab->next;
    }
    //-------------------- 如果所有slab都用完了，分配新的页 --------------------
    slab = (struct Slab*)kalloc_page();
    if (slab == NULL) {
        printk("slab_alloc: fail to get a new page\n");
        return NULL;
    }

    //-------------------- 初始化新的slab --------------------
    init_spinlock(&slab->lock);
    acquire_spinlock(&slab->lock);
    slab->next = cache->slabs;
    cache->slabs = slab;
    slab->free_list = (void*)((char*)slab + 32);   // 留出空间给 struct Slab(25 bytes)
    slab->free_count = (PAGE_SIZE - 32) / cache->obj_size;   // 8是指针的大小

    //-------------------- 初始化空闲对象链表 --------------------
    char* obj = (char*)slab->free_list;
    for(usize i = 1; i < slab->free_count; i++) {
        *(void**)obj = obj + cache->obj_size;   // 每一个对象的开始，存放下一个对象的地址（所以实际上能用的空间?）
        obj += cache->obj_size;
    }
    *(void**)obj = NULL;
    cache->slab_count++;

    //-------------------- 返回第一个空闲对象 --------------------
    obj = slab->free_list;
    slab->free_list = *(void**)obj; // 指向下一个空闲对象
    slab->free_count--;
    release_spinlock(&slab->lock);
    return obj;
}


void slab_free(void* obj) {
    struct Slab *slab = (struct Slab*)PGROUNDDOWN((usize)obj);
    acquire_spinlock(&slab->lock);
    *(void**)obj = slab->free_list;
    slab->free_list = obj;
    slab->free_count++;
    release_spinlock(&slab->lock);
}



/*
void slab_free(struct Cache* cache, void* obj) {
    struct Slab* slab = cache->slabs;
    while (slab != NULL) {
        if ((char*)obj >= (char*)slab && (char*)obj < (char*)slab + PAGE_SIZE) {
            *(void**)obj = slab->free_list;
            slab->free_list = obj;
            slab->free_count++;
            return;
        }
        slab = slab->next;
    }
}
*/




// 释放指定区间的物理页（只有kinit时使用）
void freerange(void* pa_start, void* pa_end) {
    char *p;
    for(p = (char*)PGROUNDUP((usize)pa_start); p + PAGE_SIZE <= (char*)pa_end; p += PAGE_SIZE) {
        kfree_page(p);
    }
}



void kinit() {
    init_rc(&kalloc_page_cnt);
    init_spinlock(&kmem.lock);
    freerange((void*)K2P(end), (void*)PHYSTOP);
    init_caches();


    //-------------------- 调试：打印freelist --------------------
    /*
    printk("end (physical address) = %p, PHYSTOP = %p\n", (void*)K2P(end), (void*)PHYSTOP);
    struct run *r = kmem.freelist;
    printk("Free list:\n");
    while (r != NULL) {
        printk("  %p\n", r);
        r = r->next;
    }
    printk("kinit done\n");
    */
}

void* kalloc_page() {
    increment_rc(&kalloc_page_cnt);
    struct run *r;

    acquire_spinlock(&kmem.lock);   // 加锁
    r = kmem.freelist;
    if(r) {
        kmem.freelist = r->next;    // 从空闲链表中取出一个物理页r
    }
    release_spinlock(&kmem.lock);   // 解锁

    if(r){
        //memset((char*)r, 5, PAGE_SIZE);  // 填充垃圾数据
        return (void*)r;
    } else {
        return NULL;    // 没有空闲物理页
    }
}

void kfree_page(void* p) {
    decrement_rc(&kalloc_page_cnt);
    struct run *r;

    if((usize)p % PAGE_SIZE || (usize)p < K2P(end) || (usize)p >= PHYSTOP) {
        printk("kfree_page fail: p = %p\n", p);   
        return;
    }

    //memset(p, 1, PAGE_SIZE);        // 填充垃圾数据
    r = (struct run*)p;
    acquire_spinlock(&kmem.lock);   // 加锁
    r->next = kmem.freelist;        // 将释放的物理页加入空闲链表
    kmem.freelist = r;
    release_spinlock(&kmem.lock);   // 解锁
    return;
}



void* kalloc(unsigned long long size) {
    // return NULL;

    //printk("CPU%lld kalloc: size = %lld\n", cpuid(), size);

    if (size > PAGE_SIZE) {
        printk("kalloc: size too large\n");
        return NULL; // 不支持大于一页的分配
    }

    struct Cache* cache = get_cache(size);
    if (cache == NULL) {
        printk("kalloc: no suitable cache for size %lld\n", size);
        return NULL; // 没有合适的 cache
    }

    return slab_alloc(cache);
}

void kfree(void* ptr) {
    slab_free(ptr);
}

//-------------------- 调试：每次kalloc都直接分配一整页 --------------------
/*
void* kalloc(unsigned long long size) {
    (void)size; // 标记参数为未使用
    return kalloc_page();
}

void kfree(void* ptr) {
    kfree_page(ptr);
}
*/