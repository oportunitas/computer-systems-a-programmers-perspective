/*
problem:
    Suppose we try to write TMin32 as -0x7FFFFFFF-1. Would the C compiler generate a constant of type int for both 32- and 64-bit programs and for both versions of the C language standard? Explain.

answer/workthrough:
    if we use
        #define TMin32 -0x7FFFFFFF - 1
    the compiler (in any system), to evaluate the -0x7FFFFFFF subexpression, will first find the data type and value of 0x7FFFFFFF, then negate it.

    the compiler will then realize that 0x7FFFFFFF can fit in a signed integer value (INT_MAX), it'll reverse it first, and then its done this part and gets to evaluating the larger expression:
        (the below is the conceptual visualization, not actual code, of what happens)
        #define TMin32 0x80000001 - 1
        #define TMin32 0x80000000
    
    since in any system (32bit or 64bit) and in any language, the compiler can comfortably express TMin32 as a signed int throughout the process, this definition will always result in -2^31
*/