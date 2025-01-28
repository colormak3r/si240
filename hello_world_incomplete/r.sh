#!/bin/bash

# Program name: "Program Name". A short description of the purpose of the program
# Copyright (C) <2023>  <Your Name>

# This file is part of the software program "Program Name".

# "Program Name" is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# "Program Name" is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <hFttps://www.gnu.org/licenses/>. 

# Author information
#   Author name : Code learnblin
#   Author email: instalock_caitlyn@bronze2.botlane
#   Author section: 240-99
#   Author CWID : 000000000

# For research purpose only. Please don't copy word for word. Avoid academic dishonesty. 

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file pizza.asm, output object file pizza.o"
nasm -f elf64 -o pizza.o pizza.asm

# Note: We are using the C compiler gcc for this program
echo "Compile the C file oven.c, output object file oven.o"
gcc -c -m64 -Wall -fno-pie -no-pie -o oven.o oven.c

echo "Link the two object files oven.o and pizza.o, output executable file learn.out"
gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -lm -o learn.out pizza.o oven.o

echo "Next the program "Pizza Oven" will run"
./learn.out