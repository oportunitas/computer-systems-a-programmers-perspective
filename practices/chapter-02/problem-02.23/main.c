/*
    Consider the following C functions:

        int fun1(unsigned word) {
            return (int) ((word << 24) >> 24);
        }

        int fun2(unsigned word) {
            return ((int) word << 24) >> 24;
        }

    Assume these are executed as a 32–bit program on a machine that uses two's-complement arithmetic. Assume also that right shifts of signed values are performed arithmetically, while right shifts of unsigned values are performed logically. (shifting right signed values copies the most significant bit)

        A. Fill in the following table showing the effect of these functions for several example arguments. You will find it more convenient to work with a hexadecimal representation. Just remember that hex digits 8 through F have their most significant bits equal to 1.

            w	            fun1(w)@l2	    fun1(w)@l1	    fun1@l0	        fun2(w)@l2      fun2(w)@l1      fun2(w)@l0
            0x00000076	    0x76000000u     0x00000076u	    0x00000076i     0x76000000u     0x76000000i     0x00000076i
            0x87654321	    0x21000000u     0x00000021u	    0x00000021i     0x21000000u     0x21000000i     0x00000021i
            0x000000C9	    0xC9000000u     0x000000C9u	    0x000000C9i     0xC9000000u     0xC9000000i     0xFFFFFFC9i
            0xEDCBA987	    0x87000000u     0x00000087u     0x00000087i     0x87000000u     0x87000000i     0xFFFFFF87i

        B. Describe in words the useful computation each of these functions performs.
            fun1() extracts value from the last byte of the number, fun2() does the same thing but with a sign extension.

    check using below code
*/

#include <stdio.h>

int fun1(unsigned word) {
    return (int) ((word << 24) >> 24);
}

int fun2(unsigned word) {
    return ((int) word << 24) >> 24;
}

int main() {
    printf("0x%.8x 0x%.8x\n", fun1(0x00000076), fun2(0x00000076));
    printf("0x%.8x 0x%.8x\n", fun1(0x87654321), fun2(0x87654321));
    printf("0x%.8x 0x%.8x\n", fun1(0x000000C9), fun2(0x000000C9));
    printf("0x%.8x 0x%.8x\n", fun1(0xEDCBA987), fun2(0xEDCBA987));
    
    return 0;
}