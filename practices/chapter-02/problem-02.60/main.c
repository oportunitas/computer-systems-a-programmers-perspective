/* question
    Suppose we number the bytes in a w-bit word from 0 (least significant) to w/8 – 1 (most significant). Write code for the following C function, which will return an unsigned value in which byte i of argument x has been replaced by byte b:

    unsigned replace_byte (unsigned x, int i, unsigned char b);
    Here are some examples showing how the function should work:

        replace_byte(0x12345678, 2, 0xAB) --> 0x12AB5678
        replace_byte(0x12345678, 0, 0xAB) --> 0x123456AB
*/

/* answer
    we can modify the replace_last_byte() function from 02.59 to accomodate different byte positions.
*/

#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include <inttypes.h>
typedef unsigned char* byte_pointer;

bool is_little_endian() {
    int16_t tester = 0x0001;
    int8_t first_byte = ((int8_t*)(&tester))[0];
    return first_byte;
}

void show_long(long num) {
    byte_pointer start = (byte_pointer) &num;
    for (int i = 0; i < sizeof(long); ++i) {
        printf(" %02x", *(start + i));
    } printf("\n");
}

uint64_t replace_byte(uint64_t x, uint8_t i, uint8_t b) {
    uint8_t* byte_to_change = (
        is_little_endian() ? 
        (((uint8_t*)(&x)) + i) : 
        (((uint8_t*)(&x)) + (sizeof(uint64_t) - 1 - i))
    );
    printf("byte to change: %02x\n", *byte_to_change);
    printf("change to: %02x\n", b);
    *byte_to_change = b;
    return x;
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
    show_long(0x12345678);
    printf("%" PRIX64 "\n", replace_byte(0x12345678, 2, 0xAB));
    return 0;
}