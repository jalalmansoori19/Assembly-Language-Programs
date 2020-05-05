.data

#Declaring Array of Size 5
myArray: .space 20

Prompt: .asciiz"Enter Number : "
newLine: .asciiz"\n"
reverseOrder: .asciiz"ELements In REVERSE ORDER\n"

.text
.globl main
main:

#Storing base Address in $t0
la $t0, myArray

#Loop counter
li $t3, 0

forLoop:

blt $t3, 5, takeInput

la $t0, myArray
b Process

takeInput:

#Prompting
li $v0, 4
la $a0, Prompt
syscall

#Input From User
li $v0, 5
syscall
move $t2, $v0

#Initializing Elements in Array using $t2
sw $t2, ($t0)

#Incrementing for Accessing Next Element
add $t0, $t0, 4
#Incrementing Loop Counter
add $t3, $t3, 1

b forLoop

Process:

lw $t1, ($t0)

add $t0, $t0, 16

lw $t2, ($t0)

#Swapping for Reverse Order 1st and Last Element
add $t1, $t1, $t2 
sub $t2, $t1, $t2
sub $t1, $t1, $t2


#Subtracting to get Address of 1st Element
sub $t0, $t0, 16
#Storing Element after Swapping
sw $t1, ($t0)
#adding to get Address of last Element
add $t0, $t0, 16
sw $t2, ($t0)


#Subtracting to get Address of 1st Element
sub $t0, $t0, 12
lw $t1, ($t0)

#adding to get Address of 2nd last Element
add $t0, $t0, 8
lw $t2, ($t0)

#Swapping for Reverse Order 2nd and SecondLast Element
add $t1, $t1, $t2 
sub $t2, $t1, $t2
sub $t1, $t1, $t2

#Subtracting to get address of 2nd Element
sub $t0, $t0, 8
#Storing Element after Swapping
sw $t1, ($t0)

#add to get address of 2nd last Element
add $t0, $t0, 8
#Storing Element after Swapping
sw $t2, ($t0)


la $t0, myArray
li $t3, 0

li $v0, 4
la $a0, reverseOrder
syscall

forLoop2:

blt $t3, 5 Print

#Exit code
li $v0, 10
syscall

Print:

lw $t2, ($t0)

li $v0, 1
move $a0, $t2
syscall

#newLine
li $v0, 4
la $a0, newLine
syscall

add $t0, $t0, 4
add $t3, $t3, 1

b forLoop2