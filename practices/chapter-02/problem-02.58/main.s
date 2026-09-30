	.file	"main.c"
	.text
	.globl	is_little_endian
	.type	is_little_endian, @function
is_little_endian:
	movl	$1, %eax
	ret
	.size	is_little_endian, .-is_little_endian
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%i\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$0, %eax
	call	is_little_endian
	movzbl	%al, %edx
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
