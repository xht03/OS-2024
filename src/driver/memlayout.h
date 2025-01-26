#pragma once

#define EXTMEM 0x40000000                   // 扩展内存的起始地址 (通常是内核加载的起始地址)
#define PHYSTOP 0x80000000                  // 物理内存的结束地址

#define KSPACE_MASK 0xFFFF000000000000      // 内核空间掩码，用于将物理地址转换为内核虚拟地址
#define KERNLINK (KSPACE_MASK + EXTMEM)     // 内核链接地址，即内核在虚拟地址空间中的起始地址

#define K2P_WO(x) ((x) - (KSPACE_MASK)) /* Same as V2P, but without casts */
#define P2K_WO(x) ((x) + (KSPACE_MASK)) /* Same as P2V, but without casts */
