#pragma once

#include <kernel/proc.h>
#include <common/rbtree.h>

#define NCPU 4

// 每个CPU的自定义调度信息
struct sched {
    Proc *proc;  // 当前正在运行的进程（可以为空）
    Proc *pre_proc;  // 跳转到idle进程之前的进程
};

struct cpu {
    bool online;            // 是否在线
    struct rb_root_ timer;  // 定时器
    struct sched sched;     // 当前CPU的调度信息
};

extern struct cpu cpus[NCPU];

struct timer {
    bool triggered;                     // 是否触发
    int elapse;                         // 间隔时间
    u64 _key;                           // 
    struct rb_node_ _node;              // 定时器的节点
    void (*handler)(struct timer *);    // 定时器的处理函数
    u64 data;                           // 
};

void init_clock_handler();

void set_cpu_on();
void set_cpu_off();

void set_cpu_timer(struct timer *timer);
void cancel_cpu_timer(struct timer *timer);