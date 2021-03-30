iprint:				; Print integer: iprint(eax number)
	push    rax            
	push    rsi             
	push    rdx             
	push	r10             
	push	rcx
	mov     rsi, 0          
 
.divideLoop:
	inc     rsi             
	mov     rdx, 0          
	mov     r10, 10         
	idiv    r10             
	add     rdx, 48         
	push    rdx             
	cmp     rax, 0          
	jnz     .divideLoop      
 
.printLoop:
	dec     rsi             
	mov     rax, rsp        
	call    sprint          
	pop     rax             
	cmp     rsi, 0          
	jnz     .printLoop       
	
	pop	rcx
	pop     r10             
	pop     rdx             
	pop     rsi             
	pop     rax             
	ret
 
 
iprintLF:			; Print integer with line feed: iprintLF(eax number)
	call    iprint          
	
	push    rax            
	mov     rax, 0Ah      
	push    rax            
	mov     rax, rsp        
	call    sprint          
	pop     rax             
	pop     rax             
	ret


printArray:			; Print array: printArray(rax array, rdi arraySize)
	push	rax
	push	rdi
	push	rcx	
	push	rdx
		
	mov	rdx, rax
	dec	rdi
	mov	rcx, 0
	
	mov	rax, '['
	call	cprint
	
.printElem:
	cmp	rcx, rdi
	jz	.finish
	mov	rax, [rdx+rcx*8]	
	call	iprint		
	mov	rax, ','
	call 	cprint
	mov	rax, ' '
	call	cprint
	inc	rcx
	jmp	.printElem

.finish:
	mov	rax, [rdx+rcx*8]
	call	iprint
	mov	rax, ']'
	call	cprint
	
	pop	rdx
	pop	rcx
	pop	rdi
	pop	rax
	ret		


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


cprint:				; Print single character: cprint(rax symbol)
	push	rax
	push	rdi
	push	rsi 
	push	rdx
	push	rcx
	
	mov	rdx, 1
	
	push	rax
	mov	rsi, rsp
	pop	rax
	
	mov	rdi, 1
	mov	rax, 1
	syscall

	pop	rcx
	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax
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


sread:				; Read user input: sread(eax buffer)
	push	rax
	push	rdi
	push	rsi
	push	rdx

	mov	rdx, 255
	mov	rsi, rax
	mov	rdi, 0
	mov	rax, 0
	syscall

	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax
	ret


findMinElem:			; Find min element in array: findMinElem(eax arr, ebx arr_size)
	push	rdi
	push	rsi
	push	rdx
	push	r10

	mov	rsi, 0
	mov	r10, [rax]
	
.findMinElemLoop:
        inc     rsi
	cmp     rsi, rdi
        jz      .finish
        mov     rdx, [rax+rsi*8]
        cmp     r10, rdx
        jl      .findMinElemLoop
        mov     r10, rdx
        jmp     .findMinElemLoop

.finish:
	mov	rax, r10

	pop	r10
	pop	rdx
	pop	rsi
	pop	rdi
	ret


findMaxElem:                    ; Find max element in array: findMaxElem(eax arr, ebx arr_size)
        push    rdi
        push    rsi
        push    rdx
	push	r10

	mov	rsi, 0
	mov	r10, [rax]

.findMaxElemLoop:
        inc     rsi
        cmp     rsi, rdi
        jz      .finish
        mov     rdx, [rax+rsi*8]
        cmp     r10, rdx
        jg      .findMaxElemLoop
        mov     r10, rdx
        jmp     .findMaxElemLoop

.finish:
	mov	rax, r10

	pop	r10
        pop     rdx
        pop     rsi
        pop     rdi
        ret


quit:
	mov	ebx, 0
	mov	eax, 60
	syscall
	ret

