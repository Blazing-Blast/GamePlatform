	.file	"win64_platform.cpp"
	.text
	.p2align 4
	.globl	_ZN7Windows14windowCallbackEP6HWND__jyx
	.def	_ZN7Windows14windowCallbackEP6HWND__jyx;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Windows14windowCallbackEP6HWND__jyx
_ZN7Windows14windowCallbackEP6HWND__jyx:
.LFB9770:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, %rbx
	cmpl	$16, %edx
	je	.L2
	ja	.L3
	cmpl	$2, %edx
	je	.L2
	cmpl	$5, %edx
	jne	.L5
	leaq	64(%rsp), %rdx
	call	*__imp_GetClientRect(%rip)
	movq	_ZN7Windows11frameBufferE(%rip), %rcx
	movl	72(%rsp), %edx
	movl	76(%rsp), %eax
	subl	64(%rsp), %edx
	subl	68(%rsp), %eax
	movl	%edx, _ZN7Windows11bufferWidthE(%rip)
	movl	%eax, _ZN7Windows12bufferHeightE(%rip)
	testq	%rcx, %rcx
	je	.L10
	imull	%eax, %edx
	movl	$32768, %r8d
	sall	$3, %edx
	movslq	%edx, %rdx
	call	*__imp_VirtualFree(%rip)
	movl	_ZN7Windows11bufferWidthE(%rip), %edx
	movl	_ZN7Windows12bufferHeightE(%rip), %eax
.L10:
	imull	%eax, %edx
	movl	$4, %r9d
	movl	$12288, %r8d
	xorl	%ecx, %ecx
	sall	$3, %edx
	movslq	%edx, %rdx
	call	*__imp_VirtualAlloc(%rip)
	movd	_ZN7Windows11bufferWidthE(%rip), %xmm0
	movd	_ZN7Windows12bufferHeightE(%rip), %xmm1
	movl	$40, _ZN7Windows7bmpInfoE(%rip)
	movq	%rax, _ZN7Windows11frameBufferE(%rip)
	movl	.LC0(%rip), %eax
	movq	$0, 16+_ZN7Windows7bmpInfoE(%rip)
	punpckldq	%xmm1, %xmm0
	movl	%eax, 12+_ZN7Windows7bmpInfoE(%rip)
	movq	$0, 24+_ZN7Windows7bmpInfoE(%rip)
	movq	$0, 32+_ZN7Windows7bmpInfoE(%rip)
	movq	%xmm0, 4+_ZN7Windows7bmpInfoE(%rip)
.L8:
	xorl	%eax, %eax
	addq	$80, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	cmpl	$256, %edx
	jne	.L5
	cmpq	$122, %r8
	jne	.L8
	testl	$1073741824, %r9d
	jne	.L8
	movl	$-16, %edx
	call	*__imp_GetWindowLongPtrA(%rip)
	testl	$2147483648, %eax
	je	.L9
	movl	$282001408, %r8d
	movl	$-16, %edx
	movq	%rbx, %rcx
	call	*__imp_SetWindowLongPtrA(%rip)
	movl	$32, 48(%rsp)
	movl	$400, 40(%rsp)
	movl	$600, 32(%rsp)
.L20:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rbx, %rcx
	call	*__imp_SetWindowPos(%rip)
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rbx, %rcx
	addq	$80, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	rex.W jmp	*__imp_DefWindowProcA(%rip)
	.p2align 4,,10
	.p2align 3
.L2:
	xorl	%eax, %eax
	movb	$0, _ZN7Windows5goingE(%rip)
	addq	$80, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	movq	__imp_GetSystemMetrics(%rip), %rdi
	xorl	%ecx, %ecx
	call	*%rdi
	movl	$1, %ecx
	movl	%eax, %esi
	call	*%rdi
	movl	$2415919104, %r8d
	movl	$-16, %edx
	movq	%rbx, %rcx
	movl	%eax, %edi
	call	*__imp_SetWindowLongPtrA(%rip)
	movl	$32, 48(%rsp)
	movl	%edi, 40(%rsp)
	movl	%esi, 32(%rsp)
	jmp	.L20
	.seh_endproc
	.p2align 4
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB10416:
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	jmp	_ZNSt8ios_base4InitD1Ev
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "Class for game window\0"
.LC2:
	.ascii "Very cool window name\0"
	.text
	.p2align 4
	.globl	_ZN7Windows7WinMainEP11HINSTANCE__S1_Pci
	.def	_ZN7Windows7WinMainEP11HINSTANCE__S1_Pci;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Windows7WinMainEP11HINSTANCE__S1_Pci
