#pragma once

#include <common/defines.h>
#include <common/list.h>
#include <common/sem.h>
#include <common/rbtree.h>

enum procstate { UNUSED, RUNNABLE, RUNNING, SLEEPING, ZOMBIE };

typedef struct UserContext {
    // Special Regs
    u64 sp;     // Stack Pointer
    u64 elr;    // Exception Link Register
    u64 spsr;   // Saved Program Status Register
    
    // General Regs
    u64 x0;
    u64 x1;
    u64 x2;
    u64 x3;
    u64 x4;
    u64 x5;
    u64 x6;
    u64 x7;
    u64 x8;
    u64 x9;
    u64 x10;
    u64 x11;
    u64 x12;
    u64 x13;
    u64 x14;
    u64 x15;
    u64 x16;
    u64 x17;
    u64 x18;
    u64 x19;
    u64 x20;
    u64 x21;
    u64 x22;
    u64 x23;
    u64 x24;
    u64 x25;
    u64 x26;
    u64 x27;
    u64 x28;
    u64 x29; // Frame Pointer
    u64 x30; // Procedure Link Register
} UserContext;

typedef struct KernelContext {
    // TODO: customize your context
    u64 x0;
    u64 x1;


    u64 x19;
    u64 x20;
    u64 x21;
    u64 x22;
    u64 x23;
    u64 x24;
    u64 x25;
    u64 x26;
    u64 x27;
    u64 x28;
    u64 x29; // Frame Pointer
    u64 x30; // Procedure Link Register


} KernelContext;

// embeded data for procs
struct schinfo {
    // TODO: customize your sched info
    ListNode sched_node; // 串在调度队列中的（代表当前进程的）结点
};

typedef struct Proc {
    bool killed;    // 进程是否已被杀死
    bool idle;      // 是否是idle进程（是否正在等待某些事件或资源） 
    int pid;
    int exitcode;
    enum procstate state;       // 进程状态
    Semaphore childexit;        // 
    ListNode children;          // 子进程列表
    ListNode ptnode;            // 进程作为子进程时，自己串在链表上的节点。 
    struct Proc *parent;        // 父进程指针
    struct schinfo schinfo;     // 调度信息
    void *kstack;               // 内核栈
    UserContext *ucontext;      // 用户态上下文
    KernelContext *kcontext;    // 内核态上下文（也是内核栈开始处，从高到低）
} Proc;

void init_kproc();
void init_proc(Proc *);
Proc *create_proc();
int start_proc(Proc *, void (*entry)(u64), u64 arg);
NO_RETURN void exit(int code);
int wait(int *exitcode);
