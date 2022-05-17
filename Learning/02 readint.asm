.data # data directive tells the compiler to read the data from the file


prompt : .asciiz "Enter a number: \n"
response : .asciiz "Your number is: \n"


.text # text directive tells the compiler to read the instructions from the file
main:
    li $v0, 4
    la $a0, prompt
    syscall # print prompt

    li $v0, 5 # read from stdin using syscall 5
    syscall
    move 	$t0, $v0		# $t0 = $v0

    li $v0, 4
    la $a0, response
    syscall # print response

    li $v0, 1
    move $a0, $t0 # move the value of $t0 to $a0
    syscall # print $t0

    # exit the program
    li $v0, 10 # load the value 10 into the $v0 register
    syscall # syscall 10 means exit the program