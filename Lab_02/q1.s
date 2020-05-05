.data
msg1: .asciiz "Enter the width of rectangle : "
msg2: .asciiz "Enter the length of rectangle : "
msg3: .asciiz "Area of Rectangle is  : "

.text
.globl main
main:
# to print a string
la $a0, msg1 # load the address referred by msg1 in the register a0
li $v0, 4 # v0 should 4 for printing string
syscall

li $v0, 5 # Taking input(integer Value ) from user 
syscall
move $t0, $v0 # Transfering Value from $v0 to $t0 for operations 

#For Printing Second text
la $a0, msg2
li $v0, 4
syscall

#For length (Taking input from user)
li $v0, 5
syscall
move $t1, $v0 

# calculation area
mul $t0, $t0, $t1 


la $a0, msg3
li $v0, 4
syscall

li   $v0, 1 
move $a0, $t0
syscall



#exit code
li $v0, 10
syscall