#!/bin/bash

echo "Assemble X86 source code"
nasm -f elf64 -o director.o director.asm

echo "link the X86 assembled code"
ld  -o pure-assembly.out director.o

echo "Run the executable file"
./pure-assembly.out