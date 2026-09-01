/*
    A. For a floating-point format with an n-bit fraction, give a formula for the smallest positive integer that cannot be represented exactly (because it would require an (n + 1)-bit fraction to be exact). Assume the exponent field size k is large enough that the range of representable exponents does not provide a limitation for this problem.

        idea #0 (wrong):
            if we have n-bit fraction, the ranges of possible values of the fraction ranges from
            0...n-2...0 to 1...n-2...1. any one of these can be read as a positive int, assuming we have the right exponent value. so we have changed the lower bound of the representable ints to 1...n-2...1.

            the next int in the sequence: 10...n-2...0 can be represented as just 10...n-1...0 in the fraction part (since the last 0 is redundant). following this logic, we can conclude that any option of numbers from 10...n-2...0 to 11...n-1..10 can be represented perfectly. this leaves 11...n-2...1 or 1...n-1...1 as the first number to not be able to be represented exactly, since we run out of room for defining the fraction part (this number needs n + 1 bit fraction of 1s, but we only have n fraction bits)

            as such, the first number to not be able represented exactly is one represented as n+1 1s, or 2^n - 1
        
        idea #1 (revision to idea #0 in light of solution):
            i mixed up definitions in idea #0:
                first off, for non-0 exponents, the fraction part has an implicit 1 at the front. this means, that for non-0 exponent, the fraction of 0...n-2...0 can represent 10...n-2...0.

                also, in idea #0, the smallest number there (with the flawed idea) shouldnt've been 1...n-1...1, but actually 10...n-3...01 (1, then 0s all the way to the end, then 1).
            with these 2 informations in hand, the actual smallest number unrepresentable is actually:
                0...n-2...01 in the fraction part, since this would need n + 1 bits in frac
                with exp of 1, this number represents:
                    1, with n 0s, and then 1.
                which means this is:
                    2^(n + 1) + 1

    B. What is the numeric value of this integer for single-precision format (n = 23)?
        idea #0 (wrong):
            2^23, 8388607
        idea #1 (revision to idea #0 in light of solution):
            2^24 + 1, 16777217
*/