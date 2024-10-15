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

echo "Compile the source file main.c"
gcc  -m64 -Wall -no-pie -o main.o -std=c2x -c main.c

echo "Assemble the source file manager.asm"
nasm -f elf64 -o manager.o manager.asm

echo "Assemble the source file input_array.asm"
nasm -f elf64 -o input_array.o input_array.asm

echo "Compile the source file sort.c"
gcc  -m64 -Wall -no-pie -o sort.o -std=c2x -c sort.c

echo "Assemble the source file sum.asm"
nasm -f elf64 -o sum.o sum.asm

echo "Assemble the source file output_array.asm"
nasm -f elf64 -o output_array.o output_array.asm

echo "Assemble the source file isinteger.asm"
nasm -f elf64 -l isinteger.lis -o isinteger.o isinteger.asm

echo "Link the object modules to create an executable file"
gcc -m64 -no-pie -o learn.out sort.o sum.o input_array.o output_array.o manager.o main.o isinteger.o -std=c2x -Wall -z noexecstack -lm

echo "Execute the program"
chmod +x learn.out
./learn.out

echo "This bash script will now terminate."