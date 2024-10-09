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
#   Author name : Code Goblin
#   Author email: instalock_caitlyn@bronze2.botlane
#   Author section: 240-99
#   Author CWID : 000000000

# For research purpose only. Please don't copy word for word. Avoid academic dishonesty. 

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file oven.asm"
nasm -f elf64 -l oven.lis -o oven.o oven.asm

# Note: We are using the C compiler gcc for this program
echo "Compile the C file pizza.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o pizza.o pizza.c

echo "Link the two 'O' files pizza.o oven.o"
gcc -m64 -o go.out oven.o pizza.o -fno-pie -no-pie

echo "Next the program ""Pizza"" will run"
./go.out