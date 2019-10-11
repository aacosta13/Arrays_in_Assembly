// Using C, C++, and Assembly to work with Arrays - Assignment 4
// Main module
// Armando Acosta
// CPSC 240-03

// Compile: gcc -c -m64 -Wall -fno-pie -no-pie -o display.o display_module.c

#include <stdio.h>

void display(long *numbers, long size) {
	printf("The number(s) you entered were:\n");

	for (int i = 0; i < size; i++) {
		printf("%ld", *numbers);
		numbers++;
		printf(" ");
	}
}

