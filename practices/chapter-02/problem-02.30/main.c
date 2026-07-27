/*
    write a function with the following prototype:
        // determine whether arguments can be added without overflow
        int tadd_ok(int x, int y);
    this function should return 1 if arguments x and y can be added without causing overflow
*/

#include <stdio.h>
#include <limits.h>

int tadd_ok(int x, int y) {
    int sum = x + y;
    int is_positive_overflow = (x >= 0 && y >= 0) && sum < 0;
    int is_negative_overflow = (x < 0 && y < 0) && sum >= 0;
    return !is_positive_overflow && !is_negative_overflow;

    // brainstorm code
    // if (x >= 0 && y >= 0) {
    //     if (x + y >= 0) {
    //         return 1;
    //     } else {
    //         return 0;
    //     }
    // } else if (x < 0 && y < 0) {
    //     if (x + y < 0) {
    //         return 1;
    //     } else {
    //         return 0;
    //     }
    // below not needed (pos-neg case never gets to any overflow)
    // } else {
    //     // x positive, y negative
    //     if (x > y) {
    //         if (x + y > x) {
    //             return 0;
    //         } else {
    //             return 1;
    //         }
    //     } else {
    //         if (x + y > y) {
    //             return 0;
    //         } else {
    //             return 1;
    //         }
    //     }
    // }
}

int main() {
    printf("%i\n", tadd_ok(1, 2));

    printf("%i\n", tadd_ok(INT_MAX, 1));
    printf("%i\n", tadd_ok(INT_MAX, 0));
    printf("%i\n", tadd_ok(INT_MAX, -1));

    printf("%i\n", tadd_ok(INT_MIN, 1));
    printf("%i\n", tadd_ok(INT_MIN, 0));
    printf("%i\n", tadd_ok(INT_MIN, -1));
}