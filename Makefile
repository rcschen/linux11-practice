include Makefile.header
#LDFLAGS += -Ttext 0 -e startup_32
#CPP	+= -Iinclude

ROOT_DEV= #FLOPPY 


all: Image

Image: boot/bootsect
	@tools/build.sh boot/bootsect boot/setup toos/kernel Image $(ROOT_DEV)
	@echo ccccomplete $(ROOT_DEV)

boot/bootsect: boot/bootsect.s
	@make bootsect -C boot

clean:
	@rm -f Image
	@for i in boot; do make clean -C $$i; done

debug:
	@qemu-system-x86_64 -m 16M -boot a -fda Image -s -S
