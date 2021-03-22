%include	'functions.asm'

section .data
msg1	db	'Enter yout name:', 0h
msg2	db	'Hello, ', 0h

section .bss
userInput:	RESB	255

section .text
global _start

_start:
	mov	eax, msg1
	call	sprintLF
	
	mov	eax, userInput
	call	sread

	mov	eax, msg2
	call	sprint

	mov	eax, userInput
	call	sprint

	call quit

