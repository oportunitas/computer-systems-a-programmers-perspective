	.file	"main.c"
	.text
	.globl	tadd_ok
	.type	tadd_ok, @function
tadd_ok:
	movl	$1, %eax
	ret
	.size	tadd_ok, .-tadd_ok
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%i\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$2, %esi
	movl	$1, %edi
	call	tadd_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$1, %esi
	movl	$2147483647, %edi
	call	tadd_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$0, %esi
	movl	$2147483647, %edi
	call	tadd_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-1, %esi
	movl	$2147483647, %edi
	call	tadd_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$1, %esi
	movl	$-2147483648, %edi
	call	tadd_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$0, %esi
	movl	$-2147483648, %edi
	call	tadd_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-1, %esi
	movl	$-2147483648, %edi
	call	tadd_ok
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
