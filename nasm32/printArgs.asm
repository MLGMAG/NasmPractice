%include	'functions.asm'

section .text
global _start

_start:
	pop	ecx
	
getArg:
	cmp	ecx, 0h
	jz	.noMoreArgs
	pop	eax
	call	sprintLF
	dec	ecx
	jmp	.getArg

.noMoreArgs:
	call	quit	

