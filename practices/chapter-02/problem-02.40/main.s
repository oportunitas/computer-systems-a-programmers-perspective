/*
    For each of the following values of K, find ways to express x * K using only the specified number of operations, where we consider both additions and subtractions to have comparable cost. You may need to use some tricks beyond the simple form A and B rules we have considered so far.


    K	    Shifts	    Add/Subs	Pre-Expression          Expression
    6	    2	        1	        (x * 4) + (x * 2)       (x << 2) + (x << 1)
    31	    1	        1	        (x * 32) - x            (x << 5) - x
    –6	    2	        1	        (x * 2) - (x * 8)       (x << 1) - (x << 3)
    55	    2	        2	        (x * 64) - (x * 8) - x  (x << 6) - (x << 3) - x
*/