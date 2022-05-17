.data # data directive tells the compiler to read the data from the file
# helloworld : .asciiz "Hello, World!" # defines the string in the data section
newline : .asciiz "\n" # defines the newline character in the data section
birthdate: .asciiz "Birthdate: " # defines the string in the data section
.text # text directive tells the compiler to read the instructions from the file

main:
    li $v0, 4 # load the value 4 into the $v0 register
    la $a0, birthdate # load the address of the string into the $a0 register
    syscall # call the system call to print the string
    
    li $v0, 1 # load the value 1 into the $v0 register
    la $a0, 20 # load the address of the string into the $a0 register
    syscall # syscall 1 means print the int

    la $a0, 3 # load the address of the string into the $a0 register
    syscall # syscall 1 means print the int

    la $a0, 2002 # load the address of the string into the $a0 register
    syscall # syscall 1 means print the int
    
    # exit the program
    li $v0, 10 # load the value 10 into the $v0 register
    syscall # syscall 10 means exit the program