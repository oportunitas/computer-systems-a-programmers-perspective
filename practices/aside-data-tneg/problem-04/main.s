	.file	"main.c"
	.text
	.globl	rightmost_one
	.type	rightmost_one, @function
rightmost_one:
	movl	%edi, %eax
	negl	%eax
	andl	%edi, %eax
	ret
	.size	rightmost_one, .-rightmost_one
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"0x%x\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$65280, %edi
	call	rightmost_one
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$26112, %edi
	call	rightmost_one
	movl	%eax, %edx
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
