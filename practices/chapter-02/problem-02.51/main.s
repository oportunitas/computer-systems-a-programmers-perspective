/*
    We saw in Problem 2.46 that the Patriot missile software approximated 0.1 as x = 0.00011001100110011001100_2. Suppose instead that they had used IEEE round-to-even mode to determine an approximation x′ to 0.1 with 23 bits to the right of the binary point.

        What is the binary representation of x′?
            recall that 0.1 in decimal is equal to 0.0[0011] in binary (the square bracket part repeats forever: 0.0001100110011001100110011.....)
            x is equal to:
            0.00011001100110011001100|1100110011001100110011....

            lets round this to 23 bits. since the next 2 bits are 11, we round this up:
                0.00011001100110011001101//

        What is the approximate decimal value of x′ – 0.1?
            0.00011001100110011001101|0000000000000000000000....
            0.00011001100110011001100|1100110011001100110011....
            ----------------------------------------------------
            0.00000000000000000000000|0011001100110011001100....
            = 0.00000002384185791016_10 //

        How far off would the computed clock have been after 100 hours of operation?
            0.00000002384185791016_10 * 10 * 60 * 60 * 100
            = 0.08583068847_10 //

        How far off would the program's prediction of the position of the Scud missile have been?
            0.08583068847_10 * 2000
            = 171.661376953 meters //
*/