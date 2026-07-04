/* 
Suppose you work as a truck driver, and you have been hired to carry a load of potatoes from Boise, Idaho, to Minneapolis, Minnesota, a total distance of 2,500 kilometers. You estimate you can average 100 km/hr driving within the speed limits, requiring a total of 25 hours for the trip. 

    A. You hear on the news that Montana has just abolished its speed limit, which constitutes 1500km of the trip. your truck can travel at 150 km/hr. What will be your speedup for the trip?

    B. You can buy a new turbocharger your truck at www.fasttrucks.com. They stock a variety of models, but the faster you want to go, the more it will cost. How fast must 'you travel through Montana to get an overall speedup for your trip of 1.67 X? 
*/

#include <stdio.h>

int main() {
    /* A workthrough:
        
    - 1500km is 3/5th of the entire distance. so an increase of speed over this stretch will constitute to a change for 60% of the total distance.

    - the max speed in this 1500km stretch is 150km/hr, disregarding any impacts of fuel, the old time to go through this stretch is 15 hours, the new time is 10 hours. this means that the speed improvement is 15/10, which is 1.5 x

    - using amdahl's law, we can get that the new time as such:
        t_new = t_old * [(1 - alpha) + alpha / k]

    - which gets us the equation for speedup as such:
        t_old / t_new = 1 / [(1 - alpha) + alpha / k] = S
    */

    double A_t_old = 25.0;
    double A_alpha = 0.6;
    double A_k = 1.5;

    double A_S = 1.0 / ((1.0 - A_alpha) + A_alpha / A_k);
    printf("A. S: %lf\n", A_S);

    /* A solution:

    - the speedup is 1.25 x
    */



    /* B workthrough:

    - from A we already know the equation of t_new:
        t_old / t_new = 1 / [(1 - alpha) + alpha / k] = S
    
    - lets just change the unknowns a bit, now we dont know k. 1.67 is the same as 5/3:
        S = 1 / [(1 - alpha) + alpha / k]
        (1 - alpha) + alpha / k = 1 / S
        alpha / k = (1 / S) - (1 - alpha)
        1 / k = [(1 / S) - (1 - alpha)] / alpha
        k = alpha / [(1 / S) - (1 - alpha)]
    */

    double B_alpha = 3.0 / 5.0;
    double B_S = 5.0 / 3.0;
    double B_old_kmhr = 100.0;

    double B_k = B_alpha / ((1.0 / B_S) - (1.0 - B_alpha));
    double B_new_kmhr = B_k * B_old_kmhr;
    printf("B. k           : %lf\n", B_k);
    printf("   speed needed: %lfkm/hr\n", B_new_kmhr);

    /* B solution:

    - the needed speedup for 1.67 x speedup is 300km/hr
    */

    return 0;
}