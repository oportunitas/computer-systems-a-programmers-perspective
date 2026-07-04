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
	.string	"%d\n%d\n%x\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$14, %esi
	movl	$2, %edi
	call	int_pow
	movl	%eax, %ecx
	movl	%eax, %r8d
	movl	$14, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
