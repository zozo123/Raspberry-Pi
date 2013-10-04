#include <arm_neon.h>
#include <stdlib.h>
#include <stdio.h>

uint32_t xor_array_ver_1(uint32_t *array, int size)
{
    uint32x2_t acc = vmov_n_u32(0);
    uint32_t acc1 = 0;
    for (; size != 0; size -= 2) {
        uint32x2_t vec;
        vec = vld1_u32(array);
        array += 2;
        acc = veor_u32(acc, vec);
    }
    acc1 = vget_lane_u32(acc,0) ^ vget_lane_u32(acc,1);
    return acc1;
}


uint32_t xor_array_ver_2(uint32_t *array, int size)
{
    uint32x4_t acc = vmovq_n_u32(0);
    uint32_t acc1 = 0;

    for (; size != 0; size -= 4) {
        uint32x4_t vec;
        vec = vld1q_u32(array);
        array += 4;
        acc = veorq_u32(acc, vec);
    }

    acc1 ^= vgetq_lane_u32(acc,0);
    acc1 ^= vgetq_lane_u32(acc,1);
    acc1 ^= vgetq_lane_u32(acc,2);
    acc1 ^= vgetq_lane_u32(acc,3);

    return acc1;
}
uint32_t xor_array_ver_3(uint32_t *array, int size)
{
  uint32x4_t acc = vmovq_n_u32(0);
  uint32x4_t next_vec = vld1q_u32(&array[size-4]);
  uint32_t acc1 = 0;

  for (size-=8; size>=0; size-=4) {
     uint32x4_t vec = next_vec;
     next_vec = vld1q_u32(&array[size]);
     acc = veorq_u32(acc, vec);
  }
  acc = veorq_u32(acc, next_vec);

  acc1 ^= vgetq_lane_u32(acc,0);
  acc1 ^= vgetq_lane_u32(acc,1);
  acc1 ^= vgetq_lane_u32(acc,2);
  acc1 ^= vgetq_lane_u32(acc,3);

  return acc1;
}

uint32_t xor_array_ver_2_pld(uint32_t *array, int size)
{
    uint32x4_t acc = vmovq_n_u32(0);
    uint32_t acc1 = 0;
    __builtin_prefetch(&array[0],0, 2);

    for (; size != 0; size -= 4) {
        uint32x4_t vec;
        __builtin_prefetch(&array[4],0, 2);
        vec = vld1q_u32(array);
        array += 4;
        acc = veorq_u32(acc, vec);
    }

    acc1 ^= vgetq_lane_u32(acc,0);
    acc1 ^= vgetq_lane_u32(acc,1);
    acc1 ^= vgetq_lane_u32(acc,2);
    acc1 ^= vgetq_lane_u32(acc,3);

    return acc1;
}

int main()
{
	uint32_t arr [128] = {1,2,3,4,5,6,67,7,8,9};
	xor_array_ver_1(arr, 128);
    xor_array_ver_2(arr, 128);
    xor_array_ver_3(arr, 128);
	return 0;
}
