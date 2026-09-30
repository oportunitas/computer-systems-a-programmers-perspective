/*
    Fill in the following macro definitions to generate the double-precision values +∞, –∞, and –0:

        #define POS_INFINITY
        #define NEG_INFINITY
        #define NEG_ZERO

    You cannot use any include files (such as math.h), but you can make use of the fact that the largest finite number that can be represented with double precision is around 1.8 × 10308.
*/

/* idea #0
    we can define POS_INFINITY as bigger than 1.8x10^308 (here its 1.9 x 10^308, but can be any bigger number).

    we can set NEG_INFINITY as minus POS_INFINITY, and set NEG_ZERO by trying to find the negative infinitesimal (-1 / inf)
*/
#define POS_INFINITY 1.9e308
#define NEG_INFINITY (-POS_INFINITY)
#define NEG_ZERO (-1.0/POS_INFINITY)