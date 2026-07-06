#include <stdio.h>

int main() {
    /* A
    0x39A7F8 to binary:
    3: 0011
    9: 1001
    A: 1010
    7: 0111
    F: 1111
    8: 1000

    0b001110011010011111111000
    check below
    */
    printf("%b\n", 0x39A7F8);

    /* B
    binary 1100100101111011 to hex:
    1100: C
    1001: 9
    0111: 7
    1011: B

    0xC97B
    check below
    */
    printf("%x\n", 0b1100100101111011);

    /* C
    0xD5E4C to binary:
    D: 1101
    5: 0101
    E: 1110
    4: 0100
    C: 1100

    0b11010101111001001100
    check below
    */
    printf("%b\n", 0xD5E4C);

    /* D
    binary 1001101110011110110101 to hex:
    0010: 2
    0110: 6
    1110: E
    0111: 7
    1011: B
    0101: 5

    0x2637B5
    check below
    */
   printf("%x\n", 0b1001101110011110110101);
}