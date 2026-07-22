/*
    You are given the assignment of writing a function that determines whether one string is longer than another. You decide to make use of the string library function strlen having the following declaration:

        // Prototype for library function strlen
        size_t strlen(const char *s);

    Here is your first attempt at the function:

        // Determine whether string s is longer than string t
        // WARNING: This function is buggy
        int strlonger(char *s, char *t) {
            return strlen(s) - strlen(t) > 0;
        }

    When you test this on some sample data, things do not seem to work quite right. You investigate further and determine that, when compiled as a 32-bit program, data type size_t is defined (via typedef) in header file stdio.h to be unsigned.

    A. For what cases will this function produce an incorrect result?
        > whenever the string length of s is smaller than t

    B. Explain how this incorrect result comes about.
        > in cases in which the expected value of (strlen(s) - strlen(t)) is negative, due to the size_t definition being unsigned, the result will underflow to maximum unsigned value (and more if the difference is more than 1), in this case, even though s is shorter, since strlen(s) is a huge number, strlonger() will evaluate to 1

    C. Show how to fix the code so that it will work reliably.\
        > we can cast strlen(s) and strlen(t) to int first before comparing them, or set the comparison to be:
        > return strlen(s) > strlen(t)
*/