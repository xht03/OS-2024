#pragma once

#include <common/defines.h>
#include <common/list.h>
#include <common/sem.h>
#include <common/rbtree.h>
#include <kernel/pt.h>
#include <fs/file.h>
#include <fs/inode.h>


enum procstate { UNUSED, RUNNABLE, RUNNING, SLEEPING, DEEPSLEEPING, ZOMBIE };


typedef struct UserContext {
    // Special Regs
    u64 sp_el0;     // Stack Pointer (sp_el0)
    u64 spsr_el1;   // Saved Program Status Register
    u64 elr_el1;    // Exception Link Register
    
    
    // General Regs
    u64 x0;         // Return Value
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

    u64 kernel_sp; // Kernel Stack Pointer

} UserContext;


typedef struct KernelContext {
    u64 x0; // start_proc 第一个参数
    u64 x1; // start_proc 第二个参数

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


// 进程调度信息
// embeded data for procs
struct schinfo {
    ListNode sched_node; // 串在调度队列中的（代表当前进程的）结点
};

typedef struct Proc {
    SpinLock lock;  // 每个进程的锁

    bool killed;    // 进程是否已被杀死
    bool idle;      // 是否是idle进程（是否正在等待某些事件或资源） 
    int pid;
    struct rb_node_ pid_node;   // 进程树的节点
    int exitcode;
    enum procstate state;       // 进程状态
    Semaphore childexit;        // 
    ListNode children;          // 子进程列表
    ListNode ptnode;            // 进程作为子进程时，自己串在链表上的节点。 
    struct Proc *parent;        // 父进程指针
    struct schinfo schinfo;     // 调度信息
    struct pgdir pgdir;         // 进程的页表

    KernelContext *kcontext;    // 内核态上下文 (也是内核栈开始处，从高到低)
    UserContext *ucontext;      // 用户态上下文 (用户态、内核态之间切换)
    
    struct oftable oftable;     // 进程的打开文件表
    Inode *cwd;                 // 当前工作目录
} Proc;

void init_kproc();
void init_proc(Proc *);
WARN_RESULT Proc *create_proc();
int start_proc(Proc *, void (*entry)(u64), u64 arg);
NO_RETURN void exit(int code);
WARN_RESULT int wait(int *exitcode);
WARN_RESULT int kill(int pid);
WARN_RESULT int fork();