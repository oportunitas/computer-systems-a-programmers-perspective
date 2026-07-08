/*
    assuming the expressions are evaluated when executing a 32-bit program on a machine that uses two's complement arithmetic, fill in the following table describing the effect of casting and relational operations, in the style of figure 2.19:

    expression                          type        evaluation
    -2147483647 - 1 == 2147483648U      unsigned    true
    -2147483647 - 1 < 2147483647        signed      true ((-2147483647 - 1) evaluates to -2147483648)
    -2147483647 - 1U < 2147483647       unsigned    false (2147483649 - 1 < 2147483647)
    -2147483647 - 1 < 2147483647        signed      true (-2147483648 < 2147483647)
    -2147483647 - 1U < -2147483647      unsigned    true (2147483649 - 1 < 2147483649)
*/