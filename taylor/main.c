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

extern unsigned long series();

int main(int argc, const char *argv[])
{
    printf("\nWelcome to Taylor Series programmed by Code Goblin.\n");

    unsigned long tics = series();

    // Convert this code block into assembly and put it in series.asm
    // Ask the user for cpu frequency instead of assuming it is 3Ghz
    double cpufrequency = 3 * 1e9; // 3Ghz = 3 * 10^9 hz = 3 000 000 000 hz
    double seconds = tics * 1 / cpufrequency;
    double nanoseconds = seconds * 1e9; // 1 nanosecond = 1e9 seconds
    printf("Elapsed nanoseconds = %lf", nanoseconds);

    printf("\n\nAn integer zero will now be sent to the operating system. Bye\n");
}