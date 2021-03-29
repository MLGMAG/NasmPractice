slen:				; Calculate string length: slen(rax *string) 
	push	rdi
	mov	rdi, rax

.nextchar:
	cmp 	byte [rax], 0
	jz	.finish	
	inc	rax
	jmp	.nextchar

.finish:
	sub	rax, rdi
	pop 	rdi
	ret


sprint:				; Print sprint: sprint(eax string)
	push	rdx
	push	rsi
	push	rdi
	push	rax
	
	call	slen

	mov	rdx, rax
	pop	rax
	
	mov 	rsi, rax	
	mov 	rdi, 1
	mov 	rax, 1
	syscall
	
	pop	rdi
	pop	rsi
	pop	rdx
	ret


sprintLF:			; Print message with line feed: sprintLF(eax string)
	call	sprint

	push	rax
	mov	rax, 0Ah
	push	rax
	mov	rax, rsp
	call	sprint
	pop	rax
	pop	rax
	ret

quit:
	mov	ebx, 0
	mov	eax, 60
	syscall
	ret


