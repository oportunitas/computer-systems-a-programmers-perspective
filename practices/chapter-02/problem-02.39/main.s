/*
    How could we modify the expression for form B:
        (x << (n + 1)) - (x << m)
    for the case where bit position n is the most significant bit?

        >>>
        lets consider a case:
            [1100]
        where w is 4,
        if we use form b:
            (x << 4) - (x << 2)
        notice that there is (x << w). if we shift right a w-sized number by w, it will always result in 0.:
            (0) - (x << 2)
            - (x << m)
*/