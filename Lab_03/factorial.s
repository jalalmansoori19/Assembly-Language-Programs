.data

msg1: .asciiz"Enter a Number : "
msg2: .asciiz"Factorial : "


.text
.globl main
main:

#Printing msg1
li $v0, 4
la $a0, msg1
syscall

#Taking input from user

li $v0, 5
syscall
move $t0, $v0 #t0 is User Entered Value

li $t1, 1

bne $t0, 0 While 

li $t4, 1

li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t4
syscall
 
#Exit Code
li $v0, 10
syscall

While:

bne $t0, 1 Process

li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t1
syscall
 
#Exit Code
li $v0, 10
syscall


Process:

mul $t1, $t1, $t0
sub $t0, $t0, 1

b While 



