%include	'functions64.asm'

section .data
array			dq	10, 20, 30, 40, 50
arraySize		equ	($ - array) / 8
arrayMsg		db	'Array: ', 0h
arraySizeMsg		db	'Array size is ', 0h
arrayAfterShiftMsg	db	'Array after shift: ', 0h

section .text
global _start

_start:
	; print array
	mov	rax, arrayMsg
	call	sprint
	mov	rax, array
	mov	rdi, arraySize
	call	printArray
	mov	rax, 0Ah
	call	cprint
	
	; print sizeMsg
	mov	rax, arraySizeMsg
	call	sprint	
	mov	rax, arraySize
	call	iprintLF
	
	; shift array
	mov	rax, array
	mov	rdi, arraySize
	call	rightShiftArray
	
	; print array
	mov	rax, arrayAfterShiftMsg
	call	sprint
	mov	rax, array
	mov	rdi, arraySize
	call	printArray
	mov	rax, 0Ah
	call	cprint

	call	quit

