.data

msg1: .asciiz"Enter a Positive integer : "
msg2: .asciiz"Sum =  "

.text
.globl main
main:

#Printing msg1
li $v0, 4
la $a0, msg1
syscall

#Taking Input From User
li $v0, 5
syscall
move $t0, $v0

li $t1, 1
For:

ble $t1, $t0, Process

#Printing Sum
li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t2
syscall

#Exit Code
li $v0, 10
syscall

Process:

add $t2, $t2, $t1
add $t1, $t1, 1
b For

