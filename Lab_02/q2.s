.data
msg1: .asciiz "Enter the value of x : "
msg2: .asciiz "Enter the value of y : "
msg3: .asciiz "Enter the value of z : "
msg4: .asciiz "Value of a1 : "
msg5: .asciiz "Value of b1 : "
msg6: .asciiz "Value of c1 : "
newline: .asciiz "\n"
.text
.globl main
main:
# to print a string
la $a0, msg1 # load the address referred by msg1 in the register a0
li $v0, 4 # v0 should 4 for printing string
syscall

#Input for x
li $v0, 5
syscall
move $t0, $v0

# to print a string
la $a0, msg2 # load the address referred by msg2 in the register a0
li $v0, 4 # v0 should 4 for printing string
syscall

#Input for y
li $v0, 5
syscall
move $t1, $v0

# to print a string
la $a0, msg3 # load the address referred by msg3 in the register a0
li $v0, 4 # v0 should 4 for printing string
syscall

#Input for z
li $v0, 5
syscall
move $t2, $v0

# for a1
mul $t3, $t0, $t1
add $t3, $t3, $t2

#for b1
mul $t4, $t1, $t2
add $t4, $t4, $t0

#for c1

mul $t5, $t0, $t1
sub $t5, $t5, $t2

#output for a1

la $a0, msg4
li $v0, 4
syscall

li   $v0, 1
move $a0, $t3
syscall 

#output for b1

li $v0, 4
la $a0, newline #for Newline
syscall


la $a0, msg5
li $v0, 4
syscall

li   $v0, 1
move $a0, $t4
syscall 

#output for c1

li $v0, 4
la $a0, newline #for Newline
syscall


la $a0, msg6
li $v0, 4
syscall

li   $v0, 1
move $a0, $t5
syscall 


#exit code
li $v0, 10
syscall