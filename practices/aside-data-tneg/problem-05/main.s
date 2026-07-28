/*
    We saw in Web Aside DATA:TMIN that trying to write TMin32 as an integer constant can expose some nuances of the C language, with results possibly depending on language version and word size.

    Now that we are familiar with integer arithmetic, we can explore other possible ways of writing this constant. Below are six different expressions

        A. 2147483647 + 1
        B. 0x7FFFFFFF + 1
        C. 2147483649 - 1
        D. 0x80000001 - 1
        E. -(2147483649 - 1)
        F. -(0x80000001 - 1)

    Suppose that we compile the code on a machine that uses a 32-bit, two’s complement representation of data type int, and that the compiler implements ISO-C99. For each of these, determine:

        1. What would be the resulting data type of the expression?
        2. What would be the resulting numeric value?
        3. Would we get TMin32 if we cast the value to type int?
*/

/*
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

/* 

    A. 2147483647 + 1
        : assign data types of numbers
        > [int] (2147483647) + [int] (1)
        : promote
        > [int] (2147483647) + [int] (1)
        : calculate
        > [int] (-2147483648)
        : positive overflow, cast to int:
        > [int] (-2147483648)

    B. 0x7FFFFFFF + 1
        : assign data types of numbers
        > [int] (0x7FFFFFFF) + [int] (1)
        : promote
        > [int] (0x7FFFFFFF) + [int] (1)
        : calculate
        > [int] (0x80000000)
        : positive overflow, cast to int:
        > [int] (0x80000000)

    C. 2147483649 - 1
        : assign data types of numbers
        > [long] (2147483649) - [int] (1)
        : promote
        > [long] (2147483649) - [long] (1)
        : calculate
        > [long] (2147483648)
        : no overflow, cast to int:
        > [int] (-2147483648)

    D. 0x80000001 - 1
        : assign data types of numbers
        > [unsigned int] (0x80000001) - [int] (1)
        : promote
        > [unsigned int] (0x80000001) - [unsigned int] (1)
        : calculate
        > [unsigned int] (0x80000000)
        : no overflow, cast to int:
        > [int] (0x80000000)

    E. -(2147483649 - 1)
        : assign data types of numbers
        > -([long] (2147483649) - [int] (1))
        : promote
        > -([long] (2147483649) - [long] (1))
        : calculate
        > -([long] (2147483648))
        : negate
        > [long] (-2147483648)
        : no overflow, cast to int:
        > [int] (-2147483648) 
            (casting removes the 32 leading bits of 0xFFFFFFFF80000000)

    F. -(0x80000001 - 1)=
        : assign data types of numbers
        > -([unsigned int] (0x80000001) - [int] (1))
        : promote
        > -([unsigned int] (0x80000001) - [unsigned int] (1))
        : calculate
        > -([unsigned int] (0x80000000))
        : negate (negating happens bit level)
        > [unsigned int] (0x80000000)
        : cast to int:
        > [int] (0x80000000)
*/