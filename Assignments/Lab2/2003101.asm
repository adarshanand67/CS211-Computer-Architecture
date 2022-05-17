.text
.globl main

main:

    la $t3, array           # load base address of the array
    # $t3 has the base address of data. All the subsequent data can be accessed using respective offset values (4).
    # Add your code here

    li $t0, 0               # i = 0
    lw $t1, sum             # sum = 0
    lw $t2, length          # length = 10

    while:
        lw $t4, ($t3)       # Load word from address
        add $t1, $t1, $t4   # sum = sum + arr[i]
        addi $t0, 1         # i = i + 1
        beq $t0, $t2, exit  # if i==length, exit
        addi $t3, 4         # increment arr + 4 bytes
        j while             # continue looping
    
    exit:
        li $v0, 4           # system call code to print string 
        la $a0, msg         # load msg address
        syscall

        li $v0, 1           # system call to print sum
        move $a0, $t1       # move sum value to print arguments
        syscall

        li $v0, 10          # exit safely
        syscall

.data

array:.word 10, 12, 15, -10, 13, 82, -9, 4, 3, -7, 10, 20, 30, 40, 50, 77   #array={10,12,15,-10,13,82,-9,4,3,-7,10,20,30,40,50,77}
length:.word 16                                    #load the length of the array as 16
sum: .word 0                                        #initialise sum to 0
msg: .asciiz "Sum of array is: "


