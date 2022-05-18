# Write MIPS assembly program to calculate the following sum where “n” is an input by the 
# user and can take a maximum value of 8. (10 Marks)

# sum = 1-(1/2!)-(2/3!)-(3/4!)- ........(n/(n+1)! )

# You should upload screenshots of your program, with comments. Sample output is not 
# needed

.data
    n: .space 4
    
    message1: .asciiz "Enter the value of n\n"
    message2: .asciiz "Final value of sum calculated: \n"

.text   
.globl main

main:

    # Print message
    li $v0, 4
    la $a0, message
    syscall

    addi $t0, $zero, 0 # t0 = 0

    li $v0, 5 # syscall 5 reads a character from stdin
    syscall 

    sw $v0, x($t0) # store the character in x


    add $t1, $zero, $t0 # t1 = x

    addi $t2, $zero, 1  # t2 = 1

    addi $t3, $zero, 0  # t3 = 0

    addi $t4, $zero, 1  # t4 = 1

    addi $t5, $zero, 1  # t5 = 1

    addi $t6, $zero, 1  # t6 = 1


    
    sumOfLoop:


        beq $t0, $t2, Done # if x = 1, goto Done


        addi    $t3, $t2, 1     # t3 = t2 + 1

        mult	$t4, $t3    # t4 = t3 * t4

        mflo	$t4		    # t4 = t3 * t4

        

        div		$t2, $t4

        mflo	$t5		

        

        sub		$t6, $t6, $t

        

        j sumOfLoop # goto sumOfLoop

    Done:

    
    li $v0, 4
    la $a0, message # load message2

    syscall

    
    li $v0, 1   # syscall 1 prints a character to stdout
    la $a0, ($t6)
    syscall

    
    li $v0, 10 # syscall 10 exits the program
    syscall