/* question
    you are assigned the task of writing code for a function `tsub_ok`, with arguments `x` and `y`, that will return 1 if computing `x - y` does not cause overflow. having just written the code for problem 2.30, you write the following:
        
        // determine whether arguments can be subtracted without overflow
        // warning: this code is buggy
        int tsub_ok(int x, int y) {
            return tadd_ok(x, -y);
        }
    
    for what values of `x` and `y` will this function give incorrect results? writing a correct version of this function is left as an exercise
*/

/*
    we need to recall that the negation of INTW_MIN (-2^(w-1)) is one more than INTW_MAX (2^(w-1) - 1). so whenever y is equal to INTW_MIN, negating y would result instead in INT_MAX + 1, lets observe the below code
*/

#include <stdio.h>
#include <limits.h>

// int main() {
//     int min = INT_MIN;
//     int max = INT_MAX;

//     printf("%i\n", min);
//     printf("%i\n", -min);
//     printf("%i\n", max);
//     printf("%i\n", -max);
// }

/*
    as we recall from previous chapters, INT_MAX + 1 is represented as INT_MIN. which results in -min being represented as exactly the same as min. this would break the call for tadd_ok(x, -y) for y = min since -min doesnt negate min.

    instead of calling tadd_ok(x, -y), in my opinion a safer way to do tsub_ok() is to do the logic of tsub_ok() directly (like in tadd_ok())
*/

int tsub_ok(int x, int y) {
    int sum = x - y;
    int is_positive_overflow = (x >= 0 && y < 0) && sum < 0;
    int is_negative_overflow = (x < 0 && y >= 0) && sum >= 0;
    return !is_positive_overflow && !is_negative_overflow;
}

int main() {
    printf("%i\n", tsub_ok(1, 2));

    printf("%i\n", tsub_ok(INT_MAX, 1));
    printf("%i\n", tsub_ok(INT_MAX, 0));
    printf("%i\n", tsub_ok(INT_MAX, -1));

    printf("%i\n", tsub_ok(INT_MIN, 1));
    printf("%i\n", tsub_ok(INT_MIN, 0));
    printf("%i\n", tsub_ok(INT_MIN, -1));
}
