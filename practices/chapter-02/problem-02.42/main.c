/*
    Write a function div16 that returns the value x/16 for integer argument x. Your function should not use division, modulus, multiplication, any conditionals (if or ?:), any comparison operators (e.g., <, >, or ==), or any loops. You may assume that data type int is 32 bits long and uses a two's-complement representation, and that right shifts are performed arithmetically.
*/

#include <stdio.h>
#include <stdint.h>

int32_t div16(int32_t x) {
    /*  
        function form = (x + a) >> 4

        if the most significant bit is 1 (negative number):
            a is ((1 << 4) - 1)
        if the most significant bit is 0 (positive number):
            a is 0
        
        if we set the most significant bit value as m, function is:
            (x + (m * ((1 << 4) - 1))) >> 4

        if we right shift x by 32:
            if positive number will yield an array of all 0s, or 0
            if negative number will yield an array of all 1s, or -1
        lets say that this number is n

        n is -m

        as such, the complete function will be:
        div16() =   div16()
                    x / 16
                    (x + a) >> 4
                    (x + (m * ((1 << 4) - 1))) >> 4
                    (x + (-n * ((1 << 4) - 1))) >> 4
                    (x + (-((n << 4) - (n << 1)))) >> 4
                    (x + ((n << 1) - (n << 4))) >> 4
                    (x + (((x >> 32) << 1) - ((x >> 32) << 4))) >> 4
    */

    // printf("%i\n", x >> 31);

    return (x + (((x >> 31) << 1) - ((x >> 31) << 4))) >> 4;

    /*
        further derivation in light of solution:

            (x + (m * 15) >> 4;
            (x + (m * 0xF) >> 4;

            we can use the & operator to mask 15 out of x >> 31

            x + ((x >> 31) & 0xF) >> 4;
    */
}


int main() {
    printf("%i\n", div16(120));
    return 0;
}