section .data
msg	db	'Hello my friends', 0Ah

section .text
global _start

_start:					; Copy address of first symbol of msg in 2 registers
	mov	ebx, msg
	mov	eax, ebx
	
.nextchar:				; Loop. Inxriment eax until it will contain '0'
	cmp	byte [eax], 0
	jz	.finish
	inc	eax
	jmp	.nextchar

.finish:			
	sub	eax, ebx		; Calculate difference between last and first memory adress
	
					; Write msg to screen
	mov	edx, eax
	mov	ecx, msg
	mov	ebx, 1
	mov	eax, 4
	int	80h

					; End programm
	mov	ebx, 0
	mov	eax, 1 
	int	80h

