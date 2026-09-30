/* question
    Compile and run the sample code that uses show_bytes (file show-bytes.c) on different machines to which you have access. Determine the byte orderings used by these machines.
*/

#include <stdio.h>
typedef unsigned char* byte_pointer;

void show_bytes(byte_pointer start, int length) {
    for (int i = 0; i < length; ++i) {
        printf(" %2x", *(start + i));
    } printf("\n");
}

int main() {
    int number = 0x87654321;
    byte_pointer addrof_number = (byte_pointer) &number;
    show_bytes(addrof_number, 8);

    return 0;
}

/* answer
    I've tested on multiple different hardwares, all of them use little-endian (when run this program, prints "21, 43, 65, 87")
    
    seems like practically all consumer computers use little endian
*/