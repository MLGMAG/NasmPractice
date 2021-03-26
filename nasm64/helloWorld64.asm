section .data
msg 	db	"Hello World!", 0Ah

section .text
global _start

_start:
	mov rdx, 13
	mov rsi, msg
	mov rdi, 1
	mov rax, 1
	syscall
	
	mov rdi, 0
	mov rax, 60
	syscall

