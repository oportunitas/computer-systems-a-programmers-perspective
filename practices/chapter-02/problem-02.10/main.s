	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%.8x %8x\n"
	.text
	.globl	inplace_swap
	.type	inplace_swap, @function
inplace_swap:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movl	(%rsi), %ecx
	movl	(%rdi), %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	0(%rbp), %ecx
	xorl	(%rbx), %ecx
	movl	%ecx, 0(%rbp)
	movl	(%rbx), %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	0(%rbp), %edx
	xorl	(%rbx), %edx
	movl	%edx, (%rbx)
	movl	0(%rbp), %ecx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	0(%rbp), %ecx
	xorl	(%rbx), %ecx
	movl	%ecx, 0(%rbp)
	movl	(%rbx), %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	inplace_swap, .-inplace_swap
	.globl	main
	.type	main, @function
main:
	subq	$24, %rsp
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	$305419896, (%rsp)
	movl	$-19088744, 4(%rsp)
	leaq	4(%rsp), %rsi
	movq	%rsp, %rdi
	call	inplace_swap
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6
	movl	$0, %eax
	addq	$24, %rsp
	ret
.L6:
	call	__stack_chk_fail
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
