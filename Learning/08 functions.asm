# function to calculate factorial of a number
.data
    input:.asciiz "Enter a number: \n"
    output :.asciiz "The factorial of the number is: \n"
    newline: .asciiz "\n"


###############################################################################

factorial:
    # factorial function
    # input: $a0 - number to find factorial of
    # output: $v0 - factorial of $a0

    # check for 0 
    beqz $a0, return0 # if 0, return 0
    # check for 1

    li $v0, 1 # initialize result to 1
    li $t0, 1 # initialize t0 to 1

    # loop through all numbers from 1 to $a0

loop:
    bgt $t0, $a0, end_fact # if $a0 >= $t0, end_fact
    # v0 = v0 * $t0
    mul $v0, $v0, $t0 # v0 = v0 * t0
    addi $t0, 1 # increment t0
    j loop # loop again
    
return0:
    # return 0
    li $v0, 1
    jr $ra   # jump register return address

end_fact:
    # return $v0
    jr $ra   # jump register return address

###############################################################################

.text

main:
    # input
    li $v0, 4
    la $a0, input
    syscall # print input - "Enter a number: \n"

    li $v0, 5
    syscall # read input - $a0

    # output
    li $v0, 4
    la $a0, output
    syscall # print output - "The factorial of the number is: \n"

    li $v0, 1
    la $a0, newline
    syscall # print newline - "\n"

    # print factorial
    jal factorial # call factorial function
    li $v0, 4
    syscall # print result - $v0

    # return
    li $v0, 10
    syscall # exit

    
# jal - jump and link
# jr - jump register