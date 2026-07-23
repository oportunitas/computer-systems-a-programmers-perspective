/*
    Write a function with the following prototype:

        // Determine whether arguments can be added without overflow
        int uadd_ok(unsigned x, unsigned y);

    This function should return 1 if arguments x and y can be added without causing overflow.
*/

#include <stdio.h>
#include <limits.h>

int uadd_ok(unsigned x, unsigned y) {
    return (x + y) >= x;
}

int main() {
    printf("%i\n", uadd_ok(UINT_MAX - 1, 2));
}