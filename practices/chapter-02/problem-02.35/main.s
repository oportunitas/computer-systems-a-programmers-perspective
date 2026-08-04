/*
    You are given the assignment to develop code for a function tmult_ok that will determine whether two arguments can be multiplied without causing overflow. Here is your solution:

        // Determine whether arguments can be multiplied without overflow
        int tmult_ok(int x, int y) {
            int p = x*y;
            // Either x is zero, or dividing p by x gives y
            return !x || p/x == y;
        }

    You test this code for a number of values of x and y, and it seems to work properly. Your coworker challenges you, saying, “If I can't use subtraction to test whether addition has overflowed (see Problem 2.31), then how can you use division to test whether multiplication has overflowed?”

    Devise a mathematical justification of your approach, along the following lines. First, argue that the case x = 0 is handled correctly. 
        > in any case where x is 0, the resulting multiplication should always be 0. the bit truncation would apply a modulus on 0, which doesnt change the result.

    Otherwise, consider w-bit numbers x (x ≠ 0), y, p, and q, where p is the result of performing two's-complement multiplication on x and y, and q is the result of dividing p by x.

    1. Show that x · y, the integer product of x and y, can be written in the form x ⋅ y = p + t(2^w), where t ≠ 0 if and only if the computation of p overflows.
        > if we visualize the two's complement number system as a circular loop of numbers, the moment we overflow is the moment we step over the TMAX/TMIN boundary. in both negative and positive overflow case, when we cross over the boundary, the true value of x · y can no longer be represented with p (given that p is within the range of twos complement with width w). in this case, the number must be represented as some multiple of 2^w shifted by p.

    2. Show that p can be written in the form p = x ⋅ q + r, where |r| < |x|.
        > following question 1's conclusion, p is a number used to 'shift' t(2^w) into the appropriate number. p = x ⋅ q + r, where |r| < |x| is true based on the rules of integer division

    3. Show that q = y if and only if r = t = 0.
        > p = x * q + r by definition will be p = x * q if r = 0. if t is also 0, then we have x * y = p. this results in x * y = x * q, as such y = q

*/