	.file	"main.c"
	.text
	.globl	bis
	.type	bis, @function
bis:
	movl	%edi, %eax
	orl	%esi, %eax
	ret
	.size	bis, .-bis
	.globl	bic
	.type	bic, @function
bic:
	movl	%esi, %eax
	notl	%eax
	andl	%edi, %eax
	ret
	.size	bic, .-bic
	.globl	bool_or
	.type	bool_or, @function
bool_or:
	call	bis
	ret
	.size	bool_or, .-bool_or
	.globl	bool_xor
	.type	bool_xor, @function
bool_xor:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edi, %ebx
	movl	%esi, %ebp
	movl	%edi, %esi
	movl	%ebp, %edi
	call	bic
	movl	%eax, %r12d
	movl	%ebp, %esi
	movl	%ebx, %edi
	call	bic
	movl	%eax, %edi
	movl	%r12d, %esi
	call	bis
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	bool_xor, .-bool_xor
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%.32b\n"
.LC1:
	.string	"%.32b\n\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$-1566225755, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$1378563416, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$1378563416, %esi
	movl	$-1566225755, %edi
	call	bool_or
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-223379459, %edx
	movl	$.LC1, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-1566225755, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$1378563416, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$1378563416, %esi
	movl	$-1566225755, %edi
	call	bic
	movl	%eax, %edx
	movl	$.LC1, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-1566225755, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$1378563416, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$1378563416, %esi
	movl	$-1566225755, %edi
	call	bool_xor
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-259096579, %edx
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
