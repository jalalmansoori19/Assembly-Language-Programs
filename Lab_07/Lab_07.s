.data

num1: 		.asciiz"Enter 1st Number : "
num2: 		.asciiz"Enter 2nd Number : "
operation: 	.asciiz"Enter Operation to Perform : "
invalid: 	.asciiz"Invalid Operation Number\n"

.text
.globl main
main:

#Prompt for num1
li $v0, 4
la $a0, num1
syscall

#Input for num1
li $v0, 5
syscall

move $a1, $v0 # $a1->num1

#Prompt for num2
li $v0, 4
la $a0, num2
syscall

#Input for num2
li $v0, 5
syscall

move $a2, $v0 # $a2->num2

#Prompt for Operation
li $v0, 4
la $a0, operation
syscall

#Input for operation
li $v0, 5
syscall

move $t0, $v0 # $t0->operation

beq $t0, 1, function1
beq $t0, 2, function2
beq $t0, 3, function3
beq $t0, 4, function4

#Invalid Operation Number
li $v0, 4
la $a0, invalid
syscall

#Exit
li $v0, 10
syscall

function1:

#addition Character
li $t4, 43
#equal character
li $t3, 61

jal addition

#num1
li $v0, 1
move $a0, $a1
syscall

#addition character
li $v0, 11
move $a0, $t4
syscall

#num2
li $v0, 1
move $a0, $a2
syscall

#equal character
li $v0, 11
move $a0, $t3
syscall

#result
li $v0, 1
move $a0, $v1
syscall

#Exit code
li $v0, 10
syscall


addition:

add $v1, $a1, $a2

jr $ra

function2:
#subtraction character
li $t4, 45
#equal character
li $t3, 61
jal subtraction

#num1
li $v0, 1
move $a0, $a1
syscall

#subtraction character
li $v0, 11
move $a0, $t4
syscall

#num2
li $v0, 1
move $a0, $a2
syscall

#equal character
li $v0, 11
move $a0, $t3
syscall

#result
li $v0, 1
move $a0, $v1
syscall

#Exit code
li $v0, 10
syscall


subtraction:

sub $v1, $a1, $a2

jr $ra

function3:

#multiplication character
li $t4, 42
#equal character
li $t3, 61

jal multiplication

#num1
li $v0, 1
move $a0, $a1
syscall

#multiplication character
li $v0, 11
move $a0, $t4
syscall

#num2
li $v0, 1
move $a0, $a2
syscall

#equal character
li $v0, 11
move $a0, $t3
syscall

#result
li $v0, 1
move $a0, $v1
syscall

#Exit code
li $v0, 10
syscall


multiplication:

mul $v1, $a1, $a2

jr $ra

function4:

#division character
li $t4, 47
#equal character
li $t3, 61


jal division

#num1
li $v0, 1
move $a0, $a1
syscall

#division character
li $v0, 11
move $a0, $t4
syscall

#num2
li $v0, 1
move $a0, $a2
syscall

#equal character
li $v0, 11
move $a0, $t3
syscall

#result
li $v0, 1
move $a0, $v1
syscall

#Exit code
li $v0, 10
syscall

division:

div $v1, $a1, $a2
jr $ra
