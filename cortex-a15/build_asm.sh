arm-none-eabi-gcc -mfloat-abi=softfp -mfpu=neon -mcpu=cortex-a15 -S xor.c -Os -o xor_O.s
arm-none-eabi-gcc -mfloat-abi=softfp -mfpu=neon -mcpu=cortex-a15 -S xor.c -O1 -o xor_O1.s
arm-none-eabi-gcc -mfloat-abi=softfp -mfpu=neon -mcpu=cortex-a15 -S xor.c -O2 -o xor_O2.s
arm-none-eabi-gcc -mfloat-abi=softfp -mfpu=neon -mcpu=cortex-a15 -S xor.c -O3 -o xor_O3.s
arm-none-eabi-gcc -mfloat-abi=softfp -mfpu=neon -mcpu=cortex-a15 -S xor.c -Os -O3 -o xor_Os3.s
arm-none-eabi-gcc -mfloat-abi=softfp -mfpu=neon -mcpu=cortex-a15 -S xor.c -Os -o xor_Os.s