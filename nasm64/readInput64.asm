%include	'functions64.asm'

section .data
msg1	db	'Enter yout name:', 0h
msg2	db	'Hello, ', 0h

section .bss
userInput:	RESB	255

section .text
global _start

_start:
	mov	rax, msg1
	call	sprintLF
	
	mov	rax, userInput
	call	sread

	mov	rax, msg2
	call	sprint

	mov	rax, userInput
	call	sprint

	call	quit
