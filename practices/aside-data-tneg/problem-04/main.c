/*
    You are given the task of writing a function with the following prototype:

        // Generate mask indicating rightmost 1 in x.
        // For example 0xFF00 -> 0x0100, and 0x6600 --> 0x0200.
        // If x == 0, then return 0.
        int rightmost_one(unsigned x);

    If argument x equals 0, this function returns 0. Otherwise, it returns a mask consisting of a single one in the same position as the least significant bit with value 1 in x.

    Having just learned how to negate a number based on its bit-level representation, you realize this function can be written as a very simple expression having just two operations. Show the code.
*/

#include <stdio.h>

int rightmost_one(unsigned x) {
    return x & -x;
}

int main() {
    printf("0x%x\n", rightmost_one(0xFF00u));
    printf("0x%x\n", rightmost_one(0x6600u));
}