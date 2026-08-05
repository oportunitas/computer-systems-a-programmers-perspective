/*
    In the following code, we have omitted the definitions of constants M and N:

        #define M		// Mystery number 1 
        #define N		// Mystery number 2 
        int arith(int x, int y) {
            int result = 0;
            result = x*M + y/N; // M and N are mystery numbers. 
            return result;
        }

    We compiled this code for particular values of M and N. The compiler optimized the multiplication and division using the methods we have discussed. The following is a translation of the generated machine code back into C:

        /* Translation of assembly code for arith 
        int optarith(int x, int y) {
            int t = x;
            x <<= 5;
            x-=t;
            if (y < 0) y += 7;
            y >>= 3; // Arithmetic shift 
            return x+y;
        }

    What are the values of M and N?

        >>>
        lets reverse engineer:
            x + y
            x + (y >> 3)
            x + ((y + (y < 0 ? y + 7 : 0)) >> 3)
            (x - t) + ((y + (y < 0 ? y + 7 : 0)) >> 3)
            ((x << 5) - t) + ((y + (y < 0 ? y + 7 : 0)) >> 3)
            ((x << 5) - x) + ((y + (y < 0 ? y + 7 : 0)) >> 3)
            (x * 32 - x) + (y / 8)
            (x * 31) + (y / 8)
            x*31 + y/8
                as such:
            M = 31, N = 8
*/