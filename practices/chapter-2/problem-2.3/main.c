/*
decimal     binary          hexadecimal
167         1010 0111       0xA7
 62         0011 1110       0x3E
188         1011 1100       0xBC
 55         0011 0111       0x37
136         1000 1000       0x88
243         1111 0011       0xF3
 82         0101 0010       0x52
172         1010 1100       0xAC
231         1110 0111       0x57
*/

#include <stdio.h>

int main() {
    int x = 231;
    printf("%d %b %x\n", x, x, x);
}