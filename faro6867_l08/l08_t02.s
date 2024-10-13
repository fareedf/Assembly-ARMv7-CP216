/*
-------------------------------------------------------
l08_t02.s
-------------------------------------------------------
Author: Fareed Farooq
ID: 169026867
Email: faro6867@mylaurier.ca
Date:    2024-03-30
-------------------------------------------------------
Uses a subroutine to read strings from the UART into memory.
-------------------------------------------------------
*/
// Constants
.equ SIZE, 20 // Size of string buffer storage (bytes)

.org 0x1000   // Start at memory location 1000
.text         // Code section
.global _start
_start:

//=======================================================

// your code here

ldr r5, =SIZE

//=======================================================

ldr    r4, =First
bl    ReadString
//ldr    r4, =Second
//bl    ReadString
//ldr    r4, =Third
//bl     ReadString
//ldr    r4, =Last
//bl     ReadString

_stop:
b _stop

// Subroutine constants
.equ UART_BASE, 0xff201000  // UART base address
.equ ENTER, 0x0A            // The enter key code
.equ VALID, 0x8000          // Valid data in UART mask

ReadString:
/*
-------------------------------------------------------
Reads an ENTER terminated string from the UART.
-------------------------------------------------------
Parameters:
  r4 - address of string buffer
  r5 - size of string buffer
Uses:
  r0 - holds character to print
  r1 - address of UART
-------------------------------------------------------
*/
//=======================================================
// your code here
stmfd sp!, {r0, r1, r4, r5}     
ldr   r1, =UART_BASE        

//add r5, r5, r4

LOOP:
ldr  r0, [r1]      
tst  r0, #VALID    
beq  _ReadString   

cmp r5, #0
beq _ReadString
and  r0, r0, #0xFF 
cmp  r0, #ENTER 
beq _ReadString

sub r5, r5, #1

strb r0, [r4]      
add  r4, r4, #1  

b    LOOP

_ReadString:
ldmfd sp!, {r0, r1, r4, r5}     

//=======================================================
bx    lr                    // return from subroutine

.data
.align
// The list of strings
First:
.space  SIZE
Second:
.space SIZE
Third:
.space SIZE
Last:
.space SIZE
_Last:    // End of list address

.end