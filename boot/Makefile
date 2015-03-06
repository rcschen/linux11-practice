include ../Makefile.header

LDFLAGS	+= -Ttext 0

all: bootsect
bootsect: bootsect.s
	@$(AS) -o bootsect.o bootsect.s
	@$(LD) $(LDFLAGS) -o bootsect bootsect.o
clean:
	@rm -f bootsect bootsect.o
