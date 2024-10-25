#pragma once
#include "common/defines.h"
#include "common/spinlock.h"

// 红黑树节点
struct rb_node_ {
    unsigned long __rb_parent_color;
    struct rb_node_* rb_right;
    struct rb_node_* rb_left;
} __attribute__((aligned(sizeof(long))));

typedef struct rb_node_* rb_node;

// 红黑树根节点
struct rb_root_ {
    rb_node rb_node;
    SpinLock lock;
};
typedef struct rb_root_* rb_root;

/* NOTE:You should add lock when use */
int _rb_insert(rb_node node, rb_root root, bool (*cmp)(rb_node lnode, rb_node rnode));
void _rb_erase(rb_node node, rb_root root);
rb_node _rb_lookup(rb_node node, rb_root rt, bool (*cmp)(rb_node lnode, rb_node rnode));
rb_node _rb_first(rb_root root);

// 加锁版本
#define rb_init(root)                                                                    \
    ({                                                                                   \
        (root)->rb_node = NULL;                                                          \
        init_spinlock(&(root)->lock);                                                    \
    })

#define rb_insert_lock(node, root, cmp)                                                  \
    ({                                                                                   \
        acquire_spinlock(&(root)->lock);                                                 \
        int ret = _rb_insert(node, root, cmp);                                           \
        release_spinlock(&(root)->lock);                                                 \
        ret;                                                                             \
    })

#define rb_erase_lock(node, root)                                                        \
    ({                                                                                   \
        acquire_spinlock(&(root)->lock);                                                 \
        _rb_erase(node, root);                                                           \
        release_spinlock(&(root)->lock);                                                 \
    })

#define rb_lookup_lock(node, root, cmp)                                                  \
    ({                                                                                   \
        acquire_spinlock(&(root)->lock);                                                 \
        rb_node ret = _rb_lookup(node, root, cmp);                                       \
        release_spinlock(&(root)->lock);                                                 \
        ret;                                                                             \
    })

#define rb_first_lock(root)                                                              \
    ({                                                                                   \
        acquire_spinlock(&(root)->lock);                                                 \
        rb_node ret = _rb_first(root);                                                   \
        release_spinlock(&(root)->lock);                                                 \
        ret;                                                                             \
    })
