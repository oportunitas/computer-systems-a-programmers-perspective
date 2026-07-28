	.file	"main.c"
	.text
	.globl	tsub_ok
	.type	tsub_ok, @function
tsub_ok:
	movl	%edi, %edx
	subl	%esi, %edx
	movl	%edi, %eax
	notl	%eax
	shrl	$31, %eax
	movl	%esi, %ecx
	shrl	$31, %ecx
	testb	%al, %cl
	je	.L4
	testl	%edx, %edx
	js	.L5
	movl	$0, %eax
	jmp	.L2
.L4:
	movl	$0, %eax
.L2:
	shrl	$31, %edi
	notl	%esi
	shrl	$31, %esi
	testb	%dil, %sil
	je	.L6
	testl	%edx, %edx
	js	.L8
	movl	$1, %edx
	jmp	.L3
.L5:
	movl	$1, %eax
	jmp	.L2
.L8:
	movl	$0, %edx
	jmp	.L3
.L6:
	movl	$0, %edx
.L3:
	orl	%edx, %eax
	sete	%al
	movzbl	%al, %eax
	ret
	.size	tsub_ok, .-tsub_ok
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
	call	tsub_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$1, %esi
	movl	$2147483647, %edi
	call	tsub_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$0, %esi
	movl	$2147483647, %edi
	call	tsub_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-1, %esi
	movl	$2147483647, %edi
	call	tsub_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$1, %esi
	movl	$-2147483648, %edi
	call	tsub_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$0, %esi
	movl	$-2147483648, %edi
	call	tsub_ok
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$-1, %esi
	movl	$-2147483648, %edi
	call	tsub_ok
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
