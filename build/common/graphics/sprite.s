	.file	"sprite.cpp"
	.text
	.p2align 4
	.globl	_ZN8Graphics10DrawSpriteEP11SizedBuffer7Point2DRK6Sprite
	.def	_ZN8Graphics10DrawSpriteEP11SizedBuffer7Point2DRK6Sprite;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN8Graphics10DrawSpriteEP11SizedBuffer7Point2DRK6Sprite
_ZN8Graphics10DrawSpriteEP11SizedBuffer7Point2DRK6Sprite:
.LFB0:
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
	subq	$64, %rsp
	.seh_stackalloc	64
	movups	%xmm6, 48(%rsp)
	.seh_savexmm	%xmm6, 48
	.seh_endprologue
	movl	12(%r8), %ebp
	movq	%rcx, %rsi
	movq	%rdx, %xmm6
	movq	%r8, %r12
	testl	%ebp, %ebp
	je	.L1
	movl	8(%r8), %eax
	leaq	32(%rsp), %rdi
	.p2align 4,,10
	.p2align 3
.L3:
	testl	%eax, %eax
	je	.L1
	xorl	%ebx, %ebx
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L18:
	movd	%ebx, %xmm0
	movd	%ebp, %xmm1
	movl	%edx, 40(%rsp)
	movq	%rsi, %rcx
	punpckldq	%xmm1, %xmm0
	movq	%rdi, %rdx
	addl	$1, %ebx
	paddd	%xmm6, %xmm0
	movq	%xmm0, 32(%rsp)
	call	_ZN8Graphics8SetPixelEP11SizedBufferRK8Colour2D
	movl	8(%r12), %eax
	cmpl	%eax, %ebx
	jnb	.L6
.L16:
	movq	(%r12), %rcx
.L7:
	movl	%eax, %edx
	imull	%ebp, %edx
	addl	%ebx, %edx
	movl	%edx, %edx
	movl	(%rcx,%rdx,4), %edx
	cmpl	$16777215, %edx
	ja	.L18
	addl	$1, %ebx
	cmpl	%eax, %ebx
	jb	.L7
.L6:
	subl	$1, %ebp
	jne	.L3
.L1:
	movups	48(%rsp), %xmm6
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4
	.globl	_ZN8Graphics10ZoomSpriteEP11SizedBuffer7Point2DRK6Spritem
	.def	_ZN8Graphics10ZoomSpriteEP11SizedBuffer7Point2DRK6Spritem;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN8Graphics10ZoomSpriteEP11SizedBuffer7Point2DRK6Spritem
_ZN8Graphics10ZoomSpriteEP11SizedBuffer7Point2DRK6Spritem:
.LFB1:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
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
	subq	$88, %rsp
	.seh_stackalloc	88
	.seh_endprologue
	movl	12(%r8), %eax
	movd	%r9d, %xmm1
	movq	%rcx, %rbp
	movq	%rdx, %rdi
	movq	%r8, %r14
	pshufd	$0xe0, %xmm1, %xmm0
	movl	%r9d, %r12d
	movq	%xmm0, 32(%rsp)
	testl	%eax, %eax
	je	.L19
	movq	%rdi, %rax
	movl	8(%r8), %edx
	movl	$0, 52(%rsp)
	xorl	%r15d, %r15d
	shrq	$32, %rax
	movq	%rax, 56(%rsp)
	leaq	68(%rsp), %rax
	movq	%rax, 40(%rsp)
	testl	%edx, %edx
	je	.L19
	.p2align 4,,10
	.p2align 3
.L26:
	movl	56(%rsp), %esi
	movl	52(%rsp), %eax
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	movq	(%r14), %r8
	subl	%eax, %esi
	.p2align 4,,10
	.p2align 3
.L25:
	movl	%edx, %ecx
	imull	%r15d, %ecx
	addl	%ebx, %ecx
	movl	%ecx, %ecx
	movl	(%r8,%rcx,4), %ecx
	cmpl	$16777215, %ecx
	jbe	.L22
	leal	0(%r13,%rdi), %edx
	movq	32(%rsp), %r8
	movl	%ecx, 76(%rsp)
	movq	%rbp, %rcx
	movl	%edx, 68(%rsp)
	movq	40(%rsp), %rdx
	addl	$1, %ebx
	addl	%r12d, %r13d
	movl	%esi, 72(%rsp)
	call	_ZN8Graphics8DrawRectEP11SizedBufferRK8Colour2D7Point2D
	movl	8(%r14), %edx
	cmpl	%edx, %ebx
	jnb	.L24
	movq	(%r14), %r8
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L22:
	addl	$1, %ebx
	addl	%r12d, %r13d
	cmpl	%edx, %ebx
	jb	.L25
.L24:
	addl	$1, %r15d
	cmpl	12(%r14), %r15d
	jnb	.L19
	addl	%r12d, 52(%rsp)
	testl	%edx, %edx
	jne	.L26
.L19:
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.seh_endproc
	.ident	"GCC: (Rev1, Built by MSYS2 project) 12.2.0"
	.def	_ZN8Graphics8SetPixelEP11SizedBufferRK8Colour2D;	.scl	2;	.type	32;	.endef
	.def	_ZN8Graphics8DrawRectEP11SizedBufferRK8Colour2D7Point2D;	.scl	2;	.type	32;	.endef
