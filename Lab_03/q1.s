.data

msg1: .asciiz"\nEnter Number : "
msg2: .asciiz"\nNumber Entered : "
msg3: .asciiz"\nProgram Finished  "

.text
.globl main
main:

li $t1, 1

#While Loop

whileLoop:

bne $t1, 0, Process

li $v0, 4
la $a0, msg3
syscall

#Exit Code
li $v0, 10
syscall

Process:

#Taking Input From User

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t1, $v0

#Printing Number User Entered

li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t1
syscall

b whileLoop