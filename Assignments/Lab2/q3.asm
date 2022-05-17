# The computed value, which is phi(21), should be printed on the screen.

.data
.text
.globl main
n1 : .word 21

main:
    lw $t0, n1($zero) # load the value of n1 into $t0
    li $t2,0 # initialize the value of $t2 to 0
    li $t3,0 # initialize the value of $t3 to 0

    loop1:
        sltu $t7,$t2,$t0 # $t7 = $t2 < $t0
        beq $t7,$zero,end1 # if $t7 is equal to 0, then go to end1
        sub $t4,$t0,$t2 # $t4 = $t0 - $t2
        add $a0,$zero,$t0 # $a0 = $t0
        add $a1,$zero,$t4 # $a1 = $t2
        jal gcd # call gcd

        addi $a1,$zero,1 # $al = 1
        beq $a0,$t5,return1 # if $a0 is equal to $t5, then go to return1
        addiu $t2,$t2,1 # $t2 = $t2 + 1
        j loop1 # go to loop1

        end1:
            addu $a0,$0,$t3 # $a0 = $t3
            li $v0,1 # $v0 = 1

        syscall # call syscall
        return1:
            addiu $t3,$t3,1 # $t3 = $t3 + 1
            addiu $t2,$t2,1 # $t2 = $t2 + 1

        j loop1 # go to loop1

GCD:
    # calculate the gcd of two numbers n1, n2
    # n1=$a0
    # n2=$a1

    addi $sp,$sp,-12 # decrement the stack pointer by 12
    sw $ra,0($sp) # store the return address in the stack
    sw $a0,4($sp) # store the value of $a0 in the stack
    sw $a1,8($sp) # store the value of $a1 in the stack
    
    add $a0,$zero,$a0 # $a0 = $a0
    add $a1,$zero,$a1 # $a1 = $a1

    addi $t1 ,$zero,1 # $t1 = 1

    beq $s1,$t1,return2 # if $s1 is equal to $t1, then go to return2

    add $a0,$zero,$a0 # $a0 = $a0
    div $s0,$s1 # $s0 = $s1
    mfhi $a1 # remainder of the division is stored in $a1
    jal GCD # call gcd

exitGCD:
    lw $ra,0($sp) # load the return address from the stack
    lw $s0,4($sp) # load the value of $s0 from the stack
    lw $s1,8($sp) # load the value of $s1 from the stack

    addi $sp,$sp,12 # increment the stack pointer by 12
    jr $ra # return to the caller

return2:
    add $v0,$zero,$a0 # $v0 = $a0
    j exitGCD # go to exitGCD

#  Summary of the code - 
#  I take the input number 21 and store it in $t0. I write GCD as a function and call it from main. After calling GCD, I check if the value of $a0 is equal to $t5. If it is, then I return 1. If it is not, then I add 1 to $t2 and call GCD again. I do this until $t2 is equal to $t0. I return the value of $t3. So Phi(21) = 4. Euler Phi function is computed.