_ZN7Windows7WinMainEP11HINSTANCE__S1_Pci:
.LFB9766:
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
	subq	$248, %rsp
	.seh_stackalloc	248
	.seh_endprologue
	leaq	.LC1(%rip), %rax
	pxor	%xmm0, %xmm0
	movq	%rax, 224(%rsp)
	movq	%rcx, %rbx
	leaq	_ZN7Windows14windowCallbackEP6HWND__jyx(%rip), %rax
	leaq	160(%rsp), %rcx
	movups	%xmm0, 164(%rsp)
	movups	%xmm0, 196(%rsp)
	movups	%xmm0, 180(%rsp)
	movups	%xmm0, 208(%rsp)
	movl	$3, 160(%rsp)
	movq	%rax, 168(%rsp)
	call	*__imp_RegisterClassA(%rip)
	xorl	%ecx, %ecx
	movq	224(%rsp), %rdx
	movl	$282001408, %r9d
	leaq	.LC2(%rip), %r8
	movq	%rbx, 80(%rsp)
	movq	$0, 88(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, 64(%rsp)
	movl	$720, 56(%rsp)
	movl	$1280, 48(%rsp)
	movl	$-2147483648, 40(%rsp)
	movl	$-2147483648, 32(%rsp)
	call	*__imp_CreateWindowExA(%rip)
	movq	%rax, %rsi
	movq	%rax, %rcx
	call	*__imp_GetDC(%rip)
	cmpb	$0, _ZN7Windows5goingE(%rip)
	movq	%rax, %r13
	je	.L25
	movq	__imp_PeekMessageA(%rip), %rdi
	movq	__imp_StretchDIBits(%rip), %r14
	leaq	112(%rsp), %rbx
	leaq	_ZN7Windows7bmpInfoE(%rip), %r15
	movq	__imp_TranslateMessage(%rip), %r12
	movq	__imp_DispatchMessageA(%rip), %rbp
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%rbx, %rcx
	call	*%r12
	movq	%rbx, %rcx
	call	*%rbp
.L27:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	movl	$1, 32(%rsp)
	call	*%rdi
	testl	%eax, %eax
	jne	.L26
	movl	_ZN7Windows11bufferWidthE(%rip), %r8d
	movl	_ZN7Windows12bufferHeightE(%rip), %edx
	movq	_ZN7Windows11frameBufferE(%rip), %rcx
	call	_ZN6Common13simulateFrameEPmmm
	movl	_ZN7Windows12bufferHeightE(%rip), %eax
	xorl	%r8d, %r8d
	movq	%r15, 80(%rsp)
	movq	_ZN7Windows11frameBufferE(%rip), %rdx
	movl	_ZN7Windows11bufferWidthE(%rip), %r9d
	movl	$13369376, 96(%rsp)
	movq	%r13, %rcx
	movl	$0, 88(%rsp)
	movq	%rdx, 72(%rsp)
	xorl	%edx, %edx
	movl	%eax, 64(%rsp)
	movl	%r9d, 56(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 40(%rsp)
	movl	%eax, 32(%rsp)
	call	*%r14
	cmpb	$0, _ZN7Windows5goingE(%rip)
	jne	.L27
.L25:
	xorl	%eax, %eax
	addq	$248, %rsp
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
	.p2align 4
	.globl	_ZN7Windows8runFrameEP6HWND__P5HDC__
	.def	_ZN7Windows8runFrameEP6HWND__P5HDC__;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Windows8runFrameEP6HWND__P5HDC__
_ZN7Windows8runFrameEP6HWND__P5HDC__:
.LFB9767:
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
	subq	$168, %rsp
	.seh_stackalloc	168
	.seh_endprologue
	movq	__imp_PeekMessageA(%rip), %rdi
	movq	__imp_TranslateMessage(%rip), %r12
	movq	__imp_DispatchMessageA(%rip), %rbp
	movq	%rcx, %rsi
	movq	%rdx, %r13
	leaq	112(%rsp), %rbx
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%rbx, %rcx
	call	*%r12
	movq	%rbx, %rcx
	call	*%rbp
.L30:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	movl	$1, 32(%rsp)
	call	*%rdi
	testl	%eax, %eax
	jne	.L31
	movl	_ZN7Windows11bufferWidthE(%rip), %r8d
	movl	_ZN7Windows12bufferHeightE(%rip), %edx
	leaq	_ZN7Windows7bmpInfoE(%rip), %rsi
	movq	_ZN7Windows11frameBufferE(%rip), %rcx
	call	_ZN6Common13simulateFrameEPmmm
	movl	_ZN7Windows12bufferHeightE(%rip), %eax
	xorl	%r8d, %r8d
	movl	_ZN7Windows11bufferWidthE(%rip), %r9d
	movq	_ZN7Windows11frameBufferE(%rip), %rdx
	movl	$13369376, 96(%rsp)
	movq	%r13, %rcx
	movl	$0, 88(%rsp)
	movq	%rdx, 72(%rsp)
	xorl	%edx, %edx
	movq	%rsi, 80(%rsp)
	movl	%eax, 64(%rsp)
	movl	%r9d, 56(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 40(%rsp)
	movl	%eax, 32(%rsp)
	call	*__imp_StretchDIBits(%rip)
	nop
	addq	$168, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.p2align 4
	.globl	_ZN7Windows12processInputEP6HWND__
	.def	_ZN7Windows12processInputEP6HWND__;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Windows12processInputEP6HWND__
_ZN7Windows12processInputEP6HWND__:
.LFB9768:
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
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	__imp_PeekMessageA(%rip), %rdi
	movq	__imp_TranslateMessage(%rip), %r12
	movq	__imp_DispatchMessageA(%rip), %rbp
	movq	%rcx, %rsi
	leaq	48(%rsp), %rbx
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L34:
	movq	%rbx, %rcx
	call	*%r12
	movq	%rbx, %rcx
	call	*%rbp
.L33:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	movl	$1, 32(%rsp)
	call	*%rdi
	testl	%eax, %eax
	jne	.L34
	addq	$96, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4
	.globl	_ZN7Windows11renderFrameEP5HDC__
	.def	_ZN7Windows11renderFrameEP5HDC__;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Windows11renderFrameEP5HDC__
_ZN7Windows11renderFrameEP5HDC__:
.LFB9769:
	subq	$120, %rsp
	.seh_stackalloc	120
	.seh_endprologue
	leaq	_ZN7Windows7bmpInfoE(%rip), %rdx
	movl	_ZN7Windows12bufferHeightE(%rip), %eax
	xorl	%r8d, %r8d
	movl	_ZN7Windows11bufferWidthE(%rip), %r9d
	movq	%rdx, 80(%rsp)
	movq	_ZN7Windows11frameBufferE(%rip), %rdx
	movl	$13369376, 96(%rsp)
	movq	%rdx, 72(%rsp)
	xorl	%edx, %edx
	movl	$0, 88(%rsp)
	movl	%eax, 64(%rsp)
	movl	%r9d, 56(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 40(%rsp)
	movl	%eax, 32(%rsp)
	call	*__imp_StretchDIBits(%rip)
	nop
	addq	$120, %rsp
	ret
	.seh_endproc
	.p2align 4
	.globl	WinMain
	.def	WinMain;	.scl	2;	.type	32;	.endef
	.seh_proc	WinMain
WinMain:
.LFB9771:
	.seh_endprologue
	jmp	_ZN7Windows7WinMainEP11HINSTANCE__S1_Pci
	.seh_endproc
	.section	.text.startup,"x"
	.p2align 4
	.def	_GLOBAL__sub_I__ZN7Windows5goingE;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I__ZN7Windows5goingE
_GLOBAL__sub_I__ZN7Windows5goingE:
.LFB10417:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitC1Ev
	leaq	__tcf_0(%rip), %rcx
	addq	$40, %rsp
	jmp	atexit
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I__ZN7Windows5goingE
	.globl	_ZN7Windows7bmpInfoE
	.bss
	.align 32
_ZN7Windows7bmpInfoE:
	.space 44
	.globl	_ZN7Windows12bufferHeightE
	.align 4
_ZN7Windows12bufferHeightE:
	.space 4
	.globl	_ZN7Windows11bufferWidthE
	.align 4
_ZN7Windows11bufferWidthE:
	.space 4
	.globl	_ZN7Windows11frameBufferE
	.align 8
_ZN7Windows11frameBufferE:
	.space 8
	.globl	_ZN7Windows5goingE
	.data
_ZN7Windows5goingE:
	.byte	1
.lcomm _ZStL8__ioinit,1,1
	.section .rdata,"dr"
	.align 4
.LC0:
	.word	1
	.word	32
	.ident	"GCC: (Rev1, Built by MSYS2 project) 12.2.0"
	.def	_ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZN6Common13simulateFrameEPmmm;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef
