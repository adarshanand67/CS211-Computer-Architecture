# print factorial of input number
.data
input:.asciiz "Enter a number: \n"
output:.asciiz "Factorial is : \n"

.text

main:
    # user input
    li $v0, 4
    la $a0, input
    syscall

    li $v0, 5
    syscall

    # store input in $t0
    move $t0, $v0

    # store 1 in $t1
    li $t1, 1

# calculate factorial
factorial:
    # check if $t0 is 0
    beq $t0, $zero, end

    # multiply $t1 by $t0
    mul $t1, $t0, $t1 # $t1 = $t1 * $t0

    # decrement $t0
    addi $t0, $t0, -1

    # jump to factorial
    j factorial

# move t1 to $v0
end:

    li $v0, 4
    la $a0, output
    syscall

    li $v0, 1
    move $a0, $t1 # $a0 = $t1
    syscall

    # exit
    li $v0, 10
    syscall