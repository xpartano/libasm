section .text
	global ft_read
	extern __errno_location

ft_read:
	mov		rax, 0
	syscall
	cmp		rax, 0
	jl		error
	ret

error:
	push	rax
	call	__errno_location
	mov		rdi, rax
	pop		rax
	mov		[rdi], rax
	mov		rax, -1
	ret