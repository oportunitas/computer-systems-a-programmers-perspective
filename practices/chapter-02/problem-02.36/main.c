/*
    for the case where data type int has 32 bits, devise a version of tmult_ok() that uses the 64-bit precision of data type int64_t, without using division
*/

#include <stdio.h>
#include <stdint.h>

int32_t tmult_ok(int32_t x, int32_t y) {
    int64_t product = (int64_t) x * (int64_t) y;
    return (product == (int32_t) product);
}

int main() {
    printf("%i\n", tmult_ok(INT32_MIN, -1));

    return 0;
}