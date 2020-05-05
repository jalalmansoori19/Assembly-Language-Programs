.data

Prompt: .asciiz"Enter an odd integer as the height : "
newLine: .asciiz"\n"

.text
.globl main
main:

#Prompt
li $v0, 4
la $a0, Prompt
syscall

#Taking Value from User
li $v0, 5
syscall
move $t0, $v0 #$t0->ht

#temp 
li $t2, 2

#remainder
div $t0, $t2 
mfhi $t1

#Input Validation
ble $t0, 0,Exit 

beq $t1, 0 Exit

b main2

Exit:

li $v0, 10
syscall  


main2:

#AsCII Value of *
li $t5, 42

#AsCII Value of Space
li $t6, 32

# $t3->r
li $t3, 1
# $t4->c
li $t4, 1
#temp
li $t7, 0

OuterLoop:

ble $t3, $t0, InnerLoop

#Prgram Exit
li $v0, 10
syscall

InnerLoop:
ble $t4, $t0, IF

li $t4, 1

add $t3, $t3, 1

#newLine
li $v0, 4
la $a0, newLine
syscall

b OuterLoop

IF:

#Condition 1
beq $t4, $t3, Print

#operation for (ht+1 - r)
add $t7, $t0, 1
sub $t7, $t7, $t3


#Condition 2
beq $t4, $t7, Print

Else:


li $v0, 11
move $a0, $t6
syscall

add $t4, $t4, 1

b InnerLoop

Print:

li $v0, 11
move $a0, $t5
syscall

add $t4, $t4, 1

b InnerLoop
















