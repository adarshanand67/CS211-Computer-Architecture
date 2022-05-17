# Find the maximum of the three expressions:x*x ; x*y ; y*5.Takexand y asinput from user. Write asubroutineto  calculate  values  of these  expressions.  Write  a  subroutine  to  find maximum of two integers and use it to find the maximum of these three expressions.Display the result

.globl Checking_Greatest_value # global declaration

Checking_Greatest_value:
	lw $t0, ($sp) # t0 = x
	addiu $sp, $sp, 4 # sp = sp + 4

	lw $t1, ($sp) # t1 = y
	addiu $sp, $sp, 4	# sp = sp + 4

	bge $t0, $t1, branch_1 # if x >= y goto branch_1
	lw $t0,	($sp) # t0 = x
	
	j first_exit # if x < y goto first_exit

	branch_1:	lw $t1, ($sp) # t1 = y
	
	first_exit:	bge $t0, $t1, branch_2 # if x >= y goto branch_2
			add $v0, $0, $t1	# v0 = y
			j second_exit	# if x < y goto second_exit

			branch_2:	
				add $v0, $0, $t0	# v0 = x
			second_exit:	

	jr $ra	# jump to return address
	
.globl All_multiplication_terms # global declaration

All_multiplication_terms:
	add $t0, $0, $a0 # t0 = x
	add $t1, $0, $a1 # t1 = y

	mul $t0, $t0, $t0 # t0 = x*x
	addiu $sp, $sp, -4 # sp = sp - 4
	sw $t0, ($sp)	# store t0 in stack
	
	li $t0, 5	# t0 = 5
	mul $t1, $t0, $t1 # t1 = y*5

	addiu $sp, $sp, -4	# sp = sp - 4
	sw $t1, ($sp)	# sp = sp + 4

	add $t0, $0, $a0 # t0 = x
	add $t1, $0, $a1 # t1 = y
	
	mul $t0, $t0, $t1 # t0 = x*y
	addiu $sp, $sp, -4	# sp = sp - 4
	sw $t1, ($sp)	# sp = sp + 4
	jr $ra	# jump to return address


.data
	num1: .asciiz "Enter value of X: \n" # num1 = "Enter value of X: \n"
	num2: .asciiz "Enter value of Y: \n"

.text
.globl main

main:	
	li $v0, 4	# load v0 with 4
	la $a0, num1 # load a0 with num1 = "Enter value of X: \n"
	syscall	# print num1

	li $v0, 5	# load v0 with 5
	syscall 

	add $a1, $0, $v0 # a1 = x
	
	li $v0, 4	# load v0 with 4
	la $a0, num2 # load a0 with num2 = "Enter value of Y: \n"
	syscall	# print num2

	li $v0, 5	# Take input of y from user
	syscall	

	add $a0, $0, $v0 # a0 = y
	jal All_multiplication_terms # call All_multiplication_terms

	jal Checking_Greatest_value # call Checking_Greatest_value
	add $a0, $0, $v0 # a0 = Checking_Greatest_value

	li $v0, 1	# load v0 with 1 
	syscall 	# print a0

	li $v0, 10	# load v0 with 10
	syscall	# exit