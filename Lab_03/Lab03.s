.data

msg1: .asciiz"Enter Payment : "
msg2: .asciiz"Minimum Currency Note : "

.text
.globl main
main:

#Command for Printing msg1

li $v0, 4
la $a0, msg1
syscall

#Command for Taking Input From User

li $v0, 5
syscall 
move $t0, $v0  		# Register $t0 is For Storing User Payment Value

#Note of 500
li $t1, 500
div $t2, $t0, $t1

#Fixed Number of Time Loop
li $t3, 1
forloop:

ble $t3, $t2, Process

beq $t4, $t0, Print


li $v0, 4
la $a0, msg2
syscall

sub $t5, $t0, $t4

li $t6, 50

div $t7, $t5, $t6

add $t5, $t2, $t7

li $v0, 1
move $a0, $t5
syscall

#Exit
li $v0, 10
syscall

Print:
#Command for Printing msg2

li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t2
syscall


Process:

mul $t4, $t1, $t3
add $t3, $t3, 1

b forloop