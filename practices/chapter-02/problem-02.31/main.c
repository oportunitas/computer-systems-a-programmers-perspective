/*
    your coworker gets impatient with your analysis of the overflow conditions for two's complement addition and presents you with the following implementation of tadd_ok:

        //determine whether arguments can be added without overflow
        //warning: this code is buggy
        int tadd_ok(int x, int y) {
            int sum = x + y;
            return (sum - x == y) && (sum - y == x);
        }

    answer:
        the problem with this function is that the expression `sum - x` or `sum - y` by themselves can undergo overflow that 'cancels' the overflow experienced on the evaluation of `sum` (because signed int addition (twos complement) is an abelian group). lets explore the case of INT_MAX + 1:

            - x = INT_MAX, y = 1
            - sum = x + y = INT_MIN (positive overflow)
            - sum - x = INT_MIN - INT_MAX = 1 = y (negative overflow)
            - sum - y = INT_MIN - 1 = INT_MAX (negative overflow)

        the effort to calculate `sum - x` and or `sum - y` results to no meaningful information about the expression `sum` itself. in an abelian group (number systems that can be visualized as a closed loop), ((x + y) - y) will always evaluate to x (think of it as being in position x in a circle, and then moving y positions forward along the circle, and then y positions back. no matter how big or small the amount of steps (y) is, you are guaranteed to come back to x since you're on a closed loop)
*/

#include <stdio.h>
#include <limits.h>

int tadd_ok(int x, int y) {
    int sum = x + y;
    return (sum - x == y) && (sum - y == x);
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