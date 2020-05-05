# Question 1 Of Task
# (i) (9-8)*12+(16-15)-(5*2)
.text

.globl main 

main:

li $t1, 9 #loading an integer value 9 into register $t1.
li $t2, 8 #loading an integer value 8 into register $t2.

sub $t0, $t1, $t2 # Subtracting Data from t1 and t2 and Storing result in t0 
mul $t0, $t0, 12 # multiplying 12*t0  Register

li $t3, 16
li $t4, 15

sub $t1, $t3, $t4 # Subtracting Data from t4 and t3 and Storing result in t1(Overwrite)

li $t2, 5

mul $t2, $t2, 2  # Multiplying 5*2 and Storing result in t2 Register

sub $t1, $t2, $t1 
sub $t0, $t0, $t1 #Final Result




li $v0, 1
move $a0, $t0 #copying the value of register of $t0 into $a0.
syscall
li $v0, 10 #exit code
syscall