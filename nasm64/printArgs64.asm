%include	'functions64.asm'

section .text
global _start

_start:
	pop	rsi
	
.getArg:
	cmp	rsi, 0h
	jz	.noMoreArgs
	pop	rax
	call	sprintLF
	dec	rsi
	jmp	.getArg

.noMoreArgs:
	call	quit	

