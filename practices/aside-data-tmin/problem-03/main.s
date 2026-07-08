/*
problem:
    You wish to write a succinct expression for TMinw, where w is the number of bits in data type long int. Since the size of this data type varies depending on the machine and the compiler settings (see Figures CS:APP3e-2.9 and CS:APP3e-2.10), you decide to make use of the sizeof operation, so that the expression will yield TMinw as long as w is a multiple of 8. You also use a trick, to be covered in Section CS:APP3e-2.3.6, that shifting a number left by 3 is the same as multiplying it by 8.

    Your first attempt at this code is:
        // WARNING: This code is buggy
        // Shift 1 over by 8*sizeof(long) - 1
        
        1L << sizeof(long)<<3 - 1

    You compile your code as a 32-bit program and find that the expression evaluates to 64.
        A. Explain why this happened.
        B. What value would the expression yield for a 64-bit program?
        C. Make minimal modifications to the expression so that it evaluates correctly

workthrough:
    A. 
        lets analyze this program:
            1L << sizeof(long)<<3 - 1
        using bit-level expressions.

        in 32bit systems:
            1L << sizeof(long)<<3 - 1
            
            since shift operations associate left-to-right, the following is the breakdown:
            1L << sizeof(long)<<3 - 1
            1L << 4 << 3 - 1
            1L << 4 << 2
            0b00000000000000000000000000000001 << 4 << 2
            0b00000000000000000000000000010000 << 2
            0b00000000000000000000000001000000
            64

            where the result should have been:
            0b10000000000000000000000000000000

            i think the expression should evaluate sizeof(long) first by 3, and then minus it by 1 (to get w-1), and then shift by that much (so it moves the 1 to the very left bit, without minus 1 done first it would result in all 0s since the one got "off the cliff") :
                1L << ((sizeof(long) << 3) - 1)
            since shift operations go left to right, the 1L << 4 is evaluated first. and also, since addition/substraction takes precedence over shifting, 3-1 is evaluated first.

    B. if we were using the buggy expression on 64 bit systems, it would evaluate to:
        1L << 8 << 3 - 1
        1L << 8 << 2
        0b0000000000000000000000000000000000000000000000000000000000000001 << 8 << 2
        0b0000000000000000000000000000000000000000000000000000000100000000 << 2
        0b0000000000000000000000000000000000000000000000000000010000000000
        1024

    C.  from a's solution:
            1L << ((sizeof(long) << 3) - 1)
        or just:
            1L << (sizeof(long) << 3) - 1
        since addition/substraction takes precedence over shifting
        
*/