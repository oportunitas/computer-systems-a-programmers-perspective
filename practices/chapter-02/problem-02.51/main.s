/*
    Show how the following binary fractional values would be rounded to the nearest half (1 bit to the right of the binary point), according to the round-to-even rule. In each case, show the numeric values, both before and after rounding.
        a. 10.010
           10.010, options for rounding: 10.0 and 10.1.
                   10.010      10.100
                   10.000      10.010
                   ------      ------
                   00.010      10.010
           10.010 is halfway between 10.0 and 10.1, so we round to whichever have the least significant digit equal to 0:
           10.0// (2)

        b. 10.011
           10.011, using the information from a, we know that 10.011 is closer to 10.1.
           10.1// (2.5)

        c. 10.110
           10.110, options for rounding: 11.0 and 10.1
                   10.110      11.000
                   10.100      10.110
                   ------      ------
                   00.010      00.010
            10.110 is halfway between 11.0 and 10.1, so we round to whichever have the least significant digit equal to 0:
            11.0// (3)
        d. 11.001
           this number is just closest to 11.0
           11.0// (3)
*/