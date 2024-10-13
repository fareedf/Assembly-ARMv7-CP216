/*
-------------------------------------------------------
l04_t03.s
-------------------------------------------------------
Author:  Fareed Farooq
ID:      169026867
Email:   faro6867@wlu.ca
Date:    2024-03-02
-------------------------------------------------------
A simple list demo program. Traverses all elements of an integer list.
r0: temp storage of value in list
r2: address of start of list
r3: address of end of list
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

ldr    r2, =Data    // Store address of start of list
ldr    r3, =_Data   // Store address of end of list
ldr r6, [r2] // Minimum value in list
ldr r7, [r2] // Maximum value in list

Loop:
ldr    r0, [r2], #4 // Read address with post-increment (r0 = *r2, r2 += 4)
cmp    r6, r0
bgt    minimum
cmp    r7, r0
blt    maximum
continue:
cmp    r3, r2       // Compare current address with end of list
bne    Loop         // If not at end, continue

_stop:
b _stop

minimum:
mov r6, r0

bal continue

maximum:
mov r7, r0

bal continue

.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end
	