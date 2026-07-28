/*
    We claimed that we could generate the two’s complement negation of a number x, having bit-level representation ~x, by finding bit position k such that ~x has the form xw−1, xw−2, . . . , xk+1, 1, 0, . . . 0 
    
    The negation is then written in binary form as [˜xw−1, ˜xw−2, . . . ˜ xk+1, 1, 0, . . . , 0].Show that the resulting value indeed has value - t 32 x.
*/

/*
    there are several ways to approach this, one way is to compare against the -x = ˜x + 1 approach:
        - during incrementation, we find the rightmost 0, and we flip everything from that rightmost 0 all the way to the right.
        - this means that we essentially do two things during (-x = ˜x + 1):
            - flip everything
            - then flip again everything starting from the rightmost 0
        - we can simplify this process, via knowing that the rightmost 0 after the everything-flip is the rightmost 1 beforehand, that we can just flip everything to the left of the rightmost 1 instead. this way we save one step in finding -x:
            - flip everything to the left of the rightmost 1
        - this is the same rule as the 'complement upper bits' approach
*/