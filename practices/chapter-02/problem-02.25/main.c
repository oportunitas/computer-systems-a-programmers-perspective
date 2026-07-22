/* 
    Consider the following code that attempts to sum the elements of an array a, where the number of elements is given by parameter length:

        1	// WARNING: This is buggy code
        2	float sum_elements(float a[], unsigned length) {
        3		int i;
        4		float result = 0;
        5
        6		for (i = 0; i <= length–1; i++)
        7			result += a[i];
        8		return result;
        9	}

    When run with argument length equal to 0, this code should return 0.0. Instead, it encounters a memory error. Explain why this happens. Show how this code can be corrected.
*/

#include <stdio.h>

float sum_elements(float a[], unsigned length) {
    int i;
    float result = 0;
    // problem: length - 1 on an unsigned yields maximum unsigned value, fix is to cast length to int first before doing arithmetic
    for (i = 0; i <= ((int) length) - 1; i++) {
        printf("step: %i\n", i);
        // result += a[i];
    } 
    
    return result;
}

int main() {
    float a[4] = {1.0, 2.0, 3.0, 4.0};
    unsigned length = 0;

    printf("%f\n", sum_elements(a, length));
    return 0;
}