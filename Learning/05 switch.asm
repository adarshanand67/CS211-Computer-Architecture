# switch case
.data
One : .asciiz "One\n"
Two : .asciiz "Two\n"
Three : .asciiz "Three\n"

.text

main: 
    li $t0, 3 # t0=1

    # check if t0 = 1 or 2 or 3
    beq $t0, 1, .case1 # if t0 = 1 goto case1
    beq $t0, 2, .case2 # if t0 = 2 goto case2
    beq $t0, 3, .case3 # if t0 = 3 goto case3

.case1:
    # print "One"
    li $v0, 4
    la $a0, One
    syscall
    j end_case

.case2:
    # print "Two"
    li $v0, 4
    la $a0, Two
    syscall
    j end_case

.case3:
    # print "Three"
    li $v0, 4
    la $a0, Three
    syscall
    j end_case


end_case:
    # end_case for switch case

    # Exit the program
    li $v0, 10
    syscall