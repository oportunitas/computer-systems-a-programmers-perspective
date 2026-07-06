	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%.2x "
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
	movzbl	(%r12,%rax), %edx
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
	.globl	show_bytes_reverse_endian
	.type	show_bytes_reverse_endian, @function
show_bytes_reverse_endian:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %r12
	movq	%rsi, %rbp
	movl	$0, %ebx
	jmp	.L6
.L7:
	movq	%rbp, %rdx
	subq	%rax, %rdx
	movzbl	-1(%r12,%rdx), %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	addl	$1, %ebx
.L6:
	movslq	%ebx, %rax
	cmpq	%rbp, %rax
	jb	.L7
	movl	$10, %edi
	call	putchar
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	show_bytes_reverse_endian, .-show_bytes_reverse_endian
	.globl	main
	.type	main, @function
main:
	subq	$24, %rsp
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	$-2023406815, 4(%rsp)
	movl	$1, %esi
	leaq	4(%rsp), %rdi
	call	show_bytes
	movl	$2, %esi
	leaq	4(%rsp), %rdi
	call	show_bytes
	movl	$3, %esi
	leaq	4(%rsp), %rdi
	call	show_bytes
	movl	$1, %esi
	leaq	4(%rsp), %rdi
	call	show_bytes_reverse_endian
	movl	$2, %esi
	leaq	4(%rsp), %rdi
	call	show_bytes_reverse_endian
	movl	$3, %esi
	leaq	4(%rsp), %rdi
	call	show_bytes_reverse_endian
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L12
	movl	$0, %eax
	addq	$24, %rsp
	ret
.L12:
	call	__stack_chk_fail
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
