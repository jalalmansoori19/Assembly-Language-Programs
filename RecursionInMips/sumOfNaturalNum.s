.data

Prompt:		.asciiz"Enter a Positive Integer : "
Sum:		.asciiz"Sum is : "

.text
.globl main
main:

#Prompt
li $v0, 4
la $a0, Prompt
syscall

#Input from User
li $v0, 5
syscall

move $t0, $v0 #User's Value is in $t0

jal calculateSum

#Printing Sum
li $v0, 4
la $a0, Sum
syscall

li $v0, 1
move $a0, $s0
syscall

#Exit
li $v0, 10
syscall


calculateSum:

#moving Up Stack Pointer
sub $sp, $sp, 4
sw $ra, ($sp)

#Base Case
beq $t0, 0, BaseCase

add $s0, $s0, $t0
sub $t0, $t0, 1

jal calculateSum

BaseCase:

#Poping addresses from stack
lw, $ra, ($sp)
add $sp, $sp, 4

jr $ra

