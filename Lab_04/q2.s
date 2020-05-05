.data

newLine: .asciiz"\n"
maximum: .asciiz"Maximum value is : "
.align 2
intArray: .space 40
Prompt:  .asciiz"Enter Integer : "
minimun: .asciiz"Minimum value is : "
.text
.globl main
main:

la $t0, intArray # $t0 contains base address of Array

li $t3, 0 # loop counter

forLoop: 

blt $t3, 10 Process

b main1 # main1 is just a tag for maintaning flow of Program

Process:

#Prompting 
li $v0, 4
la $a0, Prompt
syscall


#Taking input
li $v0, 5
syscall
move $t2, $v0 # $t2-> User Entered Values Stored in this Register

sw $t2, ($t0) # Initializing Elements of Array

add $t0, $t0, 4 #To Access next element
add $t3, $t3, 1 # Incrementing Counter

b forLoop

# Flow
main1:

la $t0, intArray

li $t3, 0 # loop counter for inner loop
li $t4, 0 # loop counter for outer loop 

outerLoop:

blt $t4, 10, innerLoop

b main2
 
innerLoop:

blt $t3, 9, Condition #size -1 

add $t4, $t4, 1
b outerLoop



Condition:

lw $t6, ($t0)  # $t6 is like array[counter]
add $t0, $t0, 4
lw $t7, ($t0)  # $t7 is like array[counter+1]

bgt $t6, $t7 Swap

add $t3, $t3, 1
b innerLoop

Swap:
add $t6, $t6, $t7
sub $t7, $t6, $t7
sub $t6, $t6, $t7
	

sub $t0,  $t0, 4
sw  $t6, ($t0)
add $t0,  $t0, 4
sw  $t7,  ($t0)

add $t3, $t3, 1
b innerLoop

main2:

la $t0, intArray

# For Maximum Value
add $t0, $t0, 36  

lw $t9, ($t0)

li $v0, 4
la $a0, maximum
syscall

li $v0, 1
move $a0, $t9
syscall

li $v0, 4
la $a0, newLine
syscall


#For Minimum Value
la $t0, intArray

lw $t4, ($t0)

li $v0, 4
la $a0, minimun
syscall


li $v0, 1
move $a0, $t4
syscall

#Exit

li $v0, 10
syscall