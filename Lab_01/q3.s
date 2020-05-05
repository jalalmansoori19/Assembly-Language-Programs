# Question 3 Of Task
# (iii) ((32+52)+58*3)+57
.text

.globl main 

main:

li $t1, 32
li $t2, 52

add $t0, $t1, $t2  
li $t1, 58
mul $t1, $t1, 3
add $t0, $t0, $t1
add $t0, $t0, 57



li $v0, 1
move $a0, $t0 #copying the value of register of $t0 into $a0.
syscall
li $v0, 10 #exit code
syscall