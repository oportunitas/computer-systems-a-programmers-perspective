/*
step        *x              *y
initially   a               b
step 1      a               a ^ b
step 2      a ^ (a ^ b)     a ^ b
            b               a ^ b
step 3      b               b ^ (a ^ b)
            b               a
*/

#include <stdio.h>

void inplace_swap(int* x, int* y) {
    printf("%.8x %8x\n", *x, *y);
    *y = *x ^ *y;
    printf("%.8x %8x\n", *x, *y);
    *x = *x ^ *y;
    printf("%.8x %8x\n", *x, *y);
    *y = *x ^ *y;
    printf("%.8x %8x\n", *x, *y);
}

int main() {
    int x = 0x12345678;
    int y = 0xfedcba98;

    inplace_swap(&x, &y);
}