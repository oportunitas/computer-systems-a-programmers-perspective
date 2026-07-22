/*
    Suppose we truncate a 4–bit value (represented by hex digits 0 through F) to a 3–bit value (represented as hex digits 0 through 7.) Fill in the table below showing the effect of this truncation for some cases, in terms of the unsigned and two's-complement interpretations of those bit patterns.
    
        Hex	                    Raw             Unsigned	                Two's complement
        Original	Truncated	Truncated       Original	Truncated	    Original	Truncated
        0	        0	        0|000           0	        0	            0	        0
        2	        2	        0|010           2	        2	            2	        2
        9	        1	        1|001           9	        1	            –7	        1
        B	        3	        1|011           11	        3	            –5	        3
        F	        7	        1|111           15	        7	            –1	        -1
        
    Explain how Equations 2.9 and 2.10 apply to these cases.
        for unsigned representations, we just do modulus 2^3 on the numbers (equation 2.9)
        for signed representations, we first do modulus 2^3, then apply u2t_3 to it.
*/