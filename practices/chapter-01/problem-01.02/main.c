/*
The marketing department at your company has promised your customers that the next software release will show a 2x performance improvement. You have been assigned the task of delivering on that promise. You have determined that only 80% of the system can be improved. How much (i.e., what value of k) would you need to improve this part to meet the overall performance target?
*/

#include <stdio.h>

int main() {
    /* Workthrough
    
    - via amdahl's law, we need to calculate k which results in S being 2, with:
        S = 1 / (1 - alpha) + (alpha / k)
        k = alpha / [(1 / S) - (1 - alpha)] <- (from problem 1.1 B)
    */

    float S = 2.0;
    float alpha = 0.8;

    float k = alpha / ((1.0 / S) - (1 - alpha));
    printf("the k should be: %lf\n", k);

    return 0;
}