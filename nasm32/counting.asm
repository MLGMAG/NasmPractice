%include	'functions.asm'

section .text
global _start

_start:
	mov	ecx, 0

iterate:
	cmp	ecx, 10
	jz	endIter
	mov	eax, ecx
	add	eax, 48
	push	eax
	mov	eax, esp
	call	sprintLF
	pop	eax
	inc	ecx	
	jmp	iterate

endIter:
	call	quit
	
