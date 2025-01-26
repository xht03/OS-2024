#include <fs/block_device.h>
#include <fs/cache.h>
#include <fs/defines.h>
#include <fs/fs.h>
#include <fs/inode.h>
#include <fs/file.h>
#include <common/defines.h>
#include <kernel/printk.h>
#include <common/buf.h>
#include <driver/virtio.h>

void init_filesystem() {
    // 读取超级块
    Buf super_buf;
    super_buf.flags = B_FREE;
    super_buf.block_no = 1;
    virtio_blk_rw(&super_buf);

    // 把超级块数据存入到全局变量中
    SuperBlock* sblock = get_super_block();
    *sblock = *(SuperBlock*)super_buf.data;
    
    init_block_device(); 
    init_bcache(sblock, &block_device);
    init_inodes(sblock, &bcache);
    init_ftable();
}
