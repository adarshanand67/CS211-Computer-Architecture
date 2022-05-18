.data # data directive tells the compiler to read the data from the file
    newline: .asciiz "\\n" # newline directive tells the compiler to print a newline

.text # text directive tells the compiler to read the instructions from the file

main:
    li $t0,2 # load 2 into $t0
    li $t1,3 # load 3 into $t1

    add $a0,$t0,$t1 # a0=$t0+$t1=2+3=5
    li $v0,1 # load 1 into $v0
    syscall  # syscall instruction 1 for printing integer

    addi $a0,$t0,1 # a0=$t0+1=2+1=3
    li $v0,1
    syscall

    sub $a0,$t0,$t1 # a0=$t0-$t1=2-3=-1
    li $v0,1
    syscall

    mult $t0,$t1 # a0=$t0*$t1=2*3=6
    mflo $a0    # a0=$t0*$t1=6
    li $v0,1
    syscall

    mfhi $a0    # a0=$t0*$t1=6
    li $v0,1
    syscall

    div $t0,$t1 # a0=$t0/$t1=2/3=0
    mflo $a0    # a0=$t0/$t1=0
    li $v0,1
    syscall

    mfhi $a0    # remainder=$t0%$t1=2%3=2
    li $v0,1
    syscall

    mul $a0,$t0,$t1 # a0=$t1*$t0=3*2=6
    li $v0,1
    syscall

    div $a0,$t0,$t1 # a0=$t1/$t0=3/2=1
    li $v0,1
    syscall

    rem $a0,$t0,$t1 # a0=$t1%$t0=3%2=1
    li $v0,1
    syscall

    # exit the program
    li $v0, 10 # syscall number for exit
    syscall