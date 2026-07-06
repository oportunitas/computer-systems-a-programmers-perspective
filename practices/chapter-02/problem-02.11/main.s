	.file	"main.c"
	.text
	.globl	inplace_swap
	.type	inplace_swap, @function
inplace_swap:
	movl	(%rsi), %eax
	xorl	(%rdi), %eax
	movl	%eax, (%rsi)
	xorl	(%rdi), %eax
	movl	%eax, (%rdi)
	xorl	%eax, (%rsi)
	ret
	.size	inplace_swap, .-inplace_swap
	.globl	reverse_array
	.type	reverse_array, @function
reverse_array:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r12
	leal	-1(%rsi), %ebx
	movl	$0, %ebp
	jmp	.L3
.L4:
	movslq	%ebx, %rdx
	movslq	%ebp, %rax
	leaq	(%r12,%rdx,4), %rsi
	leaq	(%r12,%rax,4), %rdi
	call	inplace_swap
	addl	$1, %ebp
	subl	$1, %ebx
.L3:
	cmpl	%ebx, %ebp
	jl	.L4
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	reverse_array, .-reverse_array
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbx
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movl	$1, (%rsp)
	movl	$2, 4(%rsp)
	movl	$3, 8(%rsp)
	movl	$4, 12(%rsp)
	movl	$5, 16(%rsp)
	movl	$5, %esi
	movq	%rsp, %rdi
	call	reverse_array
	movl	$0, %ebx
	jmp	.L7
.L8:
	movslq	%ebx, %rax
	movl	(%rsp,%rax,4), %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	addl	$1, %ebx
.L7:
	cmpl	$4, %ebx
	jle	.L8
	movl	$10, %edi
	call	putchar
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L11
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
.L11:
	call	__stack_chk_fail
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
