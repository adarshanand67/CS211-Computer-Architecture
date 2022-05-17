# Let a and b be two  arrays  of  integers  stored  in  the  memory.  The  base  address  of a is  in register $a0 and the base address of register b is in $a1. Array ais calculated from array baccording to the following C program:; Register $t0 contains the current value of the index i, and register $s0 stores the value of constant c.

# for (i=0; i<=100;i=i+1) a[i] = b[i] + c
loop :
    lw $t0, 0($a0) # load the current value of i
    lw $t1, 0($a1) # load the current value of b[i]
    add $t1, $t1, $t0 # add the current value of b[i] to c -> t1 = b[i] + c
    sw $t1, 0($a1) # store the current value of t1 in a[i]
    addi $a0, $a0, 4 # increment the base address of a by 4
    addi $a1, $a1, 4 # increment the base address of b by 4
    addi $t0, $t0, 1 # increment the current value of i by 1
    bge $t0, $t0, 100, loop # if i<=100, go to loop
    jr $ra  # return from the function

    # How many instructions are executed for running this code? 
    # number of instructions executed is 

# sll $t0, $s0, 2 
# add $t0, $s6, $t0
# sll $t1, $s1, 2 
# add $t1, $s7, $t1 
# lw $s0, 0($t0) 

# instructions encoding in binary
# sll $t0, $s0, 2
# 000010 