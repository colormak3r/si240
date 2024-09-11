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

extern void makepizza();
extern int checkpassword(int password);
extern void ingredients(
    int count1, const char *ing1,
    int count2, const char *ing2,
    int count3, const char *ing3);

int main()
{
    printf("Let's make some pizzaaaaaa\n");

    // ingredients(8,"Peperonies",6,"Pineapples",100,"Olives");
    //  Call assembly function makepizza
    makepizza();

    // Prompt the user for password
    printf("Plase enter the password: ");
    int password = -1;
    scanf("%d", &password);

    // Validate the password
    int validate = checkpassword(password);
    if (validate == 1)
    {
        printf("This is the best pizza ever!!!!\n");
    }
    else
    {
        printf("No pizza for you!!");
    }

    return 0;
}

// A function to print a list of ingredients and its count
void ingredients(int count1, const char *ing1,
                 int count2, const char *ing2,
                 int count3, const char *ing3)
{
    printf("Ingredients:\n");
    printf("%d %s\n%d %s\n%d %s\n", count1, ing1,
           count2, ing2, count3, ing3);
}