.data

msg1: .asciiz"Enter a 3 Digit Number : "
msg2: .asciiz"Square of Middle Digit Number : "

.text
.globl main

main:

# Printing msg1
li $v0, 4
la $a0, msg1
syscall

# Taking input from User
li $v0, 5
syscall
move $t0, $v0 #Users Input Stored in $t0

li $t2, 0

While:

bne $t0, 0, Process

Process:

li $t3, 10
div $t0, $t3


add $t2, $t2, 1

mfhi $s0 # For remainder
mflo $s1 # For Quotient

move $t0, $s1

beq $t2, 2 Process1

b While

Process1:

mul $s0, $s0, $s0

li $v0, 4
la $a0, msg2
syscall

li   $v0, 1
move $a0, $s0 
syscall

#Exit code 
li $v0, 10
syscall 