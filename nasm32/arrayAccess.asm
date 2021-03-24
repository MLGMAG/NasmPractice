%include	'functions.asm'

section .data
arr	dd 	1, 2, 3

section .text
global	_start

_start:
	mov	ecx, arr
	mov	eax, [ecx]
	add	eax, 48
	call	quit

