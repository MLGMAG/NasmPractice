%include	'functions64.asm'

section .data
array		dq	43, 81, 79, 9, 50, 45, 37, 22, 3, 99, 500
arraySize	equ	($ - array) / 8
minElem		dq	0h
maxElem		dq	0h
sum		dq	0h
arrayMsg	db	'Array: ', 0h
sizeMsg		db	'Array size is ', 0h
findElementsMsg	db	'Finding max and min elements in array...', 0h
minElemMsg	db	'Min element is ', 0h
maxElemMsg	db	'Max element is ', 0h
sumMsg		db	'Sum is ', 0h

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
	mov	rax, sizeMsg 
	call	sprint	
	mov	rax, arraySize
	call	iprintLF

	; print findElementsMsg
	mov	rax, findElementsMsg
	call	sprintLF
	
	; calculate min
	mov	rax, array
	mov	rdi, arraySize 
	call	findMinElem
	mov	[minElem], rax

	; print minElemMsg
	mov	rax, minElemMsg
	call	sprint
	mov	rax, [minElem]
	call	iprintLF

	; calculate max	
	mov	rax, array
	mov	rdi, arraySize
	call	findMaxElem
	mov	[maxElem], rax

	; print maxElemMsg	
	mov	rax, maxElemMsg
	call	sprint
	mov	rax, [maxElem]
	call	iprintLF
	
	; calculate sum of min and max
	mov	rax, [maxElem]
	mov	rdi, [minElem]
	add	rax, rdi
	mov	[sum], rax 

	; print sumMsg
	mov	rax, sumMsg
	call	sprint
	mov	rax, [sum]
	call	iprintLF
	
	call	quit	

