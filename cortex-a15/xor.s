	.cpu arm7tdmi
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"xor.c"
	.text
	.align	2
	.global	xor_array_ver_1
	.type	xor_array_ver_1, %function
xor_array_ver_1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #76
	str	r0, [fp, #-72]
	str	r1, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	vdup.32	d16, r3
	fstd	d16, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L3
.L6:
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	vld1.32	{d16}, [r3]
	fstd	d16, [fp, #-28]
	ldr	r3, [fp, #-72]
	add	r3, r3, #8
	str	r3, [fp, #-72]
	fldd	d16, [fp, #-12]
	fstd	d16, [fp, #-44]
	fldd	d16, [fp, #-28]
	fstd	d16, [fp, #-52]
	fldd	d17, [fp, #-44]
	fldd	d16, [fp, #-52]
	veor	d16, d17, d16
	fstd	d16, [fp, #-12]
	ldr	r3, [fp, #-76]
	sub	r3, r3, #2
	str	r3, [fp, #-76]
.L3:
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	bne	.L6
	fldd	d16, [fp, #-12]
	fstd	d16, [fp, #-60]
	fldd	d16, [fp, #-60]
	vmov.32	r3, d16[0]
	mov	r2, r3
	fldd	d16, [fp, #-12]
	fstd	d16, [fp, #-68]
	fldd	d16, [fp, #-68]
	vmov.32	r3, d16[1]
	eor	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	xor_array_ver_1, .-xor_array_ver_1
	.align	2
	.global	xor_array_ver_2
	.type	xor_array_ver_2, %function
xor_array_ver_2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #156
	str	r0, [fp, #-152]
	str	r1, [fp, #-156]
	mov	r3, #0
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	vdup.32	q8, r3
	vstr	d16, [fp, #-20]
	vstr	d17, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L12
.L15:
	ldr	r3, [fp, #-152]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	vld1.32	{d16-d17}, [r3]
	vstr	d16, [fp, #-44]
	vstr	d17, [fp, #-36]
	ldr	r3, [fp, #-152]
	add	r3, r3, #16
	str	r3, [fp, #-152]
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-68]
	vstr	d17, [fp, #-60]
	vldr	d16, [fp, #-44]
	vldr	d17, [fp, #-36]
	vstr	d16, [fp, #-84]
	vstr	d17, [fp, #-76]
	vldr	d18, [fp, #-68]
	vldr	d19, [fp, #-60]
	vldr	d16, [fp, #-84]
	vldr	d17, [fp, #-76]
	veor	q8, q9, q8
	vstr	d16, [fp, #-20]
	vstr	d17, [fp, #-12]
	ldr	r3, [fp, #-156]
	sub	r3, r3, #4
	str	r3, [fp, #-156]
.L12:
	ldr	r3, [fp, #-156]
	cmp	r3, #0
	bne	.L15
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-100]
	vstr	d17, [fp, #-92]
	vldr	d16, [fp, #-100]
	vldr	d17, [fp, #-92]
	vmov.32	r3, d16[0]
	ldr	r2, [fp, #-24]
	eor	r3, r2, r3
	str	r3, [fp, #-24]
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-116]
	vstr	d17, [fp, #-108]
	vldr	d16, [fp, #-116]
	vldr	d17, [fp, #-108]
	vmov.32	r3, d16[1]
	ldr	r2, [fp, #-24]
	eor	r3, r2, r3
	str	r3, [fp, #-24]
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-132]
	vstr	d17, [fp, #-124]
	vldr	d16, [fp, #-132]
	vldr	d17, [fp, #-124]
	vmov.32	r3, d17[0]
	ldr	r2, [fp, #-24]
	eor	r3, r2, r3
	str	r3, [fp, #-24]
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-148]
	vstr	d17, [fp, #-140]
	vldr	d16, [fp, #-148]
	vldr	d17, [fp, #-140]
	vmov.32	r3, d17[1]
	ldr	r2, [fp, #-24]
	eor	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	xor_array_ver_2, .-xor_array_ver_2
	.align	2
	.global	xor_array_ver_3
	.type	xor_array_ver_3, %function
xor_array_ver_3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 208
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #212
	str	r0, [fp, #-208]
	str	r1, [fp, #-212]
	mov	r3, #0
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	vdup.32	q8, r3
	vstr	d16, [fp, #-20]
	vstr	d17, [fp, #-12]
	ldr	r3, [fp, #-212]
	sub	r3, r3, #4
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-208]
	add	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	vld1.32	{d16-d17}, [r3]
	vstr	d16, [fp, #-36]
	vstr	d17, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-212]
	sub	r3, r3, #8
	str	r3, [fp, #-212]
	b	.L24
.L27:
	vldr	d16, [fp, #-36]
	vldr	d17, [fp, #-28]
	vstr	d16, [fp, #-60]
	vstr	d17, [fp, #-52]
	ldr	r3, [fp, #-212]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-208]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	vld1.32	{d16-d17}, [r3]
	vstr	d16, [fp, #-36]
	vstr	d17, [fp, #-28]
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-92]
	vstr	d17, [fp, #-84]
	vldr	d16, [fp, #-60]
	vldr	d17, [fp, #-52]
	vstr	d16, [fp, #-108]
	vstr	d17, [fp, #-100]
	vldr	d18, [fp, #-92]
	vldr	d19, [fp, #-84]
	vldr	d16, [fp, #-108]
	vldr	d17, [fp, #-100]
	veor	q8, q9, q8
	vstr	d16, [fp, #-20]
	vstr	d17, [fp, #-12]
	ldr	r3, [fp, #-212]
	sub	r3, r3, #4
	str	r3, [fp, #-212]
.L24:
	ldr	r3, [fp, #-212]
	cmp	r3, #0
	bge	.L27
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-124]
	vstr	d17, [fp, #-116]
	vldr	d16, [fp, #-36]
	vldr	d17, [fp, #-28]
	vstr	d16, [fp, #-140]
	vstr	d17, [fp, #-132]
	vldr	d18, [fp, #-124]
	vldr	d19, [fp, #-116]
	vldr	d16, [fp, #-140]
	vldr	d17, [fp, #-132]
	veor	q8, q9, q8
	vstr	d16, [fp, #-20]
	vstr	d17, [fp, #-12]
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-156]
	vstr	d17, [fp, #-148]
	vldr	d16, [fp, #-156]
	vldr	d17, [fp, #-148]
	vmov.32	r3, d16[0]
	ldr	r2, [fp, #-40]
	eor	r3, r2, r3
	str	r3, [fp, #-40]
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-172]
	vstr	d17, [fp, #-164]
	vldr	d16, [fp, #-172]
	vldr	d17, [fp, #-164]
	vmov.32	r3, d16[1]
	ldr	r2, [fp, #-40]
	eor	r3, r2, r3
	str	r3, [fp, #-40]
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-188]
	vstr	d17, [fp, #-180]
	vldr	d16, [fp, #-188]
	vldr	d17, [fp, #-180]
	vmov.32	r3, d17[0]
	ldr	r2, [fp, #-40]
	eor	r3, r2, r3
	str	r3, [fp, #-40]
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-204]
	vstr	d17, [fp, #-196]
	vldr	d16, [fp, #-204]
	vldr	d17, [fp, #-196]
	vmov.32	r3, d17[1]
	ldr	r2, [fp, #-40]
	eor	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	xor_array_ver_3, .-xor_array_ver_3
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 512
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #512
	sub	r2, fp, #516
	mov	r3, #512
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	mov	r3, #1
	str	r3, [fp, #-516]
	mov	r3, #2
	str	r3, [fp, #-512]
	mov	r3, #3
	str	r3, [fp, #-508]
	mov	r3, #4
	str	r3, [fp, #-504]
	mov	r3, #5
	str	r3, [fp, #-500]
	mov	r3, #6
	str	r3, [fp, #-496]
	mov	r3, #67
	str	r3, [fp, #-492]
	mov	r3, #7
	str	r3, [fp, #-488]
	mov	r3, #8
	str	r3, [fp, #-484]
	mov	r3, #9
	str	r3, [fp, #-480]
	sub	r3, fp, #516
	mov	r0, r3
	mov	r1, #128
	bl	xor_array_ver_1
	sub	r3, fp, #516
	mov	r0, r3
	mov	r1, #128
	bl	xor_array_ver_2
	sub	r3, fp, #516
	mov	r0, r3
	mov	r1, #128
	bl	xor_array_ver_3
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (GNU) 4.7.2"
