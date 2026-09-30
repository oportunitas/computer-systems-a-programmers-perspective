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
	.string	" %02x"
	.text
	.globl	show_long
	.type	show_long, @function
show_long:
	pushq	%rbx
	subq	$16, %rsp
	movq	%rdi, 8(%rsp)
	movl	$0, %ebx
	jmp	.L3
.L4:
	movslq	%ebx, %rax
	movzbl	8(%rsp,%rax), %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	addl	$1, %ebx
.L3:
	cmpl	$7, %ebx
	jbe	.L4
	movl	$10, %edi
	call	putchar
	addq	$16, %rsp
	popq	%rbx
	ret
	.size	show_long, .-show_long
	.section	.rodata.str1.1
.LC1:
	.string	"byte to change: %02x\n"
.LC2:
	.string	"change to: %02x\n"
	.text
	.globl	replace_byte
	.type	replace_byte, @function
replace_byte:
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, 8(%rsp)
	movl	%esi, %ebx
	movl	%edx, %ebp
	movl	$0, %eax
	call	is_little_endian
	testb	%al, %al
	je	.L7
	movzbl	%bl, %ebx
	leaq	8(%rsp,%rbx), %rbx
.L8:
	movzbl	(%rbx), %edx
	movl	$.LC1, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movzbl	%bpl, %edx
	movl	$.LC2, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movb	%bpl, (%rbx)
	movq	8(%rsp), %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L7:
	movzbl	%bl, %ebx
	movl	$7, %eax
	subq	%rbx, %rax
	leaq	8(%rsp,%rax), %rbx
	jmp	.L8
	.size	replace_byte, .-replace_byte
	.globl	replace_last_byte
	.type	replace_last_byte, @function
replace_last_byte:
	subq	$16, %rsp
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	movl	$0, %eax
	call	is_little_endian
	testb	%al, %al
	je	.L13
	movq	%rsp, %rdx
.L11:
	testb	%al, %al
	je	.L14
	leaq	8(%rsp), %rax
.L12:
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movq	8(%rsp), %rax
	addq	$16, %rsp
	ret
.L13:
	leaq	56(%rsp), %rdx
	jmp	.L11
.L14:
	leaq	64(%rsp), %rax
	jmp	.L12
	.size	replace_last_byte, .-replace_last_byte
	.section	.rodata.str1.1
.LC3:
	.string	"%lX\n"
	.text
	.globl	main
	.type	main, @function
main:
	subq	$8, %rsp
	movl	$305419896, %edi
	call	show_long
	movl	$171, %edx
	movl	$2, %esi
	movl	$305419896, %edi
	call	replace_byte
	movq	%rax, %rdx
	movl	$.LC3, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$0, %eax
	addq	$8, %rsp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
