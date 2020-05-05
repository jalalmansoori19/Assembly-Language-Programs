.data

numerator:		.asciiz"Enter Numerator : "
denominator:	.asciiz"Enter Denominator : "
quotient:		.asciiz"Quotient : "

.text
.globl main
main:

#Prompting for numerator
li $v0, 4
la $a0, numerator
syscall

#Input part for numerator
li $v0, 5
syscall

move $t0, $v0 #$t0->numerator

#Prompting for denominator
li $v0, 4
la $a0, denominator
syscall

#Input part for denominator
li $v0, 5
syscall

move $t1, $v0 #$t1->denominator

#temp Register
li $s0, 0
li $s1, 0

sub $s1, $t0, $t1

jal calculateQuotient

#Prompting for quotient
li $v0, 4
la $a0, quotient
syscall

#Printing Result
li $v0, 1
move $a0, $s0
syscall

#Exit
li $v0, 10
syscall

calculateQuotient:

#moving up Stack Pointer
sub $sp, $sp, 4
sw  $ra, ($sp)

#Base Case
blt $s1, 0, BaseCase

add $s0, $s0, 1
sub $s1, $s1, $t1

jal calculateQuotient

BaseCase:
lw $ra, ($sp)
add $sp, $sp, 4

jr $ra








