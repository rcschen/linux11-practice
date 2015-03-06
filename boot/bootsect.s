	.code16

	.equ SYSSIZE, 0x3000
	
	.global  _start, begtext, begdata, begbss, endtext, enddata, endbss
	.text
	begtext:
	.data
	begdata:
	.bss
	begbss:
	.text

	.equ SETUPLEN, 4
	.equ BOOTSEG, 0x07c0
	ljmp    $BOOTSEG, $_start
_start:
	mov	$BOOTSEG, %ax


	.text
	endtext:
	.data
	enddata:
	.bss
	endbss:
