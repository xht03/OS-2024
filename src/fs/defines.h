#pragma once
#include <common/defines.h>

// 磁盘布局
// `mkfs` 生成超级块并构建初始文件系统
// [ MBR block | super block | log blocks | inode blocks | bitmap blocks | data blocks ]
// [     0     |      1      | 2       64 | 65        90 |       91      | 92      999 ]


#define FSSIZE 1000         // 文件系统总块数
#define BLOCK_SIZE 512      // 块大小

// 超级块 (super block) 描述了磁盘布局。
typedef struct {
    u32 num_blocks;         // 文件系统中的总块数
    u32 num_data_blocks;    // 数据块数量
    u32 num_inodes;         // 索引 (inode) 数量
    u32 num_log_blocks;     // 日志块数量 (包含日志头)
    u32 log_start;          // 日志块区的起始块号
    u32 inode_start;        // 索引块区的起始块号
    u32 bitmap_start;       // 位图块区的起始块号
} SuperBlock;

// -----------------------------------------------------

#define ROOT_INODE_NO 1                                     // 根目录的inode编号
#define INODE_PER_BLOCK (BLOCK_SIZE / sizeof(InodeEntry))   // 一个块可容纳的inode数量

#define INODE_NUM_DIRECT 12                                         // 直接块数 = 12
#define INODE_NUM_INDIRECT (BLOCK_SIZE / sizeof(u32))               // 间接块数 = 128
#define INODE_MAX_BLOCKS (INODE_NUM_DIRECT + INODE_NUM_INDIRECT)    // 最大总块数 = 140
#define INODE_MAX_BYTES (INODE_MAX_BLOCKS * BLOCK_SIZE)             // 最大文件大小 = 140 * 512


// 索引类型
typedef u16 InodeType;
enum {
    INODE_INVALID = 0,   // 空闲
    INODE_DIRECTORY = 1, // 目录
    INODE_REGULAR = 2,   // 文件
    INODE_DEVICE = 3,    // 设备
};


// 磁盘上的 inode 结构
// INODE_INVALID 表示该索引是空闲的
typedef struct dinode {
    InodeType type;                 // 索引类型
    u16 major;                      // 主设备号
    u16 minor;                      // 次设备号
    u16 num_links;                  // 索引链接数
    u32 num_bytes;                  // 文件大小
    u32 addrs[INODE_NUM_DIRECT];    // 直接块的块号
    u32 indirect;                   // 间接块的块号
} InodeEntry;


// 间接块
// `InodeEntry.indirect` 指向的块。
typedef struct {
    u32 addrs[INODE_NUM_INDIRECT];
} IndirectBlock;

// -----------------------------------------------------

#define BIT_PER_BLOCK (BLOCK_SIZE * 8)                          // 一个块大小的位图的位数
#define BBLOCK(b, sb) ((b) / BIT_PER_BLOCK + sb->bitmap_start)  // 位图块号

// -----------------------------------------------------

#define FILE_NAME_MAX_LENGTH 14     // 文件名最大长度 (包括结尾的'\0')
#define PATH_NAME_MAX_LENGTH 128    // 路径名最大长度 (包括结尾的'\0')

// 目录项
// inode_no == 0 表示该目录项是空闲的
typedef struct dirent {
    u16 inode_no;                       // 索引编号
    char name[FILE_NAME_MAX_LENGTH];    // 文件名
} DirEntry;

// -----------------------------------------------------

// 日志头块能记录的最大块数
#define LOG_MAX_SIZE ((BLOCK_SIZE - sizeof(usize)) / sizeof(usize))

typedef struct {
    usize num_blocks;               // 日志中的块数
    usize block_no[LOG_MAX_SIZE];   // 日志中的块号
} LogHeader;















