	.file	"basic.cpp"
	.text
	.p2align 4
	.globl	_ZN8Graphics8SetPixelEP11SizedBufferRK8Colour2D
	.def	_ZN8Graphics8SetPixelEP11SizedBufferRK8Colour2D;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN8Graphics8SetPixelEP11SizedBufferRK8Colour2D
_ZN8Graphics8SetPixelEP11SizedBufferRK8Colour2D:
.LFB0:
	.seh_endprologue
	movl	(%rdx), %r8d
	movl	8(%rcx), %eax
	cmpl	%eax, %r8d
	jnb	.L1
	movl	4(%rdx), %r9d
	cmpl	12(%rcx), %r9d
	jnb	.L1
	imull	%r9d, %eax
	movl	8(%rdx), %edx
	addl	%eax, %r8d
	movq	(%rcx), %rax
	movl	%r8d, %r8d
	movl	%edx, (%rax,%r8,4)
.L1:
	ret
	.seh_endproc
	.p2align 4
	.globl	_ZN8Graphics8GetPixelEP11SizedBuffer7Point2D
	.def	_ZN8Graphics8GetPixelEP11SizedBuffer7Point2D;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN8Graphics8GetPixelEP11SizedBuffer7Point2D
_ZN8Graphics8GetPixelEP11SizedBuffer7Point2D:
.LFB1:
	.seh_endprologue
	xorl	%eax, %eax
	movl	8(%rcx), %r8d
	movq	%rdx, %r9
	shrq	$32, %r9
	cmpl	%r8d, %edx
	jnb	.L5
	cmpl	12(%rcx), %r9d
	jb	.L8
.L5:
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	imull	%r9d, %r8d
	movq	(%rcx), %rax
	addl	%r8d, %edx
	movl	%edx, %edx
	movl	(%rax,%rdx,4), %eax
	andl	$16777215, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	_ZN8Graphics9InitPixelEP11SizedBufferRK8Colour2D6Colour
	.def	_ZN8Graphics9InitPixelEP11SizedBufferRK8Colour2D6Colour;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN8Graphics9InitPixelEP11SizedBufferRK8Colour2D6Colour
_ZN8Graphics9InitPixelEP11SizedBufferRK8Colour2D6Colour:
.LFB2:
	.seh_endprologue
	xorl	%r10d, %r10d
	movl	(%rdx), %r9d
	movl	8(%rcx), %eax
	cmpl	%eax, %r9d
	jnb	.L9
	movl	4(%rdx), %r11d
	cmpl	12(%rcx), %r11d
	jnb	.L9
	imull	%r11d, %eax
	addl	%eax, %r9d
	movq	(%rcx), %rax
	movl	%r9d, %r9d
	leaq	(%rax,%r9,4), %rcx
	movl	(%rcx), %eax
	andl	$16777215, %eax
	cmpl	%eax, %r8d
	jne	.L9
	movl	8(%rdx), %eax
	movl	$1, %r10d
	movl	%eax, (%rcx)
.L9:
	movl	%r10d, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	_ZN8Graphics8DrawRectEP11SizedBufferRK8Colour2D7Point2D
	.def	_ZN8Graphics8DrawRectEP11SizedBufferRK8Colour2D7Point2D;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN8Graphics8DrawRectEP11SizedBufferRK8Colour2D7Point2D
_ZN8Graphics8DrawRectEP11SizedBufferRK8Colour2D7Point2D:
.LFB3:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	.seh_endprologue
	movl	4(%rdx), %r9d
	movq	%r8, %rdi
	movq	%rdx, %rsi
	shrq	$32, %rdi
	addl	%r9d, %edi
	cmpl	%edi, %r9d
	jnb	.L14
	movl	(%rdx), %ebp
	leal	0(%rbp,%r8), %r10d
	cmpl	%r10d, %ebp
	jnb	.L14
	movl	8(%rcx), %r8d
	.p2align 4,,10
	.p2align 3
.L18:
	movl	%r8d, %ebx
	movl	%ebp, %eax
	imull	%r9d, %ebx
	.p2align 4,,10
	.p2align 3
.L17:
	cmpl	%r8d, %eax
	jnb	.L16
	cmpl	12(%rcx), %r9d
	jnb	.L16
	movq	(%rcx), %r11
	movl	8(%rsi), %r14d
	leal	(%rbx,%rax), %edx
	movl	%r14d, (%r11,%rdx,4)
.L16:
	addl	$1, %eax
	cmpl	%r10d, %eax
	jne	.L17
	addl	$1, %r9d
	cmpl	%edi, %r9d
	jne	.L18
.L14:
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r14
	ret
	.seh_endproc
	.p2align 4
	.globl	_ZN8Graphics10DrawCircleEP11SizedBufferRK8Colour2Dm
	.def	_ZN8Graphics10DrawCircleEP11SizedBufferRK8Colour2Dm;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN8Graphics10DrawCircleEP11SizedBufferRK8Colour2Dm
_ZN8Graphics10DrawCircleEP11SizedBufferRK8Colour2Dm:
.LFB4:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	.seh_endprologue
	movl	%r8d, %ebp
	movq	%rcx, %r11
	movq	%rdx, %rdi
	negl	%ebp
	cmpl	%r8d, %ebp
	jge	.L21
	movl	%r8d, %esi
	movl	4(%rdx), %r9d
	movl	%ebp, %r10d
	imull	%r8d, %esi
	subl	%r8d, %r9d
	.p2align 4,,10
	.p2align 3
.L24:
	testl	%r9d, %r9d
	js	.L28
	movl	%r10d, %ebx
	movl	(%rdi), %edx
	movl	%ebp, %eax
	imull	%r10d, %ebx
	subl	%r8d, %edx
	.p2align 4,,10
	.p2align 3
.L27:
	testl	%edx, %edx
	js	.L26
	movl	%eax, %ecx
	imull	%eax, %ecx
	addl	%ebx, %ecx
	cmpl	%esi, %ecx
	jg	.L26
	movl	8(%r11), %ecx
	cmpl	%ecx, %edx
	jnb	.L26
	cmpl	12(%r11), %r9d
	jnb	.L26
	imull	%r9d, %ecx
	movl	8(%rdi), %r14d
	leal	(%rcx,%rdx), %r12d
	movq	(%r11), %rcx
	movl	%r14d, (%rcx,%r12,4)
	.p2align 4,,10
	.p2align 3
.L26:
	addl	$1, %eax
	addl	$1, %edx
	cmpl	%r8d, %eax
	jne	.L27
.L28:
	addl	$1, %r10d
	addl	$1, %r9d
	cmpl	%r8d, %r10d
	jne	.L24
.L21:
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r14
	ret
	.seh_endproc
	.ident	"GCC: (Rev1, Built by MSYS2 project) 12.2.0"
