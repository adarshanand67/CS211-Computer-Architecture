.data # data directive tells the compiler to read the data from the file

helloworld : .asciiz "Hello World!\n"
ok: .asciiz "OK\n"

.text # text directive tells the compiler to read the instructions from the file

main:
    li $t0,0 # load the value 0 into the register $t0
    li $t1,7 # load the value 1 into the register $t1

    li $v0, 4 # load the value 4 into the register $v0
    la $a0, ok # load the address of the string into the register $a0
    syscall # call the system call

dothis:
    # print helloworld
    li $v0, 4 # load the value 4 into the register $v0
    la $a0, helloworld # load the address of helloworld into the register $a0
    syscall # call the system call

    # exit the program
    li $v0, 10 # load the value 10 into the register $v0
    syscall # call the system call
