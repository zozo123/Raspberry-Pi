	.cpu cortex-a15
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
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
	cmp	r1, #0
	vmov.i32	d16, #0  @ v2si
	beq	.L2
.L6:
	subs	r1, r1, #2
	vld1.32	{d17}, [r0]!
	veor	d16, d16, d17
	bne	.L6
.L2:
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
	cmp	r1, #0
	vmov.i32	q8, #0  @ v4si
	beq	.L11
.L15:
	subs	r1, r1, #4
	vld1.32	{d18-d19}, [r0]!
	veor	q8, q8, q9
	bne	.L15
.L11:
	vmov.32	r3, d16[0]
	vmov.32	r0, d16[1]
	eor	r0, r0, r3
	vmov.32	r3, d17[0]
	eor	r0, r0, r3
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
	subs	r3, r1, #8
	sub	r1, r1, #4
	vmov.i32	q8, #0  @ v4si
	add	r1, r0, r1, asl #2
	vld1.32	{d20-d21}, [r1]
	bmi	.L21
	add	r0, r0, r3, asl #2
.L20:
	subs	r3, r3, #4
	vld1.32	{d18-d19}, [r0]
	veor	q8, q8, q10
	sub	r0, r0, #16
	vmov	q10, q9  @ v4si
	bpl	.L20
.L19:
	veor	q8, q8, q9
	vmov.32	r3, d16[0]
	vmov.32	r0, d16[1]
	eor	r0, r0, r3
	vmov.32	r2, d17[0]
	vmov.32	r3, d17[1]
	eor	r0, r0, r2
	eor	r0, r0, r3
	bx	lr
.L21:
	vld1.32	{d18-d19}, [r1]
	b	.L19
	.size	xor_array_ver_3, .-xor_array_ver_3
	.align	2
	.global	xor_array_ver_2_pld
	.type	xor_array_ver_2_pld, %function
xor_array_ver_2_pld:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	vmov.i32	q8, #0  @ v4si
	pld	[r0, #0]
	beq	.L24
.L28:
	subs	r1, r1, #4
	add	r3, r0, #16
	vld1.32	{d18-d19}, [r0]
	pld	[r3, #0]
	veor	q8, q8, q9
	mov	r0, r3
	bne	.L28
.L24:
	vmov.32	r3, d16[0]
	vmov.32	r0, d16[1]
	eor	r0, r0, r3
	vmov.32	r3, d17[0]
	eor	r0, r0, r3
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
	mov	r1, #0
	mov	r2, #512
	mov	r0, sp
	bl	memset
	mov	r2, #2
	mov	r3, #3
	mov	r1, #1
	stmia	sp, {r1, r2, r3}
	mov	r2, #4
	mov	r3, sp
	str	r2, [sp, #12]
	mov	r2, #5
	str	r2, [sp, #16]
	mov	r2, #6
	str	r2, [sp, #20]
	mov	r2, #67
	str	r2, [sp, #24]
	mov	r2, #7
	str	r2, [sp, #28]
	mov	r2, #8
	str	r2, [sp, #32]
	mov	r2, #9
	str	r2, [sp, #36]
.L32:
	add	r3, r3, #8
	add	r2, sp, #512
	cmp	r3, r2
	bne	.L32
	mov	r1, #128
	mov	r0, sp
	bl	xor_array_ver_2
	mov	r0, sp
	mov	r1, #128
	bl	xor_array_ver_3
	mov	r0, #0
	add	sp, sp, #516
	ldmfd	sp!, {pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 4.7.2"
