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