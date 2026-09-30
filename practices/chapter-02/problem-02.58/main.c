/* question
    Write a procedure is_little_endian that will return 1 when compiled and run on a little-endian machine, and will return 0 when compiled and run on a big-endian machine. This program should run on any machine, regardless of its word size.
*/

/* answer
    assuming stdint.h is available on any device, we can create a 16-bit integer as 1. if the machine is little endian, it'll store it as 01 00, but in big endian as 00 01.

    we can cast int8* to the address of the 16-bit integer, and then dereference it to get the first byte (01 if little endian, 00 if big endian), then we can just return it.

    the reason we need stdint.h specifically is to avoid using the term "short int" or "char" which might be ambiguous.
*/

#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>

bool is_little_endian() {
    int16_t tester = 0x0001;
    int8_t first_byte = ((int8_t*)(&tester))[0];
    return first_byte;
}

int main() {
    printf("%i\n", is_little_endian());
}