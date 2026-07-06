	.file	"main.c"
	.text
	.globl	sum
	.type	sum, @function
sum:
	leal	(%rdi,%rsi), %eax
	ret
	.size	sum, .-sum
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
