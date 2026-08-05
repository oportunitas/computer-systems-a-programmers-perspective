	.file	"main.c"
	.text
	.globl	div16
	.type	div16, @function
div16:
	movl	%edi, %edx
	sarl	$31, %edx
	leal	(%rdx,%rdx), %eax
	sall	$4, %edx
	subl	%edx, %eax
	addl	%edi, %eax
	sarl	$4, %eax
	ret
	.size	div16, .-div16
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%i\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$120, %edi
	call	div16
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
