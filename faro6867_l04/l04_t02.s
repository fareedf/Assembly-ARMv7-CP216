/*
-------------------------------------------------------
l04_t02.s
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
mov    r4, #0
mov    r5, #0


Loop:
ldr    r0, [r2], #4 // Read address with post-increment (r0 = *r2, r2 += 4)
add    r4, r4, #1	// Count
add    r5, r5, #4   // You can use MUL with count to compute this
cmp    r3, r2       // Compare current address with end of list
bne    Loop         // If not at end, continue

_stop:
b _stop

.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end
	