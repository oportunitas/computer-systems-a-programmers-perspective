/*
fill in the table below showing the effects of the different shift operations on single-byte quantities. the best way to think about shift operations is to work with binary representations. convert the initial valules to binary, perform the shifts, and then convert back to hexadecimal. each of the answers should be 8 binary digits or 2 hexadecimal digits.

x                   x << 3              logical x >> 2      arithmetic x >> 2
hex     binary      binary      hex     binary      hex     binary      hex
0xC3    11000011    00011000    0x18    00110000    0x30    11110000    0xF0
0x75    01110101    10101000    0xA8    00011101    0x1D    00011101    0x1D
0x87    10000111    00111000    0x38    00100001    0x21    11100001    0xE1
0x66    01100110    00110000    0x30    00011001    0x19    00011001    0x19

1010 a
1011 b
1100 c
1101 d
*/

#include <stdio.h>

int main() {
    unsigned char x = 0xC3;
    printf("%.8b, %.2x\n", x, x);

    unsigned char y = x << 3;
    printf("%.8b, %.2x\n", y, y);

    unsigned char z = x >> 2;
    printf("%.8b, %.2x\n", z, z);
    return 0;
}