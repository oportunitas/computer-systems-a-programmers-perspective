	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$0, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 16.1.1 20260625"
	.section	.note.GNU-stack,"",@progbits
