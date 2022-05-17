# Reverse  a  string  entered  by  user.  (Hint:  Ask  user  to  enter  a  string.  After reading  the  string  in  a buffer, copy it in reversed order to a second buffer. Write out the reversed string.)

    .data

welcomeMsg: .asciiz "Input string: " # input string
finalMsg: .asciiz "Reversed string: " # reversed string
userString: .space 256 # allocate 256 bytes for user input
newline: .asciiz "\n" # newline character

    .text 

main:

    li $v0, 4
    la $a0, welcomeMsg
    syscall # print welcome message

    li $v0, 8 # read user input
    la $a0, userString # user input buffer
    li $a1, 256 # max length of user input
    syscall  

    add $t0, $a0, $zero # t0 = user input buffer
    lb $t5, newline # load byte from newline character

    find_end:
        beq $t5, $t1, end # if byte is newline, jump to end
        lb $t1, ($t0) # load byte from user input buffer
        addi $t0, $t0, 1 # increment user input buffer
        bne $t1, $zero, find_end # if byte is not zero, jump to find_end

    end:
        addi $t0, $t0, -2 # decrement user input buffer by 2 bytes

    swap:
        lb $t2, ($a0)  # load byte from user input buffer
        lb $t3, ($t0) # load byte from user input buffer
        sb $t2, ($t0)   # store byte in user input buffer
        sb $t3, ($a0)
        addi $a0, $a0, 1
        addi $t0, $t0, -1
        ble $a0, $t0, swap  # if a0 is less than t0, jump to swap

    li $v0, 4
    la $a0, finalMsg
    syscall # print final message

    li $v0, 4
    la $a0, userString
    syscall # print reversed string

    li $v0, 10
    syscall # exit
