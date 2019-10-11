;Using C, C++, and Assembly to work with Arrays - Assignment 4
;Sum module
;Armando Acosta
;CPSC 240-03

;Assemble: nasm -f elf64 -l sumasm.lis -o sumobj.asm sum.asm

global sumfunc
extern controlfunc
extern printf
extern numbers

segment .data

segment .bss

segment .text
sumfunc:
;Set r10 to be sum register, r9 as counter, r11 as placeholder
mov r13, rdi
mov r14, rsi
mov r10, 0
mov r9, 0

sumloop:
mov r11, [r13+r9*8]
add rax, r11
inc r9
cmp r9, r14
je continue
jmp sumloop

continue:

ret

