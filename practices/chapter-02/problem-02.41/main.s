/*
    For a run of ones starting at bit position n down to bit position m (n ≥ m), we saw that we can generate two forms of code, A and B. How should the compiler decide which form to use?
    
    >>>
        form B should be used whenever possible, since its using in average less operations than form A. 

        in a more rigorous wording: we can choose form A when n = m since form A will only need 1 operation, we can use either A or B form when n = m + 1 (since both A and B form require 2 operations), and use B form when n > m + 1 (since form B will use only 2 operations, whereas form a will use at least 3 operations)
*/