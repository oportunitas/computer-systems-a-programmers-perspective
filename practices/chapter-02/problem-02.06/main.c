/*
Using show_int() and show_float() we determine that the integer 3510593 has hexadecimal representation 0x0359141, while the floating-point number 3510593.0 has hexadecimal representation 0x4A56504
    A. Write the binary representations of these two hexadecimal values.
    B. Shift these two strings relative to one another to maximize the number of matching bits. how many bits match?
    C. Which parts of the strings do not match?

Walkthrough:
    A:
        0x00359141 (int) to binary:
            0: 0000
            0: 0000
            3: 0011
            5: 0101
            9: 1001
            1: 0001
            4: 0100
            1: 0001
        = 00000000001101011001000101000001
          00000000001101011001000101000001 (checked, real value)

        0x4A56504 (float) to binary:
            4: 0100
            A: 1010
            5: 0101
            6: 0110
            4: 0100
            5: 0101
            0: 0000
            4: 0100
        = 01001010010101100100010100000100
          01001010010101100100010100000100 (checked, real value)
    B:
        1001010010101100100010100000100
            00000000001101011001000101000001

        1001010010101100100010100000100
           00000000001101011001000101000001

        1001010010101100100010100000100
          00000000001101011001000101000001

        1001010010101100100010100000100
         00000000001101011001000101000001

        01001010010101100100010100000100
        00000000001101011001000101000001

         01001010010101100100010100000100
        00000000001101011001000101000001

          010010100|101011001000101000001|00
        00000000001|101011001000101000001|

           01001010010101100100010100000100
        00000000001101011001000101000001
        
        Maximum bits matching: 21 (00101000001):
          010010100|101011001000101000001|00 (float)
        00000000001|101011001000101000001|   (int)
    
    C: 
        - last 2 bits of the float representation
        - first 9 bits of float
        - first 11 bits of int
        - every bit in int except the first one is there in float
*/

#include <stdio.h>

typedef unsigned char* byte_pointer;

void show_bytes(byte_pointer start, size_t len) {
    for (int i = 0; i < len; i++) {
        printf("%.8b", start[len - i - 1]);
    }
    printf("\n");
}

void show_int(int x) {
    show_bytes((byte_pointer) &x, sizeof(int));
}

void show_float(float x) {
    show_bytes((byte_pointer) &x, sizeof(float));
}

int main() {
    int ival = 3510593;
    int fval = (float) ival;
    show_int(ival);
    show_float(fval);
    return 0;
}