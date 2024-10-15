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

extern char *manager();

int main(int argc, const char *argv[])
{
    printf("\nWelcome to Marvelous Arrays\n");
    printf("Bought to you by Code Goblin\n");

    char *name = manager();

    printf("\nI hope you liked your arrays %s\n", name);
    printf("Main will return 0 to the operating system. Bye.\n");
}