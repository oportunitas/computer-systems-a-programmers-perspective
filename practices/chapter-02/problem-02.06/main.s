	.file	"main.c"
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
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$3510593, %edi
	call	show_int
	movss	.LC1(%rip), %xmm0
	call	show_float
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1247167748
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
