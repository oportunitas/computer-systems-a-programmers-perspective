/*
    As we will see in Chapter 3, the lea instruction can perform computations of the form (a<<k) + b, where k is either 0, 1, 2, or 3, and b is either 0 or some program value. The compiler often uses this instruction to perform multiplications by constant factors. For example, we can compute 3*a as (a<<1) + a.
    
    Considering cases where b is either 0 or equal to a, and all possible values of k, what multiples of a can be computed with a single lea instruction?

        > we can directly enumerate the possible options for a single LEA instruction with cases where b is either 0 or a:
            - (a << 0) + 0 -> 1 * a
            - (a << 0) + a -> 2 * a
            - (a << 1) + 0 -> 2 * a
            - (a << 1) + a -> 3 * a
            - (a << 2) + 0 -> 4 * a
            - (a << 2) + a -> 5 * a
            - (a << 3) + 0 -> 8 * a
            - (a << 3) + a -> 9 * a
        so the only possible values is 1a, 2a, 3a, 4a, 5a, 8a, or 9a.
*/