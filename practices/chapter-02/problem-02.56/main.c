/* question
    Try running the code for show_bytes for different sample values.
*/

#include <stdio.h>
typedef unsigned char* byte_pointer;

void show_bytes(byte_pointer start, int length) {
    for (int i = 0; i < length; ++i) {
        printf(" %2x", start[i]);
    } printf("\n");
}

int main() {
    long int num = 0xaab12b129f;
    byte_pointer addrof_num = (byte_pointer) &num;
    show_bytes(addrof_num, 5);
    return 0;
}

/* answer
    nice observation.
*/