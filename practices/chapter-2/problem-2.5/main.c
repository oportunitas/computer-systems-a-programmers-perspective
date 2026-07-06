/*
with this code:
    int val = 0x87654321;
    byte_pointer valp =(byte_pointer) &val;

    show_bytes(valp, 1); //A
    show_bytes(valp, 2); //B
    show_bytes(valp, 3); //C

indicate values that is printed by each call on a little endian and big endian machine.

workthrough:
    little endian:
        full representation    : 21 43 65 87
            A (print 1 byte)  : 21
            B (print 2 bytes) : 21 43
            C (print 3 bytes) : 21 43 65
    big endian:
        full representation    : 87 65 43 21
            A (print 1 byte)  : 87
            B (print 2 bytes) : 87 65
            C (print 3 bytes) : 87 65 43

check (little-endian only to verify) using below program:
*/

#include <stdio.h>

typedef unsigned char* byte_pointer;

void show_bytes(byte_pointer start, size_t len) {
    for (int i = 0; i < len; i++) {
        printf("%.2x ", start[i]);
    }
    printf("\n");
}

int main() {
    int val = 0x87654321;
    byte_pointer valp =(byte_pointer) &val;
    show_bytes(valp, 1); //A
    show_bytes(valp, 2); //B
    show_bytes(valp, 3); //C
    return 0;
}