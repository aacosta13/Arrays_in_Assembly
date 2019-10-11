#/bin/bash

#Author: A. Acosta
#Assignment 4
#Shell script
#CPSC 240-03

rm *.o

rm *.out

echo "Compile main_module.c."
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main_module.c

echo "Assemble control.asm."
nasm -f elf64 -l conasm.lis -o ctrl.asm control.asm

echo "Compile fill_module.cpp."
g++ -c -m64 -Wall -fno-pie -no-pie -o fill.o fill_module.cpp

echo "Compile display_module.c."
gcc -c -m64 -Wall -fno-pie -no-pie -o display.o display_module.c

echo "Assemble sum.asm."
nasm -f elf64 -l sumasm.lis -o sumobj.asm sum.asm

echo "Link all files."
g++ -m64 -Wall -fno-pie -no-pie -o final.out main.o ctrl.asm fill.o display.o sumobj.asm

echo "Run this program"
./final.out

echo "Goodbye"

