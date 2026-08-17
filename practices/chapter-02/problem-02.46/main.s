/*
    The imprecision of floating-point arithmetic can have disastrous effects. On February 25, 1991, during the first Gulf War, an American Patriot Missile battery in Dharan, Saudi Arabia, failed to intercept an incoming Iraqi Scud missile. The Scud struck an American Army barracks and killed 28 soldiers. The US General Accounting Office (GAO) conducted a detailed analysis of the failure [76] and determined that the underlying cause was an imprecision in a numeric calculation. In this exercise, you will reproduce part of the GAO's analysis.

    The Patriot system contains an internal clock, implemented as a counter that is incremented every 0.1 seconds. To determine the time in seconds, the program would multiply the value of this counter by a 24-bit quantity that was a fractional binary approximation to 1/10. In particular, the binary representation of 1/10 is the nonterminating sequence 0.000110011[0011]...2, where the portion in brackets is repeated indefinitely. The program approximated 0.1, as a value x, by considering just the first 23 bits of the sequence to the right of the binary point: x = 0.00011001100110011001100. (See Problem 2.51 for a discussion of how they could have approximated 0.1 more precisely.)

        A. What is the binary representation of 0.1 – x?
            lets look this in a binary viewpoint:
                0.1 = 0.00011001100110011001100[0011]
                x   = 0.00011001100110011001100
            as such:
                0.1 - x = 0.000000000000000000000000011[0011]
                          0.000000000000000000000001100

        B. What is the approximate decimal value of 0.1 – x?
            if we were describing this as a series:
                3 / 2^27 + 3 / 2^31 + 3 / 2 ^ 35 ...
                    (lets define this as ε).
                
                in pseudocode:
                    (sum([(3 / pow(2, 23 + (4 * i))) for i in range (1, inf)]))

                lets find the sum of the geometric series
                    16ε - ε = 3 / 2^23
                    15ε = 3 / 2^23
                    ε = 1 / (5 * 2^23)
            
        C. The clock starts at 0 when the system is first powered up and keeps counting up from there. In this case, the system had been running for around 100 hours. What was the difference between the actual time and the time computed by the software?
            the error created from calculating 0.1 - x accumulates each 10th of a second, which is 10 times per second. in 100 hours, the system has accumulated error 3600000 times.

            by this time, the error is 3600000ε, which is:
                = 3600000 * (1 / (5 * 2^23))
                = 3600000 / (5 * 2^23)
                = (720000 / 2^23) seconds
                = 0.08583068847 seconds

        D. The system predicts where an incoming missile will appear based on its velocity and the time of the last radar detection. Given that a Scud travels at around 2,000 meters per second, how far off was its prediction?
            if we were to multiply (720000 / 2^23) seconds by 2000 meters per second:
                = 1440000000 / 2 ^ 23
                = 171.661376953 meters
            
    Normally, a slight error in the absolute time reported by a clock reading would not affect a tracking computation. Instead, it should depend on the relative time between two successive readings. The problem was that the Patriot software had been upgraded to use a more accurate function for reading time, but not all of the function calls had been replaced by the new code. As a result, the tracking software used the accurate time for one reading and the inaccurate time for the other.
*/