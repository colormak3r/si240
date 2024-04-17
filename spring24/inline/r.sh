#!/bin/bash

gcc -m64 -no-pie -o inline.out inline.c -s

./inline.out