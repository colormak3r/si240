#/bin/bash

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
# along with this program.  If not, see <https://www.gnu.org/licenses/>. 

# Author information
#   Author name : Code Goblin
#   Author email: instalock_caitlyn@bronze2.botlane
#   Author section: 240-99
#   Author CWID : 000000000

# For research purpose only. Please don't copy word for word. Avoid academic dishonesty. 

echo "Assemble the source file valid_stack.asm"
nasm -f elf64 -l valid_stack.lis -o valid_stack.o valid_stack.asm

echo "Assemble the source file isfloat.asm"
nasm -f elf64 -l isfloat.lis -o isfloat.o isfloat.asm

echo "Compile the source file driver.c"
gcc  -m64 -Wall -no-pie -o driver.o -std=c2x -c driver.c

echo "Link the object modules to create an executable file"
gcc -m64 -no-pie -o learn.out isfloat.o valid_stack.o driver.o -std=c2x -Wall -z noexecstack -lm

echo "Execute the program"
chmod +x learn.out

# Uncomment the second line and comment out the first line to test output
./learn.out
# echo -e "Code Goblin\e\nADC\e\n15.7\n42.6\n19.2\n53.9\n28.2\n64.9\n" | ./learn.out

echo "This bash script will now terminate."
