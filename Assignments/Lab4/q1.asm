# Evaluate the expression ‘ab-10a+20b+16’. Consider that only $t0 and $t1 are available to store  temporary  values.  Store  a=10  and  b=20  in  data  section.  Use  stack  for  other  memory requirements. Display the sum

.data
    n1:	.word	10
    n2:	.word	20
    sum: .word	0

.text
    .global	main

main:
    li $t0, 10 # load 10 into $t0
	sw $t0, 0($sp) # store $t0 in stack
	addi $sp, $sp, -4 # decrement stack pointer 

	li $t1, 20 # load 20 into $t1
	sw $t1, 0($sp) # store $t1 in stack
    addi $sp, $sp, -4 # decrement stack pointer

    # Operations to get ab-10a+20b+16
	lw $t0, 8($sp) # load $t0 from stack
	lw $t1, 4($sp)  # load $t1 from stack
	mult $t0, $t1   # multiply $t0 and $t1 = a*b
	mflo $t2    # store the result in $t2

	sw $t2, 0($sp) # store $t2 in stack
	addi $sp, $sp, -4   # decrement stack pointer
	mult $t0, $t0   # multiply $t0 and $t0 = 10*a
	mflo $t2    # store the result in $t2

	sw $t2, 0($sp)  # store $t2 in stack
	addi $sp, $sp, -4  # decrement stack pointer
	mult $t1, $t1  # multiply $t1 and $t1 = 20*b
	mflo $t2   # store the result in $t2

	sw $t2, 0($sp) # store $t2 in stack
	addi $sp, $sp, -4 # decrement stack pointer
	lw $t0, 12($sp) # load $t0 from stack
	lw $t1, 8($sp)  # load $t1 from stack
	
    sub $t0, $t0, $t1   # subtract $t0 and $t1
	lw $t1, 4($sp)  # load $t1 from stack
	add $t0, $t0, $t1   # add $t0 and $t1

	addi $t0, $t0, 16   # add 16 to $t0 = ab-10a+20b+16
	add $a0, $0, $t0    # store $t0 in $a0
	
    li $v0, 1   
	syscall     # call print function
    
    # exit
    li $v0, 10
    syscall