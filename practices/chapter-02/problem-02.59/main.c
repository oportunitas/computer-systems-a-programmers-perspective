/* question
    Write a C expression that will yield a word consisting of the least significant byte of x and the remaining bytes of y. For operands x = 0x89ABCDEF and y = 0x76543210, this would give 0x765432EF.
*/

/* answer
    by using the is_little_endian() function, we can replace the least significant byte of y with the least significant byte of x.
*/

#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include <inttypes.h>

bool is_little_endian() {
    int16_t tester = 0x0001;
    int8_t first_byte = ((int8_t*)(&tester))[0];
    return first_byte;
}

/*
    lets use int64_t
*/
int64_t replace_last_byte(int64_t y, int64_t x) {
    int8_t* x_byte = (int8_t*)(is_little_endian() ? (&x) : (&x) + (sizeof(int64_t) - 1));
    int8_t* y_byte = (int8_t*)(is_little_endian() ? (&y) : (&y) + (sizeof(int64_t) - 1));
    *y_byte = *x_byte;
    return y;
}

int main() {
    int64_t x = 0x89abcdef;
    int64_t y = 0x76543210;

    printf("%" PRIX64 "\n", replace_last_byte(y, x));
    return 0;
}