%include	'functions.asm'

section .data
array		dd	43, 81, 79, 9, 50, 45, 37, 22, 3, 99, 500
arraySize	equ	($ - array) / 4
minElem		dd	0h
maxElem		dd	0h
sum		dd	0h
sizeMsg		db	'Array size is ', 0h
findElementsMsg	db	'Finding max and min elements in array...', 0h
minElemMsg	db	'Min element is ', 0h
maxElemMsg	db	'Max element is ', 0h
sumMsg		db	'Sum is ', 0h

section .text
global _start

_start:
	; print sizeMsg
	mov	eax, sizeMsg 
	call	sprint	
	mov	eax, arraySize
	call	iprintLF

	; print findElementsMsg
	mov	eax, findElementsMsg
	call	sprintLF
	
	; calculate min
	mov	eax, array
	mov	ebx, arraySize 
	call	findMinElem
	mov	[minElem], eax

	; print minElemMsg
	mov	eax, minElemMsg
	call	sprint
	mov	eax, [minElem]
	call	iprintLF

	; calculate max	
	mov	eax, array
	mov	ebx, arraySize
	call	findMaxElem
	mov	[maxElem], eax

	; print maxElemMsg	
	mov	eax, maxElemMsg
	call	sprint
	mov	eax, [maxElem]
	call	iprintLF
	
	; calculate sum of min and max
	mov	eax, [maxElem]
	add	eax, [minElem]
	mov	[sum], eax

	; print sumMsg
	mov	eax, sumMsg
	call	sprint
	mov	eax, [sum]
	call	iprintLF
	
	call	quit	

