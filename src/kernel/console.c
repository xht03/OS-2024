#include <kernel/console.h>
#include <aarch64/intrinsic.h>
#include <kernel/sched.h>
#include <driver/uart.h>

#define BACKSPACE 0x100

struct console cons;

void console_init()
{
    init_spinlock(&cons.lock); // 初始化终端锁
    init_sleeplock(&cons.sem); // 初始化终端休眠锁
}

// 将单字符直接写到UART
// 用于printf和终端回显
void consputc(int c)
{
    // 如果用户输入了退格, 就用空格覆盖
    if (c == BACKSPACE) {
        uart_put_char('\b');
        uart_put_char(' ');
        uart_put_char('\b');
    } else
        uart_put_char(c);
}

/**
 * console_write - write to uart from the console buffer.
 * @ip: the pointer to the inode
 * @buf: the buffer
 * @n: number of bytes to write
 */
isize console_write(Inode *ip, char *buf, isize n)
{
    ASSERT(ip->entry.type == INODE_DEVICE);

    int i;
    for (i = 0; i < n; i++)
        uart_put_char(buf[i]);
    return i;
}

/**
 * console_read - read to the destination from the buffer
 * @ip: the pointer to the inode
 * @dst: the destination
 * @n: number of bytes to read
 */
isize console_read(Inode *ip, char *dst, isize n)
{
    ASSERT(ip->entry.type == INODE_DEVICE);

    // 记录期望读取的字符数
    usize target = n;

    acquire_spinlock(&cons.lock); // 获取终端锁

    while (n > 0) {
        // 如果终端缓冲区此时为空
        while (cons.read_idx == cons.write_idx) {
            // 如果进程有终止标志, 则直接返回-1
            if (thisproc()->killed) {
                release_spinlock(&cons.lock); // 释放终端锁
                return -1;
            }

            release_spinlock(&cons.lock); // 释放终端锁
            acquire_sleeplock(&cons.sem); // 休眠等待终端输入响应
            acquire_spinlock(&cons.lock); // 获取终端锁
        }

        // 从终端缓冲区取出一个字符
        char c = cons.buf[cons.read_idx % IBUF_SIZE];
        cons.read_idx++;

        // Ctrl+D 文件结束符
        if (c == C('D')) {
            // 如果已经读取了一些字符
            // 那么还原^D, 供下次读取
            if ((usize)n < target)
                cons.read_idx--;
            break;
        }

        // 将输入字符 拷贝到 用户空间缓冲区
        *dst = c;

        // 继续下一个字符
        dst++;
        n--;

        // 如果遇到换行符, 则结束读取
        if (c == '\n')
            break;
    }

    release_spinlock(&cons.lock); // 释放终端锁

    return target - n;
}

void console_intr(char c)
{
    acquire_spinlock(&cons.lock); // 获取终端锁

    switch (c) {
        // Ctrl+U 删除整行
        case C('U'):
            while (cons.edit_idx != cons.write_idx && cons.buf[(cons.edit_idx - 1) % IBUF_SIZE] != '\n') {
                cons.edit_idx--;
                consputc(BACKSPACE);
            }
            break;

        // 退格键 删除一个字符
        case '\x7f':
            if (cons.edit_idx != cons.write_idx) {
                cons.edit_idx--;
                consputc(BACKSPACE);
            }
            break;

        // 其他情况 追加到cons.buf
        default:
            // 如果字符有效, 且缓冲区未满, 则追加到缓冲区
            if (c != 0 && cons.edit_idx - cons.read_idx < IBUF_SIZE) {
                c = (c == '\r') ? '\n' : c; // 将\r转换为\n

                // 回显给用户
                consputc(c);

                // 将字符添加到缓冲区, 用于consoleread()
                cons.buf[cons.edit_idx % IBUF_SIZE] = c;
                cons.edit_idx++;

                // 如果遇到换行符|结束符, 或者缓冲区已满
                if (c == '\n' || c == C('D') || cons.edit_idx - cons.read_idx == IBUF_SIZE) {
                    cons.write_idx = cons.edit_idx;     // 更新已写部分的索引
                    release_sleeplock(&cons.sem);       // 唤醒consoleread()
                }
            }
            break;
    }

    release_spinlock(&cons.lock); // 释放终端锁
}