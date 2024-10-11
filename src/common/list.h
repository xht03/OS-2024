#pragma once

#include <common/defines.h>
#include <common/spinlock.h>

// 链表结点
typedef struct ListNode {
    struct ListNode* prev;
    struct ListNode* next;
} ListNode;

void init_list_node(ListNode* node);
ListNode* _merge_list(ListNode* node1, ListNode* node2);
ListNode* _insert_into_list(ListNode* list, ListNode* node);
ListNode* _detach_from_list(ListNode* node);
bool _empty_list(ListNode* list);

// * List operations with locks
#define merge_list(lock, node1, node2)                                                   \
    ({                                                                                   \
        acquire_spinlock(lock);                                                          \
        ListNode* __t = _merge_list(node1, node2);                                       \
        release_spinlock(lock);                                                          \
        __t;                                                                             \
    })
#define insert_into_list(lock, list, node)                                               \
    ({                                                                                   \
        acquire_spinlock(lock);                                                          \
        ListNode* __t = _insert_into_list(list, node);                                   \
        release_spinlock(lock);                                                          \
        __t;                                                                             \
    })
#define detach_from_list(lock, node)                                                     \
    ({                                                                                   \
        acquire_spinlock(lock);                                                          \
        ListNode* __t = _detach_from_list(node);                                         \
        release_spinlock(lock);                                                          \
        __t;                                                                             \
    })

// -------------------------------- Queue -------------------------------- //

typedef struct Queue {
    ListNode* begin; // 队列头结点
    ListNode* end;   // 队列尾结点
    int sz;          // 队列大小
    SpinLock lk;     // 队列锁
} Queue;

void queue_init(Queue* x);
void queue_lock(Queue* x);
void queue_unlock(Queue* x);
void queue_push(Queue* x, ListNode* item);
void queue_pop(Queue* x);
void queue_detach(Queue* x, ListNode* item);
ListNode* queue_front(Queue* x);
bool queue_empty(Queue* x);

#define queue_push_lock(x, item)                                                         \
    ({                                                                                   \
        queue_lock(x);                                                                   \
        queue_push(x, item);                                                             \
        queue_unlock(x);                                                                 \
    })
#define queue_pop_lock(x)                                                                \
    ({                                                                                   \
        queue_lock(x);                                                                   \
        queue_pop(x);                                                                    \
        queue_unlock(x);                                                                 \
    })
#define queue_detach_lock(x, item)                                                       \
    ({                                                                                   \
        queue_lock(x);                                                                   \
        queue_detach(x, item);                                                           \
        queue_unlock(x);                                                                 \
    })

// -------------------------------- QueueNode -------------------------------- //

// 无锁队列结点 (并发安全)
typedef struct QueueNode {
    struct QueueNode* next;
} QueueNode;

QueueNode* add_to_queue(QueueNode** head, QueueNode* node);
QueueNode* fetch_from_queue(QueueNode** head);
QueueNode* fetch_all_from_queue(QueueNode** head);