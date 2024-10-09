// Program name: "Program Name". A short description of the purpose of the program
// Copyright (C) <2023>  <Your Name>

// This file is part of the software program "Program Name".

// "Program Name" is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// "Program Name" is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Author information
//   Author name : Code Goblin
//   Author email: instalock_caitlyn@bronze2.botlane
//   Author section: 240-99
//   Author CWID : 000000000

// For research purpose only. Please don't copy word for word. Avoid academic dishonesty.

#include <stdio.h>
#include <math.h>

extern int input_array(int nice_array[], int max_size);
extern void output_array(int nice_array[], int count);
extern int sum(int nice_array[], int count);
extern void sort(int nice_array[], int count);

char *manager()
{
    // Get the user name
    printf("\nPlease enter your name: ");
    static char name[99];       // declare name static (similiar to declare name in .data)
    fgets(name, 99, stdin);

    // Introduction
    printf("\nThis program will sum your array of integers\n");
    printf("Enter a sequence of long integers separated by white space.\n");
    printf("After the last input press enter followed by Control+D:\n");

    // Get the user inputs
    int max_size = 15;
    int nice_array[max_size];
    int count = input_array(nice_array, max_size);

    // Print out the user inputs
    printf("\nThese number were received and placed into the array:\n");
    output_array(nice_array, count);

    // Get the sum and print out the result
    int s = sum(nice_array, count);
    printf("\n\nThe sum of the %d numbers in this array is %d.\n", count, s);

    // Sort and print out the sorted array
    sort(nice_array, count);
    printf("\nThis is the sorted array\n");
    output_array(nice_array, count);

    printf("\n\nThis program will return execution to the main function.\n");

    return name;
}