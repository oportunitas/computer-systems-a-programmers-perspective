	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"A. S: %lf\n"
.LC3:
	.string	"B. k           : %lf\n"
.LC5:
	.string	"   speed needed: %lfkm/hr\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movsd	.LC0(%rip), %xmm0
	movl	$.LC1, %edi
	movl	$1, %eax
	call	printf
	movsd	.LC2(%rip), %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	movsd	.LC4(%rip), %xmm0
	movl	$.LC5, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072955392
	.align 8
.LC2:
	.long	1
	.long	1074266112
	.align 8
.LC4:
	.long	1
	.long	1081262080
	.ident	"GCC: (GNU) 16.1.1 20260625"
	.section	.note.GNU-stack,"",@progbits
