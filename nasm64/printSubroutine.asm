section .data
msg	db	'Hello subroutines!', 0Ah

section .text
global _start

_start:
	mov 	rax, msg	; copy msg first byte address

	call 	strlen		; calculate string length
	
				; Print message to screen
	mov	rdx, rax	
	mov	rsi, msg
	mov	rdi, 1
	mov	rax, 1
	syscall
	
				; End program
	mov	rdi, 0
	mov	rax, 60
	syscall


				; Subroutine, that calculate string length
strlen:				; Begin
	push 	rdi
	mov 	rdi, rax

.nextchar:
	cmp 	byte [rax], 0
	jz 	.finish
	inc 	rax
	jmp 	.nextchar

.finish:
	sub 	rax, rdi
	pop	rdi
	ret			; End
