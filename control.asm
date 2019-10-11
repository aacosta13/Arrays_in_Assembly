;Using C, C++, and Assembly to work with Arrays - Assignment 4
;Control module
;Armando Acosta
;CPSC 240-03

;Assemble: nasm -f elf64 -l conasm.lis -o ctrl.asm control.asm

global controlfunc
extern fill
extern display
extern printf
extern scanf
extern getchar
extern sumfunc

segment .data
emptyline db " ",10,0
intro db "This program uses various modules using asm, c, and c++ to store values into an array and add said values to get their sum.",10,0
readyprompt db "Are you ready? Press 'c' to continue or 'x' to exit.",10,0
correctnumbers db "Are these numbers correct? (y/n)",10,0
decimalsum db "The sum of the numbers in decimal format is %ld.",10,0

segment .bss
numbers resq 0
align 16

segment .text
controlfunc:
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf

;Print empty line for easier visibility
mov rax, 0
mov rdi, emptyline
call printf

;Introduction
mov rax, 0
mov rdi, intro
call printf

;Ask user if they're ready
mov rax, 0
mov rdi, readyprompt
call printf
call getchar

;Check response
responsecheck:
cmp rax, 'c'
je begin
cmp rax, 'x'
je leave

;If not c or x, keep waiting until proper response
mov rax, 0
call getchar
jmp responsecheck

begin:
mov rax, 0
mov rdi, emptyline
call printf

;Fill array up here, save size to r14, array to r13
fillcall:
mov rax, 0
mov rdi, numbers
mov rsi, 0
call fill
mov r14, rax
mov r13, numbers

;Empty lines for visibility
mov rax, 0
mov rdi, emptyline
call printf

mov rax, 0
mov rdi, emptyline
call printf

;Call display to print out numbers
mov rax, 0
mov rdi, r13
mov rsi, r14
call display

mov rax, 0
mov rdi, emptyline
call printf

;Check if numbers were correctly inputted
mov rax, 0
mov rdi, correctnumbers
call printf

mov rax, 0
call getchar
cmp rax, 'y'
je continue
jmp fillcall

;Continue on to sum function
continue:
mov rax, 0
mov rdi, r13
mov rsi, r14
call sumfunc

;Display sum
mov r15, rax
mov rdi, decimalsum
mov rsi, r15
call printf

leave:
mov rax, r15

popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp

ret

