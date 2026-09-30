	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" %02x"
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
	.globl	show_short
	.type	show_short, @function
show_short:
	pushq	%rbx
	subq	$16, %rsp
	movw	%di, 12(%rsp)
	movl	$0, %ebx
	jmp	.L6
.L7:
	movslq	%ebx, %rax
	movzbl	12(%rsp,%rax), %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	addl	$1, %ebx
.L6:
	cmpl	$1, %ebx
	jbe	.L7
	movl	$10, %edi
	call	putchar
	addq	$16, %rsp
	popq	%rbx
	ret
	.size	show_short, .-show_short
	.globl	show_long
	.type	show_long, @function
show_long:
	pushq	%rbx
	subq	$16, %rsp
	movq	%rdi, 8(%rsp)
	movl	$0, %ebx
	jmp	.L10
.L11:
	movslq	%ebx, %rax
	movzbl	8(%rsp,%rax), %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	addl	$1, %ebx
.L10:
	cmpl	$7, %ebx
	jbe	.L11
	movl	$10, %edi
	call	putchar
	addq	$16, %rsp
	popq	%rbx
	ret
	.size	show_long, .-show_long
	.globl	show_double
	.type	show_double, @function
show_double:
	pushq	%rbx
	subq	$16, %rsp
	movsd	%xmm0, 8(%rsp)
	movl	$0, %ebx
	jmp	.L14
.L15:
	movslq	%ebx, %rax
	movzbl	8(%rsp,%rax), %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	addl	$1, %ebx
.L14:
	cmpl	$7, %ebx
	jbe	.L15
	movl	$10, %edi
	call	putchar
	addq	$16, %rsp
	popq	%rbx
	ret
	.size	show_double, .-show_double
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$33, %edi
	call	show_short
	movabsq	$733116830367, %rdi
	call	show_long
	movsd	.LC1(%rip), %xmm0
	call	show_double
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	-527490703
	.long	1076472390
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
