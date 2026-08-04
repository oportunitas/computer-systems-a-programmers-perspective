	.file	"main.c"
	.text
	.globl	tmult_ok
	.type	tmult_ok, @function
tmult_ok:
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	imulq	%rsi, %rdi
	movslq	%edi, %rax
	cmpq	%rdi, %rax
	sete	%al
	movzbl	%al, %eax
	ret
	.size	tmult_ok, .-tmult_ok
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%i\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$-1, %esi
	movl	$-2147483648, %edi
	call	tmult_ok
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
