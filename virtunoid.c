#include <linux/init.h>
#include <linux/module.h>

static int virtunoid_init(void)
{
    printk(KERN_ALERT "Hello, world\n");
}

static void virtunoid_exit(void)
{
    printk(KERN_ALERT "Goodbye\n");
}

module_init(virtunoid_init);
module_exit(virtunoid_exit);
