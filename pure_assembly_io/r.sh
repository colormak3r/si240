#!/bin/bash

nasm -f elf64 -o assembly.o assembly.asm

ld -o a.out assembly.o -g

echo "Run the executable file"
./a.out

rm *.o
rm *.out