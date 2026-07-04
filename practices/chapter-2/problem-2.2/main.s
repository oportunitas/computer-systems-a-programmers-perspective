	.file	"main.c"
	.text
	.globl	int_pow
	.type	int_pow, @function
int_pow:
	movl	$0, %eax
	movl	$1, %edx
	jmp	.L2
.L3:
	imull	%edi, %edx
	addl	$1, %eax
.L2:
	cmpl	%esi, %eax
	jl	.L3
	movl	%edx, %eax
	ret
	.size	int_pow, .-int_pow
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
	.text
	.globl	convert
	.type	convert, @function
convert:
	subq	$8, %rsp
	movl	%edi, %esi
	movl	$2, %edi
	call	int_pow
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	addq	$8, %rsp
	ret
	.size	convert, .-convert
	.section	.rodata.str1.1
.LC1:
	.string	"from: "
.LC2:
	.string	" %c"
.LC3:
	.string	"to  : "
.LC4:
	.string	"x   : "
.LC5:
	.string	" %i"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$24, %rsp
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$2, %edi
	call	__printf_chk
	leaq	2(%rsp), %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC3, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	leaq	3(%rsp), %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC4, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	leaq	4(%rsp), %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movsbl	3(%rsp), %edx
	movsbl	2(%rsp), %esi
	movl	4(%rsp), %edi
	call	convert
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L9
	movl	$0, %eax
	addq	$24, %rsp
	ret
.L9:
	call	__stack_chk_fail
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
