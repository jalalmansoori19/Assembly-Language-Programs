.data

Prompt: .asciiz"Enter a Integer : "
newLine: .asciiz"\n"
seriesSum: .asciiz"Sum of Factorial Series is : "

.text
.globl main
main:

#Prompting
li $v0, 4
la $a0, Prompt
syscall

#User's Input
li $v0, 5
syscall
move $t0, $v0

#factorial = 1
li $t4, 1

#For Sum of Factorial Sequence
li $t7, 1 #Sum=1

#Factorial counter e.g 0!, 1!, 2!....till N! 
li $t5, 0
#Loop
li $t3, 1

#Zero Factorial will Print in every case if user enter N>0 
li $v0, 1
move $a0, $t4
syscall

#newLine
li $v0, 4
la $a0, newLine
syscall

#OuterLoop for Printing Factorial till Nth integer
OuterLoop:

move $t5, $t3

#OuterLoop Condition
ble $t5, $t0, While

#Prompt for Sum of Factorial Series
li $v0, 4
la $a0, seriesSum
syscall

li $v0, 1
move $a0, $t7
syscall

#Exit code
li $v0, 10
syscall

#Condition

While:

bne $t5, 0, Process

#For Sum of Factorial Series
add $t7, $t7, $t4

#Print Factorial Sequence till Nth Integer
li $v0, 1
move $a0, $t4
syscall

#newLine
li $v0, 4
la $a0, newLine
syscall

#OuterLoop Incrementation 
add $t3, $t3, 1

li $t4, 1

b OuterLoop


Process:

#factorial=factorial*num;
mul $t4, $t4, $t5
#num=num-1

sub $t5, $t5, 1

b While
