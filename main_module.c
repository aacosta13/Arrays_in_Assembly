// Using C, C++, and Assembly to work with Arrays - Assignment 4
// Main module
// Armando Acosta
// CPSC 240-03

// Compile: gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main_module.c

// Link: g++ -m64 -Wall -fno-pie -no-pie -o final.out main.o ctrl.asm fill.o display.o sum.asm

#include <stdio.h>

long controlfunc();

int main() {
	long ans = 0;

	// Introduction
	printf("Welcome to Assignment 4: Practice with Number Arrays.\n");
	printf("Made by Armando Acosta, an avid fan of multilingual programming with Assembly.\n");

	ans = controlfunc();

	printf("\nThe value of the sum received in hexadecimal is: %#018lX.", ans);
	printf("\nPlease have a very nice day, come back soon!\n");
	
	return 0;
}

