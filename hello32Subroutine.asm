section .data
msg	db	'Hello subroutines!', 0Ah

section .text
global _start

_start:

	mov 	eax, msg	; copy msg first byte address

	call 	strlen		; calculate string length
	
				; Print message to screen
	mov	edx, eax	
	mov	ecx, msg
	mov	ebx, 1
	mov	eax, 4
	int	80h
	
				; End program
	mov	ebx, 0
	mov	eax, 1
	int	80h


				; Subroutine, that calculate string length
strlen:				; Begin
	push 	ebx
	mov 	ebx, eax

nextchar:
	cmp 	byte [eax], 0
	jz 	finish
	inc 	eax
	jmp 	nextchar

finish:
	sub 	eax, ebx
	pop	ebx
	ret			; End

