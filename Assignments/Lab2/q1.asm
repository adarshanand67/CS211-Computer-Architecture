# Including all directives
.text
 
.data # Start of data section
    msg: .asciiz "The sum of the array is: \n" # String to print
    sum: .word 0 # sum = 0
    length: .word 10 # Length of the array
    array: .word 10, 12, 15, -10, 13, 82, -9, 4, 3,-7 # Array of numbers

main: # main function

    la $t3,array # Load the address of the array

    li $t0,0 # Initialize the index i = 0
    lw $t1,sum # Load the sum = 0
    lw $t2,length # Load length of the array

    while:
        lw $t4,0($t3) # Load the value of the array

        add $t1,$t1,$t4 # Add the value of the array at index i to the sum
        addi $t0,$t0,1 # Increment the index i

        beq $t0,$t2,end # If i == length, break

        addi $t3,$t3,4 # Increment the address of the array by 4
        j while # Go back to the while loop

end:
    li $v0, 4           # system call code to print string 
    la $a0, msg         # load msg address
    syscall

    li $v0, 1           # system call to print sum
    move $a0, $t1       # move sum value to print arguments
    syscall

    li $v0, 10          # exit safely
    syscall

# Summary of the code -
# I write the code for adding the elements of the array and printing the sum. I also used the system call to print the sum and the string. Using a while loop, I iterated through the array and added the elements to the sum. I also used the system call to print the sum and the string. 