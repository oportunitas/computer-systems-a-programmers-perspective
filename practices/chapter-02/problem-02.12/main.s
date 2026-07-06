	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"0x%.8x\n"
.LC1:
	.string	"0x%.8x\n\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$33, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$33, %edx
	movl	$.LC1, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$2023406625, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$2023406625, %edx
	movl	$.LC1, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-2023406593, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-2023406593, %edx
	movl	$.LC1, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
