#pragma once

#include <kernel/proc.h>
#include <common/rbtree.h>

#define NCPU 4

// 每个CPU的自定义调度信息
struct sched {
    Proc *current;  // 当前正在运行的进程，或着为空
    Proc *idle;     // 当前CPU的专属idle进程
};

struct cpu {
    bool online;            // 是否在线
    struct rb_root_ timer;  // 定时器
    struct sched sched;     // 当前CPU的调度信息
};

extern struct cpu cpus[NCPU];

void set_cpu_on();
void set_cpu_off();
