// Author: Khoa Nguyen

#include "stdio.h"

double temp;

int main()
{
    printf("Welcome to a great program developed by Dang Khoa Nguyen at colormak3r@csu.fullerton.edu.\n");
    double h;
    asm("set default Intel");
    asm("rdrand rdx");
    asm("mov temp, rdx");
    asm("set default ATT");
    h = temp;
    // Ending sequence
    printf("Outout: %lf\n",h);
    printf("A zero will be returned to the operating system. Bye\n");

    return 0;
}