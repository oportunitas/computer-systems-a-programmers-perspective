/*
    Consider the following two 7-bit floating-point representations based on the IEEE floating-point format. Neither has a sign bit—they can only represent nonnegative numbers.

    Format A
        There are k = 3 exponent bits. The exponent bias is 3.
        There are n = 4 fraction bits.

    Format B
        There are k = 4 exponent bits. The exponent bias is 7.
        There are n = 3 fraction bits.
        
    Below, you are given some bit patterns in format A, and your task is to convert them to the closest value in format B. If necessary, you should apply the round-to-even rounding rule. In addition, give the values of numbers given by the format A and format B bit patterns. Give these as whole numbers (e.g., 17) or as fractions (e.g., 17/64).

    Format A	                            Format B
    Bits	    Equation        Value	    Bits          Equation      Value
    011 0000 	  1.0000_2      1	        0111 000	   1.000_2      1
    101 1110      111.10_2      15/2        1001 111       111.1_2      15/2
    010 1001	 0.11001_2      25/32       0110 100      0.1100_2      12/16
    110 1111	  1111.1_2      31/2        1010 111        1111_2      16
    000 0001	0.000001_2      1/64        0001 000    0.000001_2      64

*/