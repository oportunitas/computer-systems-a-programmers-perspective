/*
what would be printed as a result of the following call to show_bytes()?
    const char* s = "abcdef";
    show_bytes((byte_pointer) s, strlen(s));
note that letters 'a' through 'z' have ascii codes 0x61 through 0x7a

workthrough:
    whole string representation
        a    -> 0x61
        b    -> 0x62
        c    -> 0x63
        d    -> 0x64
        e    -> 0x65
        f    -> 0x66
        null -> 0x00 (not printed since strlen() only takes length of char array without null)

    printed output: 61 62 63 64 65 66 

    check using below program:
*/

#include <stdio.h>
#include <string.h>

typedef unsigned char* byte_pointer;

void show_bytes(byte_pointer start, size_t len) {
    for (int i = 0; i < len; i++) {
        printf("%.2x ", start[i]);
    }
    printf("\n");
}


int main() {
    const char* s = "abcdef";
    show_bytes((byte_pointer) s, strlen(s));
    return 0;
}