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

