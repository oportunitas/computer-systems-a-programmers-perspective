	.file	"main.c"
	.text
	.globl	fun1
	.type	fun1, @function
fun1:
	movzbl	%dil, %eax
	ret
	.size	fun1, .-fun1
	.globl	fun2
	.type	fun2, @function
fun2:
	movsbl	%dil, %eax
	ret
	.size	fun2, .-fun2
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"0x%.8x 0x%.8x\n"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbx
	movl	$118, %edi
	call	fun2
	movl	%eax, %ebx
	movl	$118, %edi
	call	fun1
	movl	%eax, %edx
	movl	%ebx, %ecx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-2023406815, %edi
	call	fun2
	movl	%eax, %ebx
	movl	$-2023406815, %edi
	call	fun1
	movl	%eax, %edx
	movl	%ebx, %ecx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$201, %edi
	call	fun2
	movl	%eax, %ebx
	movl	$201, %edi
	call	fun1
	movl	%eax, %edx
	movl	%ebx, %ecx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-305419897, %edi
	call	fun2
	movl	%eax, %ebx
	movl	$-305419897, %edi
	call	fun1
	movl	%eax, %edx
	movl	%ebx, %ecx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$0, %eax
	popq	%rbx
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
