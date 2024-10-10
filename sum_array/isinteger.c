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
#include <string.h>

int isdigit(char c)
{
    if (c >= '0' && c <= '9')
        return 0;
    else
        return -1;
}

int isinteger(char *string)
{
    if (string[0] != '+' &&
        string[0] != '-' &&
        isdigit(string[0]) != 0)
    {
        return -1;
    }

    int index = 1;
    int len = strlen(string)-1;
    while (index < len)
    {
        if (isdigit(string[index]) == 0)
        {
            index++;
        }
        else
        {
            return -1;
        }
    }

    return 0;
}