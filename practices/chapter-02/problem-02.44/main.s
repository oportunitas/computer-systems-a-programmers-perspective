/*
    Assume data type int is 32 bits long and uses a two's-complement representation for signed values. Right shifts are performed arithmetically for signed values and logically for unsigned values. The variables are declared and initialized as follows:

        int x = foo();	 // Arbitrary value
        int y = bar();	 // Arbitrary value

        unsigned ux = x;
        unsigned uy = y;

    For each of the following C expressions, either (1) argue that it is true (evaluates to 1) for all values of x and y, or (2) give values of x and y for which it is false (evaluates to 0):
        (x and y is represented by 32 bits)

        A. (x > 0) || (x-1 < 0)
            >>>false
            lets first see it mathematically, which is the same as (x > 0) || (x < 1). x should theoretically encompass all numbers (no number is not bigger than 0 and not less than 1, it must be at least bigger than 0 or less than 1)

            however, in computer programs, if x is INT_MIN, x - 1 will be INT_MAX due to negative overflow. this will result in the expression:
                INT_MIN > 0 || INT_MAX < 0
            which is both false. this means that in computer programs, x value of INT_MAX will result in a false/unexpected result

        B. (x & 7) != 7 || (x<<29 < 0)
            >>>true
            so its either x's last 3 bit is not 111, or x shifted by 23 is a negative number.
            111 shifted by 29, the first 1 will be the sign, thus negative number.

        C. (x * x) >= 0
            >>>false
            either positive or negative overflow can happen here, resulting in a false result

        D. x < 0 || -x <= 0
            >>>true
            if x is INT_MIN, -x is INT_MIN (since INT_MIN is one less than the negation of INT_MAX). this should not bother us though

        E. x > 0 || -x >= 0
            >>>false
            a similar thing with D will happen here, if x is INT_MIN, this time, both arms of the expression evaluated to 0, since negation of INT_MIN will produce INT_MIN.

        F. x+y == (u)y+(u)x
            >>>true
            unsigned casting of both y and x will always preserve the value of the original two's complement value.

        G. x*~y + uy*ux == -x
            >>>true
            ~y (flipping all bits of y) will result in -y-1:
                x * (-y - 1) + (u)y * (u)x
                ((x * -y) - (x)) + y * x
                -(x * y) + (x * y) - x
                -x
                
*/