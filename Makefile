ifneq ($(KERNELRELEASE),)
	obj-m := virtunoid.o
else
	KDIR ?= /home/yuyu/src/linux-3.0/
	PWD := $(shell pwd)

all: 
	make -C $(KDIR) M=$(PWD) modules
	mkdir -p out
	cp virtunoid.ko out/virtunoid.ko
	cp init out/init
	chmod +x out/init
	mkdir -p out/proc
	mkdir -p out/bin
	#cp /bin/busybox out/bin/busybox
	cp /home/yuyu/src/busybox/busybox-1.17.1/busybox out/bin/busybox
	ln -sf busybox out/bin/ls
	ln -sf busybox out/bin/mknod
	ln -sf busybox out/bin/mount
	ln -sf busybox out/bin/ifconfig
	ln -sf busybox out/bin/udhcpc
	ln -sf busybox out/bin/insmod
	ln -sf busybox out/bin/sh
	(cd out && find | cpio -o -Hnewc) > initrd
	gzip -f initrd

clean: 
	make -C $(KDIR) M=$(PWD) clean
	rm -fR out
endif
