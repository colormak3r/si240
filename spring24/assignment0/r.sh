#/bin/bash

#Program name "Begin Assembly"
#Author: F. Holliday
#This file is the script file that accompanies the "Begin Assembly" program.
#Prepare for execution in normal mode (not gdb mode).

#Delete some un-needed files
rm *.o
rm *.out

echo "Assemble the source file helloworld.asm"
nasm -f elf64 -l hello.lis -o hello.o helloworld.asm

echo "Compile the source file beginhere.c"
gcc  -m64 -Wall -no-pie -o begin.o -std=c2x -c beginhere.c

echo "Link the object modules to create an executable file"
gcc -m64 -no-pie -o learn.out hello.o begin.o -std=c2x -Wall -z noexecstack

echo "Execute the program that new students use to understand assembly programming"
chmod +x learn.out
./learn.out

echo "This bash script will now terminate."
