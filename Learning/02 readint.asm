.data # data directive tells the compiler to read the data from the file


prompt : .asciiz "Enter a number: \n"
response : .asciiz "Your number is: \n"


.text # text directive tells the compiler to read the instructions from the file
main:
    # print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # read from stdin
    li $v0, 5
    syscall
    move $t0, $v0 # reading from stdin is stored in $v0

    # print response
    li $v0, 4
    la $a0, response
    syscall

    # print $t0
    li $v0, 1
    move $a0, $t0
    syscall

    # exit the program
    li $v0, 10
    syscall
