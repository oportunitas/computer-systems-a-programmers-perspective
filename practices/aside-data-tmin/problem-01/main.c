/*
problem:
    Consider the following code:

        int dtmin32 = -2147483648;
        int dpos32a = (dtmin32 > 0);
        int htmin32 = 0x80000000;
        int hpos32a = (htmin32 > 0);

    We compile this code as both 32-bit and 64-bit programs on a machine using two’s complement representations of integers, and we try it for both language standards ISO-C90 and ISO-C99. In all cases, we consistently get value 0 for both dpos32a and hpos32a, and further tests verify that dtmin32 and htmin32 indeed equal TMin32. Explain why this code does not have the compiler and language sensitivities we saw for the earlier code example.

answer/workthrough:
    this is what would happen if the number is used directly (like in #INCLUDE or (-2147483648 > 0)):
        32bit c90:
            -2147483648: int, too big 
            -> -2147483648: long, too big (long in 32 bit is 4 bytes)
            -> -2147483648: unsigned, okay 
            -> 2147483647 (INT_MAX)

            as such:
                (dtmin32 > 0) is true
        32bit c99:
            -2147483648: int, too big
            -> -2147483648: long, too big (long in 32 bit systems occupies 4 bytes)
            -> -2147483648: long long, okay (long long must have 8 bytes, even in 32 bit systems)
            -> -2147483648: long long (INT_MIN)

            as such: 
                (dtmin32 > 0) is false

        64bit systems (both c90 and c99):
            -2147483648: int, too big,
            -> -2147483648: long, okay (long takes 8 bytes in 64-bit systems)
            -> -2147483648: long (INT_MIN)
    HOWEVER: turns out, when you declare an integer value, the number on the right-hand-side of the declaration is implicitly cast into 32 bit two's complement integer. so:
        int dtmin32 = -2147483648;
    actually works like the following (kinda) under the hood:
        int dtmin32 = (signed int) (whatever comes out of expressing -2147483648);
    which works fine since we're casting them back to the data type we're using. making both dtmin32 and htmin32 equal INT_MIN like intended regardless of whether its using 32bit or 64bit, either with c90 or c99.

    sequence of finding fittable integer types during signed integer declaration
    c90                             c99
    decimal         hexadecimal     decimal     hexadecimal

    int             int             int         int
    long            unsigned        long        unsigned
    unsigned        long            long long   long
    unsigned long   unsigned long               unsigned long
                                                unsigned long long
*/                              

#include <stdio.h>

int main() {
    int dtmin32 = -2147483648;
    int dpos32a = (dtmin32 > 0);
    int htmin32 = 0x80000000;
    int hpos32a = (htmin32 > 0);

    return 0;
}