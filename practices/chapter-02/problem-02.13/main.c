/*
the digital equipment vax computer was a very popular machine from the late 1970s until the late 1980s. rather than instructions for boolean operations `and` and `or`, it had instructions `bis` (bit set) and `bic` (bit clear). both instructions take a data word x and a mask word m. they generate a result z consisting of the bits of x modified acording to the bits of m. with bis, th e modification involves setting z to 1 at each bit position where m is 1. with bic, the modification involves setting z to 0 at each bit position where m is 1.

to see how these operations relate to the c bit-level operations, assume we have functions bis and bic implementing the bit set and bit clear operations, and that we want to use these to implement functions computing bitwise operations | and ^ without using any other c operations. fill in the missing code below. hint: write c expressions for the operations bis and bic.
*/

#include <stdio.h>

int bis(int x, int m) {
    return x | m;
}

int bic(int x, int m) {
    return x & ~m;
}

int bool_or(int x, int y) {
    int result = bis(x, y);
    return result;
}

/* bis (or)
  m 0 1
z   
0   0 1
1   1 1
*/

/* bic
  m 0 1
z   
0   0 0
1   1 0
*/

/* and
  b 0 1
a   
0   0 0
1   0 1
*/

/* xor
  b 0 1
a   
0   0 1
1   1 0
*/

/*
bis= if m 1: z 1
bic= if m 1: z 0

a xor b = ? or ?
        = (a but whenever b is 1, a is 0) or (b but whenever a 1, b is 0)
        = bic(a, b) | bic(b, a)
        = bis(bic(a, b), bic(b, a))
*/

int bool_xor(int x, int y) {
    int result = bis(bic(x, y), bic(y, x));
    return result;
}

int main() {
    int a = 0b10100010101001010100101010100101;
    int b = 0b01010010001010110011010101011000;

    printf("%.32b\n", a);
    printf("%.32b\n", b);
    printf("%.32b\n", bool_or(a, b));
    printf("%.32b\n\n", a | b);

    printf("%.32b\n", a);
    printf("%.32b\n", b);
    printf("%.32b\n\n", bic(a, b));

    printf("%.32b\n", a);
    printf("%.32b\n", b);
    printf("%.32b\n", bool_xor(a, b));
    printf("%.32b\n\n", a ^ b);

    return 0;
}