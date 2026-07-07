	.file	"main.c"
	.text
	.globl	_and
	.type	_and, @function
_and:
	cmpl	%esi, %edi
	sete	%al
	movzbl	%al, %eax
	ret
	.size	_and, .-_and
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"0x%x\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$18, %esi
	movl	$18, %edi
	call	_and
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 16.1.1 20260625"
	.section	.note.GNU-stack,"",@progbits
