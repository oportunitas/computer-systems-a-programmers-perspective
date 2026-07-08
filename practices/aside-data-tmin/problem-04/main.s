/*
    Suppose we try to write the value of TMin64 as decimal and hexadecimal constants. Fill in the following table using the rules shown in Figure 1 to determine what type the resulting value should be. You may find some cases where the rules do not define a valid representation for the constant. Indicate such cases with the entry “undefined.”


    Word Size C Version  -9223372036854775808 (-2^63)      0x8000000000000000 (2^63)

    32        C90        -> find fit 9223372036854775808   -> find fit 0x8000000000000000
                         -> max available was (2^32 - 1)ul -> max available was (2^32 - 1)ul
                         -> cannot find, undefined         -> cannot find, undefined

    32        C99        -> find fit 9223372036854775808   -> find fit 0x8000000000000000
                         -> max available was (2^32 - 1)ll -> unsigned long long, max (2^64 - 1)
                         -> cannot find, undefined         -> 9223372036854775808ull, negate
                                                           -> -9223372036854775808ull, success

    64        C90        -> find fit 9223372036854775808   -> find fit 0x8000000000000000
                         -> unsigned long, max (2^64 - 1)  -> unsigned long, max (2^64 - 1)
                         -> 9223372036854775808ul, negate  -> 9223372036854775808ul, negate 
                         -> 9223372036854775808ul          -> 9223372036854775808ul

    64        C99        -> find fit 9223372036854775808   -> find fit 0x8000000000000000
                         -> max available was (2^63 - 1)ll -> unsigned long, max (2^64 - 1)
                         -> cannot find, undefined         -> 9223372036854775808ul, negate 
                                                           -> 9223372036854775808ul

    integer data type walkthrough during declaration:
        c90                             c99
        dec             hex             dec         hex
        int             int             int         int
        long            unsigned        long        unsigned int
        unsigned        long            long long   long
        unsigned long   unsigned long               unsigned long
                                                    long long
                                                    unsigned long long
*/