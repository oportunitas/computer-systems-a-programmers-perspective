/*
fill in the following table showing the results of evaluating boolean operations on bit vectors.

    operation       result
    a               01101001
    b               01010101
    ~a              10010110
    ~b              10101010
    a & b           01000001
    a | b           01111101
    a ^ b           00111100

check using below program
*/

#include <stdio.h>

int main() {
    const char a = 0b01101001;
    const char b = 0b01010101;

    printf("%.32b\n", a);
    printf("%.32b\n", b);
    printf("%.32b\n", ~a);
    printf("%.32b\n", ~b);
    printf("%.32b\n", a & b);
    printf("%.32b\n", a | b);    
    printf("%.32b\n", a ^ b);    
}