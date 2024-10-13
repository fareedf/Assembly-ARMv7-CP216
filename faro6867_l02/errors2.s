/*
-------------------------------------------------------
l02_t02.s
-------------------------------------------------------
Author: Fareed Farooq
ID: 169026867
Email: faro6867@mylaurier.ca
Date: 2024-02-03
-------------------------------------------------------
Assign to and add contents of registers.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

// Copy data from memory to registers
ldr r3, =First
ldr r0, [r3]
ldr r3, =Second
ldr r1, [r3]
// Perform arithmetic and store results in memory
add r2, r0, r1
ldr r3, =Total
str r2, [r3]
// Subtract Second from First
sub r2, r0, r1
ldr r3, =Diff
str r2, [r3]
// End program
_stop:
b _stop

.data // Initialized data section
First:
.word 4
Second:
.word 8
.bss // Uninitialized data section
Total:
.space 4 // Set aside 4 bytes for total
Diff:
.space 4 // Set aside 4 bytes for difference

.end