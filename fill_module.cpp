// Using C, C++, and Assembly to work with Arrays - Assignment 4
// Fill module
// Armando Acosta
// CPSC 240-03

// Compile: g++ -c -m64 -Wall -fno-pie -no-pie -o fill.o fill_module.cpp

#include <iostream>
#include <vector>

using namespace std;

extern "C" long fill(long[], long);

long fill(long numberArray[], long size) {
	cout << "Enter sequence of digits separated by white space." << endl;
	cout << "Type CTRL+D when finished." << endl;

	long input;
	vector<long> numbers;

	while (!cin.eof()) {
		cin >> input;
		numbers.push_back(input);
	}

	cin.clear();
	
	size = numbers.size();

	for (int i = 0; i < size; i++) {
		numberArray[i] = numbers[i];
	}

	return size;
}

