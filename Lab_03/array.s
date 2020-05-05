.data

newLine: .asciiz"\n"
.align 2
XMAN: .space 20 
input: .asciiz"Enter Element : "
Prompt: .asciiz"Array ELements are\n"

.text
.globl main
main:

la $t0, XMAN

li $t3, 0 # loop counter=0
FOR:

blt $t3, 5, Process

#Printing Elements

li $v0, 4
la $a0, Prompt
syscall

li $t3, 0 # loop counter=0
la $t0, XMAN
loop:

blt $t3, 5, Print

#Exit code
li $v0, 10
syscall

Process:

li $v0, 4
la $a0, input
syscall

#Taking input 
li $v0, 5
syscall 
move $t1, $v0

sw $t1, ($t0) #Initializing  Array

add $t0, $t0, 4
add $t3, $t3, 1 #Incrementing Counter i++

b FOR

Print:

lw $t5, ($t0)

li $v0, 1
move $a0, $t5
syscall

li $v0, 4
la $a0, newLine
syscall

add $t3, $t3, 1
add $t0, $t0, 4

b loop