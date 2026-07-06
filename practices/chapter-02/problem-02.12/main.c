/*
write in terms of x:
    A. The least significant byte of x, with all other bits set to 0
        Answer: x & 0xFF
    B. All but the least significant byte of x complemented, with the least significant byte left unchanged
        Answer: x ^ ~0xFF
    C. The least significant byte set to all ones, and all other bytes of x left unchanged
        Answer: x | 0xFF
*/

#include <stdio.h>

int main() {
    int x = 0x87654321;

    int a = x & 0x000000FF;
    printf("0x%.8x\n", a);
    a = x & 0xFF;
    printf("0x%.8x\n\n", a);
    
    int b = x ^ 0xFFFFFF00;
    printf("0x%.8x\n", b);
    b = x ^ ~0xFF;
    printf("0x%.8x\n\n", b);

    int c = x | 0x000000FF;
    printf("0x%.8x\n", c);
    c = x | 0xFF;
    printf("0x%.8x\n\n", c);

    return 0;
}