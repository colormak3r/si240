#!/bin/bash

#Author: Khoa Nguyen

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file hello.asm"
nasm -f elf64 -l hello.lis -o hello.o hello.asm

echo "Compile the C++ file welcome.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -l welcome.lis -o welcome.o welcome.cpp -std=c++2a

echo "Link the two 'O' files welcome.o hello.o"
g++ -m64 -std=c++2a -o go.out hello.o welcome.o -fno-pie -no-pie
#Note: "c++2a" is an early release of the "c++20" compiler.  
#When the compiler c++20 becomes available then replace "c++2a" with "c++20".

echo "Next the program ""String I/O"" will run"
./go.out