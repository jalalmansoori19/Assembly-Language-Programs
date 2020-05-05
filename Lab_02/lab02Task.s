.data
msg1: .asciiz"Enter an integer : "
msg2: .asciiz"Square is : "

.text
.globl main
main:
# printing string

la $a0, msg1
li $v0, 4 
syscall


# to take input an Integer
li $v0, 5 # $v0 should be loaded with value 5 for taking an integer as input
syscall
move $t0, $v0 # As user provides the integer as an input then it is stored in $v

mul $t0, $t0, $t0

la $a0, msg2
li $v0, 4 
syscall
 
li $v0, 1
move $a0, $t0
syscall


li $v0, 10
syscall
