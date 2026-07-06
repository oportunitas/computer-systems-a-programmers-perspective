/*
computers generate color pictures on a video screen or liquid crystal display by mixing three different colors of light: red, green, and blue. imagine a simple scheme, with three different lights, each of which can be turned on or off, projecting onto a glass screen. 

We can then create eight diferent colors based on the absence (0) or presence (1) of light sources R, G, and B:

R   G   B   Color
0   0   0   Black
0   0   1   Blue
0   1   0   Green
0   1   1   Cyan
1   0   0   Red
1   0   1   Magenta
1   1   0   Yellow
1   1   1   White

Each of these colors can be represented as a bit vector of length 3, and we can apply Boolean operations to them.

    A. The complement of a color is formed by turning off the lights that are on and turning on the lights that are off. What would be the complement of each the eight colors listed above?
        Workthrough:
            Black   : 000->111  : White
            Blue    : 001->110  : Yellow
            Green   : 010->101  : Magenta
            Cyan    : 011->100  : Red
            Red     : 100->011  : Cyan
            Magenta : 101->010  : Green
            Yellow  : 110->001  : Blue
            White   : 111->001  : Black

    B. Describe the effect of applying Boolean operations on the following colors:
        Blue | Green =
            Workthrough:
                001 | 010 -> 011 -> Cyan
        Yellow & Cyan =
            Workthrough:
                110 & 011 -> 010 -> Green
        Red ^ Magenta =
            Workthrough:
                100 ^ 101 -> 001 -> Blue
*/