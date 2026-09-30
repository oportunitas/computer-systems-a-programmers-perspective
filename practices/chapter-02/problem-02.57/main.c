/* question
    Write procedures show_short, show_long, and show_double that print the byte representations of C objects of types short, long, and double, respectively. Try these out on several machines.
*/

/* answer
    we can lock when the for loop ends by locking the 'length' parameter according to the function
*/

#include <stdio.h>
typedef unsigned char* byte_pointer;

void show_bytes(byte_pointer start, int length) {
    for (int i = 0; i < length; ++i) {
        printf(" %02x", start[i]);
    } printf("\n");
}

void show_short(short num) {
    byte_pointer start = (byte_pointer) &num;
    for (int i = 0; i < sizeof(short); ++i) {
        printf(" %02x", start[i]);
    } printf("\n");
}

void show_long(long num) {
    byte_pointer start = (byte_pointer) &num;
    for (int i = 0; i < sizeof(long); ++i) {
        printf(" %02x", start[i]);
    } printf("\n");
}

void show_double(double num) {
    byte_pointer start = (byte_pointer) &num;
    for (int i = 0; i < sizeof(double); ++i) {
        printf(" %02x", start[i]);
    } printf("\n");
}

int main() {
    short snum = 0x21;
    show_short(snum);

    long llnum = 0xaab12b129f;
    show_long(llnum);

    double dblnum = 12.832572;
    show_double(dblnum);

    return 0;
}

/* answer
    nice observation.
*/