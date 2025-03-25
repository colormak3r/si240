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

unsigned long getTimestamp();

double num = 1.0;

int main()
{
    printf("Welcome to a great program developed by Code Goblin at instalock_caitlyn@bronze2.botlane.\n");

    unsigned long start = getTimestamp();

    // Calculate 2^100 in C
    for (size_t i = 0; i < 100; i++)
    {
        num += num;
    }

    // Equivalent code block using inline assembly
    // asm(".intel_syntax noprefix");
    // // Implement your code block here
    // asm(".att_syntax noprefix");

    unsigned long end = getTimestamp();

    // Ending sequence
    printf("Elapsed: %ld cycles\n", end - start);
    printf("Outout: %lf\n", num);
    printf("A zero will be returned to the operating system. Bye\n");

    return 0;
}

unsigned long timestamp;
unsigned long getTimestamp()
{
    asm(".intel_syntax noprefix");
    asm("xor rax, rax");
    asm("xor rdx, rdx");
    asm("cpuid");
    asm("rdtsc");
    asm("shl rdx, 32");
    asm("add rdx,rax");
    asm("mov timestamp, rdx");
    asm(".att_syntax noprefix");
    return timestamp;
}






























































































































































































































































































// Calculate 2^100 using inline assembly
// asm(".intel_syntax noprefix");
// asm("xor r15, r15");
// asm("movsd xmm0, num");
// asm("movsd xmm1, num");
// asm("startloop:");
// asm("addsd xmm0, xmm1");
// asm("movsd xmm1, xmm0");
// asm("inc r15");
// asm("cmp r15, 100");
// asm("jl startloop");
// asm("movsd num, xmm0");
// asm(".att_syntax noprefix");