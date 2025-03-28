# /bin/bash

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

echo "Assemble the source file executive.asm"
nasm -f elf64 -o executive.o executive.asm

echo "Compile the source file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o -std=c2x -o main.o -c main.c 

echo "Link the object modules to create an executable file"
gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -std=c2x -o learn.out executive.o main.o -lm

echo "Execute the program"
chmod +x learn.out
./learn.out

echo "This bash script will now terminate."