.data

msg1:   .asciiz"Enter 1st Number : "
msg2:   .asciiz"Enter 2nd Number : "
maxNum: .asciiz"Maximum Number : "

.text
.globl main
main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0

bgt $t0, $t1 Process

li $v0, 4
la $a0, maxNum
syscall

li $v0, 1
move $a0, $t1
syscall

#exit 
li $v0, 10
syscall



Process:

li $v0, 4
la $a0, maxNum
syscall

li $v0, 1
move $a0, $t0
syscall

#exit 
li $v0, 10
syscall
