.data


charArray: .word 'D','H','A',' ','S','u','f','f','a',' '

.text
.globl main
main:

la $t0, charArray # $t0 contains base address of Array

add $t0, $t0, 36 # to get last element address of Array

li $t3, 9 # loop counter 
forLoop:

bge $t3, 0, Process

#Exit 

li $v0, 10
syscall

Process:

lw $t5, ($t0)

#Printing Characters
li   $v0,   11
move $a0,  $t5
syscall

sub $t3, $t3, 1 # decrementing counter
sub $t0, $t0, 4 # Accessing next element of array 

b forLoop