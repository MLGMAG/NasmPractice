iprint:
	push    eax            
	push    ecx             
	push    edx             
	push	esi             
	mov     ecx, 0          
 
.divideLoop:
	inc     ecx             
	mov     edx, 0          
	mov     esi, 10         
	idiv    esi             
	add     edx, 48         
	push    edx             
	cmp     eax, 0          
	jnz     .divideLoop      
 
.printLoop:
	dec     ecx             
	mov     eax, esp        
	call    sprint          
	pop     eax             
	cmp     ecx, 0          
	jnz     .printLoop       
	
	pop     esi             
	pop     edx             
	pop     ecx             
	pop     eax             
	ret
 
 
iprintLF:
	call    iprint          
	
	push    eax            
	mov     eax, 0Ah      
	push    eax            
	mov     eax, esp        
	call    sprint          
	pop     eax             
	pop     eax             
	ret


slen:				; Calculate string length: slen(eax) 
	push	ebx
	mov	ebx, eax

.nextchar:
	cmp 	byte [eax], 0
	jz	.finish	
	inc	eax
	jmp	.nextchar

.finish:
	sub	eax, ebx
	pop 	ebx
	ret


sprint:
	push	edx
	push	ecx
	push	ebx
	push	eax
	
	call	slen

	mov	edx, eax
	pop	eax
	
	mov 	ecx, eax	
	mov 	ebx, 1
	mov 	eax, 4
	int	80h 
	
	pop	ebx
	pop	ecx
	pop	edx
	ret


sprintLF:			; Print message with line feed
	call	sprint

	push	eax
	mov	eax, 0Ah
	push	eax
	mov	eax, esp
	call	sprint
	pop	eax
	pop	eax
	ret
	

sread:				; Read user input: sread(eax buffer)
	push	eax
	push	ebx
	push	ecx
	push	edx

	mov	edx, 255
	mov	ecx, eax
	mov	ebx, 0
	mov	eax, 3
	int	80h

	pop	edx
	pop	ecx
	pop	ebx
	pop	eax
	ret


findMinElem:			; Find min element in array: findMinElem(eax arr, ebx arr_size)
	push	ebx
	push	ecx
	push	edx
	push	esi

	mov	ecx, 0
	mov	esi, [eax]
	
.findMinElemLoop:
        inc     ecx
	cmp     ecx, ebx
        jz      .finish
        mov     edx, [eax+ecx*4]
        cmp     esi, edx
        jl      .findMinElemLoop
        mov     esi, edx
        jmp     .findMinElemLoop

.finish:
	mov	eax, esi

	pop	esi
	pop	edx
	pop	ecx
	pop	ebx
	ret


findMaxElem:                    ; Find max element in array: findMaxElem(eax arr, ebx arr_size)
        push    ebx
        push    ecx
        push    edx
	push	esi

	mov	ecx, 0
	mov	esi, [eax]

.findMaxElemLoop:
        inc     ecx
        cmp     ecx, ebx
        jz      .finish
        mov     edx, [eax+ecx*4]
        cmp     esi, edx
        jg      .findMaxElemLoop
        mov     esi, edx
        jmp     .findMaxElemLoop

.finish:
	mov	eax, esi

	pop	esi
        pop     edx
        pop     ecx
        pop     ebx
        ret


quit:
	mov	ebx, 0
	mov	eax, 1
	int	80h
	ret

