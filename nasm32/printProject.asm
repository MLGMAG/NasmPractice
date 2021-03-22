%include	'functions.asm'

section .data
msg1	db	'Hello World1!', 0h
msg2	db	'Hello World2!', 0h
msg3	db	'Hello World3!', 0h

section .text
global _start

_start:
	mov	eax, msg1
	call	sprintLF

	mov	eax, msg2
	call	sprintLF

	mov	eax, msg3
	call	sprintLF

	call	quit

