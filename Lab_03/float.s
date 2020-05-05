.data 

msg1: .asciiz"Enter Numerator : "
msg2: .asciiz"Enter Denomenator : "
msg3: .asciiz"Quotient  : "
msg4: .asciiz"Remainder : "
newLine: .asciiz"\n"


.text
.globl main
main:

# Printing msg1
li $v0, 4
la $a0, msg1
syscall

#Take Input For Numerator

li $v0, 5
syscall
move $t0, $v0

# Printing msg2
li $v0, 4
la $a0, msg2
syscall

#Take Input For Denomenator

li $v0, 5
syscall
move $t1, $v0

#$t0 -> Numerator and $t1 ->Denomenator

div $t0, $t1

mfhi $s0 # Remainder
mflo $s1 # Quotient

li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $s1
syscall

#newLine

li $v0, 4
la $a0, newLine
syscall

li $v0, 4
la $a0, msg4
syscall

li $v0, 1
move $a0, $s0
syscall


#Exit 
li $v0, 10
syscall