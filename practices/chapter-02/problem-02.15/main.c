/*
using only bit-level operations, write an expression in c that is equal to x == y
*/

#include <stdio.h>

int _and(const int x, const int y) {
    return !(x ^ y);
}

int main() {
    const int x = 0x12;
    const int y = 0x12;
    printf("0x%x\n", _and(x, y));
    return 0;
}