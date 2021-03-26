section .data
msg	db	'Hello x86_64 bit', 0Ah

section .text
global _start

_start:					; Copy address of first symbol of msg in 2 registers
	mov	rdi, msg
	mov	rax, rdi
	
.nextchar:				; Loop. Inxriment eax until it will contain '0'
	cmp	byte [rax], 0
	jz	.finish
	inc	rax
	jmp	.nextchar

.finish:			
	sub	rax, rdi		; Calculate difference between last and first memory adress
	
					; Write msg to screen
	mov	rdx, rax
	mov	rsi, msg
	mov	rdi, 1
	mov	rax, 1
	syscall

					; End programm
	mov	rdi, 0
	mov	rax, 60 
	syscall

