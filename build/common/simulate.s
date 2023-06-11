	.file	"simulate.cpp"
	.text
	.p2align 4
	.globl	_ZN6Common8onResizeEPmmm
	.def	_ZN6Common8onResizeEPmmm;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6Common8onResizeEPmmm
_ZN6Common8onResizeEPmmm:
.LFB6740:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	leaq	sBuffer(%rip), %rbp
	movl	%edx, %ebx
	movl	%r8d, %esi
	movq	%rcx, %rdi
	xorl	%ecx, %ecx
	call	*__imp__time64(%rip)
	movl	%eax, %ecx
	call	srand
	movd	%ebx, %xmm1
	movd	%esi, %xmm0
	movl	%esi, %r8d
	punpckldq	%xmm1, %xmm0
	movl	%ebx, 12+sBuffer(%rip)
	salq	$32, %rbx
	movq	%rbp, %rcx
	psrld	$1, %xmm0
	orq	%rbx, %r8
	leaq	_ZL2bg(%rip), %rdx
	movq	%rdi, sBuffer(%rip)
	movq	%xmm0, 32(%rsp)
	movl	%esi, 8+sBuffer(%rip)
	movl	$-4521729, 40(%rsp)
	call	_ZN8Graphics8DrawRectEP11SizedBufferRK8Colour2D7Point2D
	leaq	32(%rsp), %rdx
	movq	%rbp, %rcx
	call	_ZN8Graphics8SetPixelEP11SizedBufferRK8Colour2D
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4
	.globl	_ZN6Common8newPixelEPmmm
	.def	_ZN6Common8newPixelEPmmm;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6Common8newPixelEPmmm
_ZN6Common8newPixelEPmmm:
.LFB6741:
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
	subq	$136, %rsp
	.seh_stackalloc	136
	movups	%xmm6, 112(%rsp)
	.seh_savexmm	%xmm6, 112
	.seh_endprologue
	xorl	%ebp, %ebp
	leaq	sBuffer(%rip), %r12
	movl	$16711680, %r15d
	leaq	80(%rsp), %rax
	movl	%edx, %esi
	movl	%r8d, %ebx
	movq	%rax, 56(%rsp)
	movq	%rax, %rcx
	movq	__imp_GetSystemTime(%rip), %rax
	imull	%esi, %ebx
	movq	%rax, 32(%rsp)
	call	*%rax
	leaq	96(%rsp), %rax
	movb	$-1, 55(%rsp)
	leal	(%rbx,%rbx), %r14d
	movq	%rax, 40(%rsp)
