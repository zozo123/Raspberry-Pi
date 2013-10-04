	.cpu cortex-a15
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"xor.c"
	.text
	.align	2
	.global	xor_array_ver_1
	.type	xor_array_ver_1, %function
xor_array_ver_1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vmov.i32	d16, #0  @ v2si
	b	.L2
.L3:
	sub	r1, r1, #2
	vld1.32	{d17}, [r0]!
	veor	d16, d16, d17
.L2:
	cmp	r1, #0
	bne	.L3
	vmov.32	r3, d16[0]
	vmov.32	r0, d16[1]
	eor	r0, r0, r3
	bx	lr
	.size	xor_array_ver_1, .-xor_array_ver_1
	.align	2
	.global	xor_array_ver_2
	.type	xor_array_ver_2, %function
xor_array_ver_2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vmov.i32	q8, #0  @ v4si
	b	.L5
.L6:
	vld1.32	{d18-d19}, [r0]
	sub	r1, r1, #4
	add	r0, r0, #16
	veor	q8, q8, q9
.L5:
	cmp	r1, #0
	bne	.L6
	vmov.32	r1, d16[0]
	vmov.32	r0, d16[1]
	eor	r0, r0, r1
	vmov.32	r2, d17[0]
	eor	r0, r0, r2
	vmov.32	r3, d17[1]
	eor	r0, r0, r3
	bx	lr
	.size	xor_array_ver_2, .-xor_array_ver_2
	.align	2
	.global	xor_array_ver_3
	.type	xor_array_ver_3, %function
xor_array_ver_3:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	r3, r1, #4
	vmov.i32	q8, #0  @ v4si
	add	r3, r0, r3, asl #2
	add	r0, r0, r1, asl #2
	vld1.32	{d18-d19}, [r3]
	sub	r3, r1, #8
	b	.L8
.L9:
	sub	r3, r3, #4
	sub	r2, r0, #16
	vld1.32	{d18-d19}, [r2]
.L8:
	cmp	r3, #0
	sub	r0, r0, #16
	veor	q8, q8, q9
	bge	.L9
	vmov.32	r1, d16[0]
	vmov.32	r0, d16[1]
	eor	r0, r0, r1
	vmov.32	r2, d17[0]
	eor	r0, r0, r2
	vmov.32	r3, d17[1]
	eor	r0, r0, r3
	bx	lr
	.size	xor_array_ver_3, .-xor_array_ver_3
	.align	2
	.global	xor_array_ver_2_pld
	.type	xor_array_ver_2_pld, %function
xor_array_ver_2_pld:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vmov.i32	q8, #0  @ v4si
	pld	[r0, #0]
	b	.L11
.L12:
	add	r3, r0, #16
	vld1.32	{d18-d19}, [r0]
	sub	r1, r1, #4
	pld	[r3, #0]
	mov	r0, r3
	veor	q8, q8, q9
.L11:
	cmp	r1, #0
	bne	.L12
	vmov.32	r1, d16[0]
	vmov.32	r0, d16[1]
	eor	r0, r0, r1
	vmov.32	r2, d17[0]
	eor	r0, r0, r2
	vmov.32	r3, d17[1]
	eor	r0, r0, r3
	bx	lr
	.size	xor_array_ver_2_pld, .-xor_array_ver_2_pld
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 512
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #516
	mov	r0, sp
	mov	r1, #0
	mov	r2, #512
	bl	memset
	mov	r2, #3
	mov	r0, #1
	mov	r1, #2
	mov	r3, #4
	stmia	sp, {r0, r1, r2, r3}
	mov	r3, #5
	mov	r0, sp
	mov	r1, #128
	str	r3, [sp, #16]
	mov	r3, #6
	str	r3, [sp, #20]
	mov	r3, #67
	str	r3, [sp, #24]
	mov	r3, #7
	str	r3, [sp, #28]
	mov	r3, #8
	str	r3, [sp, #32]
	mov	r3, #9
	str	r3, [sp, #36]
	bl	xor_array_ver_1
	mov	r0, sp
	mov	r1, #128
	bl	xor_array_ver_2
	mov	r0, sp
	mov	r1, #128
	bl	xor_array_ver_3
	mov	r0, #0
	add	sp, sp, #516
	ldmfd	sp!, {pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 4.7.2"
