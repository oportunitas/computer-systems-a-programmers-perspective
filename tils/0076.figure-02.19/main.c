/*
an expression including a signed and unsigned integer in c will result in the expression to be evaluated as if the signed integer is unsigned. resulting in some unintuitive behaviors.
*/

#include <stdio.h>
#include <limits.h>

int main() {
    //this prints 0: unsigned value of -1 is 0b1...1, while 0 is 0b 0b0...0
    printf("%d\n", -1 < 0u);

    //this prints 0: unsigned value of INT_MAX (2^31 - 1) is smaller than unsigned value of INT_MIN (UINT_MAX - 1)
    printf("%d\n", (unsigned)INT_MAX > (INT_MIN));

    //this prints 1 (both sub-expressions are signed): SIGNED value of INT_MAX (2^31 - 1) is bigger than the signed value of (unsigned)(INT_MAX + 1), which is (INT_MIN)
    printf("%d\n", INT_MAX > (int)(unsigned)(INT_MAX + 1));
    return 0;
}