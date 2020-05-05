.data

myArray: .word 11, 12, 13, 14, 15
newLine: .asciiz"\n"

.text
.globl main
main:

la $t0, myArray

li $t3, 0 # loop Counter 

FOR:

blt $t3, 5, Process

#Exit code
li $v0, 10
syscall

Process:

lw $t2, ($t0)

mul $t2, $t2, 10

li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, newLine
syscall

add $t3, $t3, 1 # incrementing Counter
add $t0, $t0, 4

b FOR