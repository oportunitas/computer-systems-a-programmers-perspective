	.file	"main.c"
	.text
	.globl	is_little_endian
	.type	is_little_endian, @function
is_little_endian:
	movl	$1, %eax
	ret
	.size	is_little_endian, .-is_little_endian
	.globl	replace_last_byte
	.type	replace_last_byte, @function
replace_last_byte:
	subq	$16, %rsp
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	movl	$0, %eax
	call	is_little_endian
	testb	%al, %al
	je	.L5
	movq	%rsp, %rdx
.L3:
	testb	%al, %al
	je	.L6
	leaq	8(%rsp), %rax
.L4:
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movq	8(%rsp), %rax
	addq	$16, %rsp
	ret
.L5:
	leaq	56(%rsp), %rdx
	jmp	.L3
.L6:
	leaq	64(%rsp), %rax
	jmp	.L4
	.size	replace_last_byte, .-replace_last_byte
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lX\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$2309737967, %esi
	movl	$1985229328, %edi
	call	replace_last_byte
	movq	%rax, %rdx
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
