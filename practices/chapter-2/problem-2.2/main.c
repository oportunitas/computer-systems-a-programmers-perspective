#include <stdio.h>
#include <math.h>

int int_pow(int base, int exponent) {
    int res = 1;
    for (int i = 0; i < exponent; i++) {
        res *= base;
    }
    return res;
}

/*
from/to:
    'n' = n
    'd' = 2^n (decimal)
    'x' = 2^n (hexadecimal)
*/
int convert(int x, char from, char to) {
    if (from == 'n') { x = int_pow(2, x); }


    int res;
    if (from == 'x' && ((to == 'n') || (to == 'd'))) {
        // convert from hex to decimal representation of hex
        res =
    }

    printf("%d\n", int_pow(2, x));
    // if (from == 'n') { x =  }

    // if (from == 'n') {
    //     if (to == 'd') {
    //         printf("")
    //     }
    // }
}

int main() {
    char from, to;
    int x;
    printf("from: "); scanf(" %c", &from);
    printf("to  : "); scanf(" %c", &to);
    printf("x   : "); scanf(" %i", &x);
    convert(x, from, to);
}