	.cpu cortex-a15
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 1
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
	mov	r3, #0
	vdup.32	d16, r3
	cmp	r1, #0
	beq	.L2
.L4:
	vld1.32	{d17}, [r0]!
	veor	d16, d16, d17
	subs	r1, r1, #2
	bne	.L4
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
	mov	r3, #0
	vdup.32	q8, r3
	cmp	r1, #0
	beq	.L7
.L9:
	vld1.32	{d18-d19}, [r0]!
	veor	q8, q8, q9
	subs	r1, r1, #4
	bne	.L9
.L7:
	vmov.32	r1, d16[0]
	vmov.32	r0, d16[1]
	vmov.32	r2, d17[0]
	vmov.32	r3, d17[1]
	eor	r0, r0, r1
	eor	r0, r0, r2
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
	mov	r3, #0
	vdup.32	q8, r3
	sub	r3, r1, #4
	add	r3, r0, r3, asl #2
	vld1.32	{d20-d21}, [r3]
	subs	r1, r1, #8
	bmi	.L14
	add	r0, r0, r1, asl #2
.L13:
	vld1.32	{d18-d19}, [r0]
	veor	q8, q8, q10
	sub	r0, r0, #16
	vmov	q10, q9  @ v4si
	subs	r1, r1, #4
	bpl	.L13
	b	.L12
.L14:
	vmov	q9, q10  @ v4si
.L12:
	veor	q8, q8, q9
	vmov.32	r1, d16[0]
	vmov.32	r0, d16[1]
	vmov.32	r2, d17[0]
	vmov.32	r3, d17[1]
	eor	r0, r0, r1
	eor	r0, r0, r2
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
	mov	r3, #0
	vdup.32	q8, r3
	pld	[r0, #0]
	cmp	r1, #0
	beq	.L17
.L19:
	add	r3, r0, #16
	pld	[r3, #0]
	vld1.32	{d18-d19}, [r0]
	veor	q8, q8, q9
	mov	r0, r3
	subs	r1, r1, #4
	bne	.L19
.L17:
	vmov.32	r1, d16[0]
	vmov.32	r0, d16[1]
	vmov.32	r2, d17[0]
	vmov.32	r3, d17[1]
	eor	r0, r0, r1
	eor	r0, r0, r2
	eor	r0, r0, r3
	bx	lr
	.size	xor_array_ver_2_pld, .-xor_array_ver_2_pld
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
	mov	r3, #1
	str	r3, [sp, #0]
	mov	r3, #2
	str	r3, [sp, #4]
	mov	r3, #3
	str	r3, [sp, #8]
	mov	r3, #4
	str	r3, [sp, #12]
	mov	r3, #5
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
	mov	r0, sp
	mov	r1, #128
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
