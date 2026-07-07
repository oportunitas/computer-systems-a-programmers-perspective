/*
suppose you have x and y values of 0x66 and 0x39 respectively.
expression      value
x & y           0x20
x | y           0x7D
~x | ~y         0xDF         0x99 | 0xC6 1001 1100 0110 -> 1101 1111
x & !y          0x00
x && y          0x01
x || y          0x01
!x || !y        0x00
x && ~y         0x01
check using below program
*/

#include <stdio.h>
int main() {
    const int x = 0x66;
    const int y = 0x39;

    printf("0x%.2x\n", x & y);
    printf("0x%.2x\n", x | y);
    printf("0x%.2x\n", ~x | ~y);
    printf("0x%.2x\n", x & !y);
    printf("0x%.2x\n", x && y);
    printf("0x%.2x\n", x || y);
    printf("0x%.2x\n", !x || !y);
    printf("0x%.2x\n", x && ~y);
    return 0;
}