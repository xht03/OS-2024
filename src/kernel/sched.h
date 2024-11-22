#pragma once

#include <kernel/proc.h>

void init_sched();
void init_schinfo(struct schinfo *);

WARN_RESULT Proc *thisproc();
bool _activate_proc(Proc *, bool onalert);
#define activate_proc(proc) _activate_proc(proc, false)     // 用于唤醒进程 (可以激活DEEPSLEEPING)
#define alert_proc(proc) _activate_proc(proc, true)         // 用于提醒进程 (不能激活DEEPSLEEPING)


void acquire_sched();
void release_sched();


void sched(enum procstate new_state);
u64 proc_entry(void (*entry)(u64), u64 arg);


// 获取调度锁，然后调用sched()函数
// MUST call lock_for_sched() before sched() !!!
#define yield() (acquire_sched(), sched(RUNNABLE))
