	.file	"show-bytes.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%.8b"
	.text
	.globl	show_bytes
	.type	show_bytes, @function
show_bytes:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r12
	movq	%rsi, %rbp
	movl	$0, %ebx
	jmp	.L2
.L3:
	movq	%rbp, %rdx
	subq	%rax, %rdx
	movzbl	-1(%r12,%rdx), %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	addl	$1, %ebx
.L2:
	movslq	%ebx, %rax
	cmpq	%rbp, %rax
	jb	.L3
	movl	$10, %edi
	call	putchar
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	show_bytes, .-show_bytes
	.globl	show_int
	.type	show_int, @function
show_int:
	subq	$24, %rsp
	movl	%edi, 12(%rsp)
	movl	$4, %esi
	leaq	12(%rsp), %rdi
	call	show_bytes
	addq	$24, %rsp
	ret
	.size	show_int, .-show_int
	.globl	show_float
	.type	show_float, @function
show_float:
	subq	$24, %rsp
	movss	%xmm0, 12(%rsp)
	movl	$4, %esi
	leaq	12(%rsp), %rdi
	call	show_bytes
	addq	$24, %rsp
	ret
	.size	show_float, .-show_float
	.globl	show_pointer
	.type	show_pointer, @function
show_pointer:
	subq	$24, %rsp
	movq	%rdi, 8(%rsp)
	movl	$8, %esi
	leaq	8(%rsp), %rdi
	call	show_bytes
	addq	$24, %rsp
	ret
	.size	show_pointer, .-show_pointer
	.globl	test_show_bytes
	.type	test_show_bytes, @function
test_show_bytes:
	subq	$24, %rsp
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	%edi, (%rsp)
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%edi, %xmm0
	movss	%xmm0, 4(%rsp)
	call	show_int
	movss	4(%rsp), %xmm0
	call	show_float
	movq	%rsp, %rdi
	call	show_pointer
	leaq	4(%rsp), %rdi
	call	show_pointer
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L14
	addq	$24, %rsp
	ret
.L14:
	call	__stack_chk_fail
	.size	test_show_bytes, .-test_show_bytes
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$12345, %edi
	call	test_show_bytes
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
