section .data
msg 	db	'Hello World!', 0Ah

section .text
global _start

_start:

			; Print Hello World
	mov edx, 13 	; Message size? 13
	mov ecx, msg 	; What to print? msg
	mov ebx, 1 	; Where to print? STDOUT
	mov eax, 4	; OPCODE? sys_write (32 bit)
	int 80h		; System interupt
	
			; End program
	mov ebx, 0	; Exit code? 0 
	mov eax, 1	; OPCODE? sys_exit (32 bit)
	int 80h		; System interupt

