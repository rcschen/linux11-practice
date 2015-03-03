include Makefile.header

all: Image
Image: boot/bootsect
	@echo ccccomplete

boot/bootsect: boot/bootsect.s
	@make bootsect -C boot

clean:
	@for i in boot; do make clean -C $$i; done

debug:
	@qemu-system-x86_64 -m 16M -boot a -fda Image -s -S
