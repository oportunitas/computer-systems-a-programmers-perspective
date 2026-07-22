	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"step: %i\n"
	.text
	.globl	sum_elements
	.type	sum_elements, @function
sum_elements:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movl	%esi, %ebp
	movl	$0, %ebx
	jmp	.L2
.L3:
	movl	%ebx, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	addl	$1, %ebx
.L2:
	cmpl	%ebx, %ebp
	jg	.L3
	pxor	%xmm0, %xmm0
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	sum_elements, .-sum_elements
	.section	.rodata.str1.1
.LC6:
	.string	"%f\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$40, %rsp
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movl	$0x3f800000, (%rsp)
	movl	$0x40000000, 4(%rsp)
	movl	$0x40400000, 8(%rsp)
	movl	$0x40800000, 12(%rsp)
	movl	$0, %esi
	movq	%rsp, %rdi
	call	sum_elements
	cvtss2sd	%xmm0, %xmm0
	movl	$.LC6, %esi
	movl	$2, %edi
	movl	$1, %eax
	call	__printf_chk
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L8
	movl	$0, %eax
	addq	$40, %rsp
	ret
.L8:
	call	__stack_chk_fail
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
