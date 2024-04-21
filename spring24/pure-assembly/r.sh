#!/bin/bash

nasm -f elf64 -o director.o director.asm

nasm -f elf64 -o strlen.o strlen.asm

nasm -f elf64 -o fputs.o fputs.asm

nasm -f elf64 -o fgets.o fgets.asm

nasm -f elf64 -o atof.o atof.asm

echo "Link the X86 assembled code"
ld  -o pure-assembly.out director.o strlen.o fputs.o fgets.o atof.o -g

echo "Run the executable file"
./pure-assembly.out

rm *.o
rm *.out