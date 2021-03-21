%include	'functions.asm'

section .data
msg1	db	'Hello World1!', 0Ah
msg2	db	'Hello World2!', 0Ah
msg3	db	'Hello World3!', 0Ah

section .text
global _start

_start:
	mov	eax, msg1
	call	sprint

	mov	eax, msg2
	call	sprint

	mov	eax, msg3
	call	sprint

	call	quit

