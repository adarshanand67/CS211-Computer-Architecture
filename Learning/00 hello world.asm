.data # data directive tells the compiler to read the data from the file
helloworld : .asciiz "Hello, World!" # defines the string in the data section

.text # text directive tells the compiler to read the instructions from the file
main:
    li $v0, 4 # load the value 4 into the $v0 register
    la $a0, helloworld # load the address of the string into the $a0 register
    syscall # call the system call to print the string