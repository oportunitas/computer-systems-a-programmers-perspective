/*
n           2^n(d)          2^n(x)
9_          512_            0x200_
19_         524288          0x80000
14          16384_          0x4000
16          65536           0x10000_
17_         131072          0x20000
5           32_             0x20
7           128             0x80_

check using the below code:
*/

#include <stdio.h>
#include <math.h>

int int_pow(int base, int exponent) {
    int res = 1;
    for (int i = 0; i < exponent; i++) {
        res *= base;
    }
    return res;
}

int main() {
    int x = 14;
    int two_to_x = int_pow(2, x);
    printf("%d\n%d\n%x\n", x, two_to_x, two_to_x);
}