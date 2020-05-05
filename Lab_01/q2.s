# Question 2 Of Task
# (ii) ((52*8)*12+8)-(18+116)+(15*2)  

.text

.globl main 

main:

li $t0, 52
mul $t0, $t0, 8
mul $t0, $t0, 12
add $t0, $t0, 8
 
li $t1, 18
add $t1, $t1, 116
li $t2, 15
mul $t2, $t2, 2

sub $t0, $t0, $t1
add $t0, $t0, $t2

li $v0, 1
move $a0, $t0 #copying the value of register of $t0 into $a0.
syscall
li $v0, 10 #exit code
syscall