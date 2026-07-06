/*
Armed with the function inplace_swap() from Problem 2.10, you decide to write code that will reverse the elements of an array by swapping elements from opposite ends of the array, working toward the middle.

You arrive at the following function:
    void inplace_swap(int* x, int* y) {
        printf("%.8x %8x\n", *x, *y);
        *y = *x ^ *y;
        printf("%.8x %8x\n", *x, *y);
        *x = *x ^ *y;
        printf("%.8x %8x\n", *x, *y);
        *y = *x ^ *y;
        printf("%.8x %8x\n", *x, *y);
    }

When you apply your function to an array containing elements 1, 2, 3, and 4, you find the array now, as expected, elements 4, 3, 2, and 1. When you tryt it on an array with elements 1, 2, 3, 4, and 5, however, you are surprised to see that the array now whas elements 5, 4, 0, 2, and 1. In fact, you discover that the code always works correctly on arrays of even length, but it sets the middle element to 0 whenever the array has odd length.

    A. For an array of odd length cnt = 2k + 1, what are the values of variables first and last in the final iteration of function reverse_array()?
        Workthrough: 
            the last value before for loop breaks would be the same, which is the middle of the array, which is index k / 2.
    B. Why does this call to function inplace_swap() set the array element to 0?
        Workthrough: 
            since inplace_swap() gets x and y by reference and directly modifies the actual contents. the moment in which the virtual address of x and y is the same (which is what happens when we are processing the middle of an odd-sized array), the following happens:
                - the first part `*y = *x ^ *y;` effectively becomes `*y = *y ^ *y;` (since address of x and y is the same). since a ^ a = 0, *y = 0.
                - the second part and so on is repeating the same stuff, now its 0 ^ 0.
            as such the resulting value of inplace_swap(pa, pb) where pa == pb is always 0. 
    C. What simple modification to the code for reverse_array() would eliminate this problem?
        Workthrough:
            since the middle number of an odd-sized array never changes anyways on flip, we can just ignore it and set the breakpoint of the for loop to be first < last instead of first <= last
*/

#include <stdio.h>

void inplace_swap(int* x, int* y) {
    *y = *x ^ *y;
    *x = *x ^ *y;
    *y = *x ^ *y;
}

void reverse_array(int a[], int cnt) {
    int first, last;
    for (first = 0, last = cnt - 1; first < last; first++, last--) {
        inplace_swap(&a[first], &a[last]);
    }
}

#define SIZE 5

int main() {
    int arr[SIZE] = {1, 2, 3, 4, 5};
    reverse_array(arr, SIZE);
    for (int i = 0; i < SIZE; i++) {
        printf("%d", arr[i]);
    } printf("\n");

    return 0;
}