.L17:
	movq	40(%rsp), %rcx
	movq	32(%rsp), %rax
	call	*%rax
	movzwl	94(%rsp), %eax
	movzwl	110(%rsp), %edx
	subl	%eax, %edx
	movslq	%edx, %rax
	leaq	1000(%rax), %rcx
	cmovs	%rcx, %rax
	cmpq	$15, %rax
	jg	.L32
	leaq	64(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L5:
	call	rand
	xorl	%edx, %edx
	divl	8+sBuffer(%rip)
	movl	%edx, %ebx
	call	rand
	xorl	%edx, %edx
	movd	%ebx, %xmm6
	movq	%r12, %rcx
	divl	12+sBuffer(%rip)
	movq	%rdx, %rax
	movd	%edx, %xmm1
	movl	%ebx, %edx
	salq	$32, %rax
	punpckldq	%xmm1, %xmm6
	orq	%rax, %rdx
	call	_ZN8Graphics8GetPixelEP11SizedBuffer7Point2D
	movl	%eax, %esi
	testl	%eax, %eax
	je	.L7
	movl	%eax, %ebx
	xorl	%edi, %edi
	call	rand
	shrl	$8, %ebx
	movl	%eax, %ecx
	movl	%esi, %eax
	shrl	$16, %eax
	movzbl	%al, %edx
	movl	%ecx, %eax
	andl	$16, %eax
	leal	-8(%rdx,%rax), %eax
	testw	%ax, %ax
	js	.L8
	movl	%eax, %edi
	sall	$16, %edi
	cmpw	$256, %ax
	cmovge	%r15d, %edi
.L8:
	call	rand
	movzbl	%bl, %ebx
	andl	$16, %eax
	leal	-8(%rbx,%rax), %ebx
	testw	%bx, %bx
	js	.L22
	cmpw	$255, %bx
	jg	.L10
	movzwl	%bx, %ebx
	sall	$8, %ebx
.L9:
	call	rand
	movzbl	%sil, %edx
	andl	$16, %eax
	leal	-8(%rdx,%rax), %eax
	testw	%ax, %ax
	js	.L11
.L19:
	cmpw	$255, %ax
	jg	.L33
	movzbl	%al, %eax
	orl	%eax, %edi
.L11:
	orl	%edi, %ebx
	movl	%ebx, %esi
	orl	$-16777216, %esi
	testl	%ebx, %ebx
	je	.L7
	.p2align 4,,10
	.p2align 3
.L14:
	call	rand
	cltd
	shrl	$28, %edx
	addl	%edx, %eax
	andl	$15, %eax
	subl	%edx, %eax
	je	.L14
	movl	%eax, %ecx
	movl	%eax, %edx
	xorl	%r8d, %r8d
	movl	%esi, 72(%rsp)
	shrb	%cl
	andl	$1, %edx
	andl	$1, %ecx
	subl	%ecx, %edx
	movq	%r12, %rcx
	movd	%edx, %xmm0
	movl	%eax, %edx
	shrb	$3, %al
	shrb	$2, %dl
	andl	$1, %eax
	andl	$1, %edx
	subl	%eax, %edx
	movd	%edx, %xmm2
	movq	%r13, %rdx
	punpckldq	%xmm2, %xmm0
	paddd	%xmm6, %xmm0
	movq	%xmm0, 64(%rsp)
	call	_ZN8Graphics9InitPixelEP11SizedBufferRK8Colour2D6Colour
	testb	%al, %al
	jne	.L34
	leaq	1(%rbp), %rax
	cmpq	%rbp, %r14
	jb	.L3
.L15:
	movq	%rax, %rbp
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rbp, %rax
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L22:
	xorl	%ebx, %ebx
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L33:
	movl	%ebx, %esi
	orl	%edi, %esi
	orl	$-16776961, %esi
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L10:
	call	rand
	movzbl	%sil, %esi
	movl	$65280, %ebx
	andl	$16, %eax
	leal	-8(%rax,%rsi), %eax
	movl	%edi, %esi
	orl	$-16711936, %esi
	testw	%ax, %ax
	jns	.L19
	jmp	.L14
.L32:
	movq	56(%rsp), %rcx
	movq	32(%rsp), %rax
	call	*%rax
	movl	$1, %ecx
	call	*__imp_Sleep(%rip)
	nop
.L3:
	movups	112(%rsp), %xmm6
	addq	$136, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L34:
	subb	$1, 55(%rsp)
	jne	.L17
	jmp	.L3
	.seh_endproc
	.p2align 4
	.globl	_ZN6Common13simulateFrameEPmmm
	.def	_ZN6Common13simulateFrameEPmmm;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6Common13simulateFrameEPmmm
_ZN6Common13simulateFrameEPmmm:
.LFB6739:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rdi
	movl	%edx, %ebx
	movl	%r8d, %esi
	testl	%r8d, %r8d
	je	.L35
	testl	%edx, %edx
	je	.L35
	cmpl	%edx, 12+sBuffer(%rip)
	jne	.L37
	cmpl	%r8d, 8+sBuffer(%rip)
	je	.L38
.L37:
	xorl	%ecx, %ecx
	leaq	sBuffer(%rip), %rbp
	call	*__imp__time64(%rip)
	movl	%eax, %ecx
	call	srand
	movd	%ebx, %xmm1
	movd	%esi, %xmm0
	movq	%rbx, %rax
	punpckldq	%xmm1, %xmm0
	salq	$32, %rax
	movl	%esi, %r8d
	movq	%rbp, %rcx
	psrld	$1, %xmm0
	orq	%rax, %r8
	leaq	_ZL2bg(%rip), %rdx
	movq	%rdi, sBuffer(%rip)
	movl	%esi, 8+sBuffer(%rip)
	movl	%ebx, 12+sBuffer(%rip)
	movl	$-4521729, 40(%rsp)
	movq	%xmm0, 32(%rsp)
	call	_ZN8Graphics8DrawRectEP11SizedBufferRK8Colour2D7Point2D
	leaq	32(%rsp), %rdx
	movq	%rbp, %rcx
	call	_ZN8Graphics8SetPixelEP11SizedBufferRK8Colour2D
.L38:
	movl	%esi, %r8d
	movl	%ebx, %edx
	movq	%rdi, %rcx
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	_ZN6Common8newPixelEPmmm
	.p2align 4,,10
	.p2align 3
.L35:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4
	.globl	_ZN6Common10colourShitEmmha
	.def	_ZN6Common10colourShitEmmha;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6Common10colourShitEmmha
_ZN6Common10colourShitEmmha:
.LFB6742:
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
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rdx, %rax
	movl	%ecx, %edx
	leaq	sBuffer(%rip), %rcx
	movl	%r8d, %edi
	salq	$32, %rax
	movl	%r9d, %esi
	orq	%rax, %rdx
	call	_ZN8Graphics8GetPixelEP11SizedBuffer7Point2D
	movl	%eax, %ebx
	movl	$-16777216, %eax
	testl	%ebx, %ebx
	je	.L39
	call	rand
	movzbl	%dil, %ebp
	movl	%ebx, %edx
	shrb	%dil
	movsbw	%sil, %si
	movzbl	%dil, %edi
	shrl	$16, %edx
	movl	%ebx, %r12d
	subl	%edi, %esi
	movzbl	%dl, %edx
	andl	%ebp, %eax
	shrl	$8, %r12d
	addl	%esi, %edx
	xorl	%r13d, %r13d
	addw	%ax, %dx
	js	.L41
	movl	%edx, %r13d
	movl	$16711680, %eax
	sall	$16, %r13d
	cmpw	$256, %dx
	cmovge	%eax, %r13d
.L41:
	call	rand
	movzbl	%r12b, %r12d
	xorl	%edi, %edi
	andl	%ebp, %eax
	addl	%esi, %r12d
	addw	%r12w, %ax
	js	.L42
	movzwl	%ax, %edi
	sall	$8, %edi
	cmpw	$256, %ax
	movl	$65280, %eax
	cmovge	%eax, %edi
.L42:
	call	rand
	movzbl	%bl, %ebx
	andl	%eax, %ebp
	addl	%esi, %ebx
	addw	%bx, %bp
	js	.L43
	movl	%r13d, %edx
	movzwl	%bp, %eax
	orl	%r13d, %eax
	orb	$-1, %dl
	cmpw	$256, %bp
	cmovl	%eax, %edx
	movl	%edx, %r13d
.L43:
	movl	%edi, %eax
	orl	%r13d, %eax
	orl	$-16777216, %eax
.L39:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.p2align 4
	.globl	_ZN6Common7posShitEmm
	.def	_ZN6Common7posShitEmm;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6Common7posShitEmm
_ZN6Common7posShitEmm:
.LFB6743:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	%ecx, %ebx
	movl	%edx, %esi
	.p2align 4,,10
	.p2align 3
.L52:
	call	rand
	cltd
	shrl	$28, %edx
	addl	%edx, %eax
	andl	$15, %eax
	subl	%edx, %eax
	je	.L52
	movl	%eax, %edx
	movl	%eax, %ecx
	shrb	%dl
	andl	$1, %ecx
	andl	$1, %edx
	subl	%edx, %ecx
	movl	%eax, %edx
	shrb	$3, %al
	shrb	$2, %dl
	andl	$1, %eax
	andl	$1, %edx
	subl	%eax, %edx
	leal	(%rcx,%rbx), %eax
	addl	%esi, %edx
	movl	%edx, %edx
	salq	$32, %rdx
	orq	%rdx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4
	.globl	_Z5clamps
	.def	_Z5clamps;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z5clamps
_Z5clamps:
.LFB6744:
	.seh_endprologue
	xorl	%eax, %eax
	testw	%cx, %cx
	js	.L54
	cmpw	$255, %cx
	movl	$-1, %eax
	cmovle	%ecx, %eax
.L54:
	ret
	.seh_endproc
	.globl	sBuffer
	.bss
	.align 16
sBuffer:
	.space 16
	.section .rdata,"dr"
	.align 8
_ZL2bg:
	.long	0
	.long	0
	.long	-16777216
	.ident	"GCC: (Rev1, Built by MSYS2 project) 12.2.0"
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	_ZN8Graphics8DrawRectEP11SizedBufferRK8Colour2D7Point2D;	.scl	2;	.type	32;	.endef
	.def	_ZN8Graphics8SetPixelEP11SizedBufferRK8Colour2D;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	_ZN8Graphics8GetPixelEP11SizedBuffer7Point2D;	.scl	2;	.type	32;	.endef
	.def	_ZN8Graphics9InitPixelEP11SizedBufferRK8Colour2D6Colour;	.scl	2;	.type	32;	.endef
