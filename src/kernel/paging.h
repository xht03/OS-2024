#pragma once

#include <aarch64/mmu.h>
#include <kernel/proc.h>

#define ST_FILE 1                       // 文件映射段 (内存段是从文件映射到内存的)
#define ST_SWAP (1 << 1)                // 交换段 (内存段可以被交换到磁盘上)
#define ST_RO (1 << 2)                  // 内存段是只读的
#define ST_HEAP (1 << 3)                // 堆段
#define ST_TEXT (ST_FILE | ST_RO)       // 文本段
#define ST_DATA ST_FILE                 // 数据段
#define ST_BSS ST_FILE                  // BSS 段 (未初始化数据段)

struct section {
    u64 flags;              // 段的标志位，用于描述段的属性
    u64 begin;              // 段的起始地址
    u64 end;                // 段的结束地址
    ListNode stnode;        // 链表节点，用于将多个段链接在一起

    /* The following fields are for the file-backed sections. */

    struct file *fp;        // 指向文件的指针，如果段是文件映射的
    u64 offset;             // 文件中的偏移量
    u64 length;             // Length of mapped content in file
};

int pgfault_handler(u64 iss);
void init_sections(ListNode *section_head);
void free_sections(struct pgdir *pd);
void copy_sections(ListNode *from_head, ListNode *to_head);
u64 sbrk(i64 size);
