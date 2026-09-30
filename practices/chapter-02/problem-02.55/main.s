	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" %2x"
	.text
	.globl	show_bytes
	.type	show_bytes, @function
show_bytes:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r12
	movl	%esi, %ebp
	movl	$0, %ebx
	jmp	.L2
.L3:
	movslq	%ebx, %rax
	movzbl	(%r12,%rax), %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	addl	$1, %ebx
.L2:
	cmpl	%ebp, %ebx
	jl	.L3
	movl	$10, %edi
	call	putchar
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	show_bytes, .-show_bytes
	.globl	main
	.type	main, @function
main:
	subq	$24, %rsp
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	$-2023406815, 4(%rsp)
	movl	$20, %esi
	leaq	4(%rsp), %rdi
	call	show_bytes
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L8
	movl	$0, %eax
	addq	$24, %rsp
	ret
.L8:
	call	__stack_chk_fail
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
