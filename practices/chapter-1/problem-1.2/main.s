	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"the k should be: %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movsd	.LC0(%rip), %xmm0
	movl	$.LC1, %esi
	movl	$2, %edi
	movl	$1, %eax
	call	__printf_chk
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1073741824
	.long	1074091349
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
