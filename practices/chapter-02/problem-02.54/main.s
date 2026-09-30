/* question
    Assume variables x, f, and d are of type int, float, and double, respectively. Their values are arbitrary, except that neither f nor d equals +∞, –∞, or NaN. For each of the following C expressions, either argue that it will always be true (i.e., evaluate to 1) or give a value for the variables such that it is not true (i.e., evaluates to 0).

        A. x == (int)(double) x
        B. x == (int)(float) x
        C. d == (double)(float) d
        D. f == (float)(double) f
        E. f == –(–f)
        F. 1.0/2 == 1/2.0
        G. d*d >= 0.0
        H. (f+d)–f == d
*/

/* answer
    A.  x == (int)(double) x, x: int
            this expression will always equate to 1, since converting int to double perfectly preserves any value.

    B.  x == (int)(float) x, x: int
            this expression might evaluate to 0 whenever x's value is not available in float's numerical encoding. in this case, x will be rounded, therefore it would not be the same as the original x value

    C.  d == (double)(float) d, d: double
            this expression might result in 0 when converting d to float results in rounding, since float has half the precision of double, theres bound to be numbers in "double" that can't be represented exactly in "float"

    D.  f == (float)(double) f, f: float
            this expression will always result in 1, since converting float to double preserves its value.

    E.  f == –(–f)
            this will always result in 1. changing positive to negative only involves changing the sign bit in floating numbers. unlike signed integers that have INT_MIN * -1 > INT_MAX, there should be no such thing in floating point numbers

    F.  1.0/2 == 1/2.0
            this expression will evaluate to 1(true). 

    G.  d*d >= 0.0
            considering the problem statement constraint, yes, this expression will evaluate to 1 (true) all the time.

    H.  (f+d)–f == d
            this expression might not evaluate to 1 all the time. example is whenever (f + d) rounds the number. we know that floating point number gaps get increasingly big the further away we are from 0.0, so there might be a case where (f + d) gets to a number so big it cant be represented neatly even in double precision. 
*/

