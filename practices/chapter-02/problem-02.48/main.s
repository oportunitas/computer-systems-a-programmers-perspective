/*
    As mentioned in Problem 2.6, the integer 3,510,593 has hexadecimal representation 0x00359141, while the single-precision floating-point number 3,510,593.0 has hexadecimal representation 0x4A564504. Derive this floating-point representation and explain the correlation between the bits of the integer and floating-point representations.

        Lets break down both numbers into binary:

          0x0   0   3   5   9   1   4   1
            00000000001101011001000101000001
          0x4   A   5   6   4   5   0   4
            01001010010101100100010100000100
        
        we can notice that between the two binary numbers, there is a common section:
            0x00359141i -> 00000000001|101011001000101000001|
            0x4A564504f ->   010010100|101011001000101000001|00
        
        if we were to derive 0x4A564504f:
            s   exp        frac
            0 | 10010100 | 10101100100010100000100
            0 | 2^21     | (1.10101100100010100000100)_2
            
            = 2^21 * (1.10101100100010100000100)_2
            = (1101011001000101000001)_2
            = 3510593
        
        the fraction part of the float is identical (after adding the leading 1 digit) with the unsigned representation of the number, hence the shared section between the two numbers.
*/