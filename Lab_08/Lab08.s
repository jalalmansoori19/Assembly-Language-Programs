.data

msg1: 		.asciiz"Enter an integer : "
msg2:		.asciiz"Enter another integer : "

.text
.globl main
main:

#Prompt for msg1
li $v0, 4
la $a0, msg1
syscall

#Input for msg1
li $v0, 5
syscall
move $t0, $v0 #$t0->integer

#Prompt for msg2
li $v0, 4
la $a0, msg2 
syscall

#Input for msg2
li $v0, 5
syscall
move $t1, $v0 #$t1->another integer

#Loop counter $t3
li $t3, 1
#sum
li $a2, 0

#For Character
li $t4, 88
li $t5, 61

jal multiply

li $v0, 1
move $a0, $t0
syscall

#Printing multiplication Character X
li $v0, 11
move $a0, $t4
syscall

li $v0, 1
move $a0, $t1
syscall

#Printing equals to Character =
li $v0, 11
move $a0, $t5
syscall

#Result
li $v0, 1
move $a0, $a2
syscall

#Exit code
li $v0, 10
syscall

multiply:

Loop:

ble $t3, $t1, Process

#Return Result
jr $ra

Process:

add $a2, $a2, $t0

# Updating Loop Counter
add $t3, $t3, 1

b Loop 