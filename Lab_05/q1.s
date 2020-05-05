.data

Prompt: .asciiz"Enter a Integer : "
seriesSum: .asciiz"Sum of Series is : "
invalid: .asciiz"Invalid integer for Sum of Series"

.text
.globl main
main:

#Prompt
li $v0, 4
la $a0, Prompt
syscall

#Input 
li $v0, 5
syscall
move $t0, $v0 #Input Value is in $t0

#Temporary Variable
li $t1, 0
li $t2, 1

beq $t0, 1 Print

blt $t0, 1 NotValid

b OuterLoop

NotValid:

li $v0, 4
la $a0, invalid 
syscall

li $v0, 10
syscall

Print:

li $v0, 4
la $a0, seriesSum
syscall

li $v0, 1
move $a0, $t2
syscall

li $v0, 10
syscall

OuterLoop:

sub $t0, $t0, 1
li $t3, 1


bne $t0, 1 innerLoop

#Prompt for Sum of series
li $v0, 4
la $a0, seriesSum
syscall

add $t5, $t5, 2

li $v0, 1
move $a0, $t5
syscall

li $v0, 10
syscall


innerLoop:

ble $t3, $t0, Power

#For Sum of Series
add $t5, $t5, $t2

li $t2, 1

b OuterLoop

Power:

mul $t2, $t2, $t0

add $t3, $t3, 1

b innerLoop

