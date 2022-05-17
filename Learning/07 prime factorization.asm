# prime factorization
.data
    input:.asciiz "Enter a number: \n"
    output :.asciiz "Factorization is : \n"
    newline: .asciiz "\n"

.text

# 20 - 2,4,5,10,20

main:
    # user input
    li $v0, 4
    la $a0, input
    syscall

    li $v0, 5
    syscall # read from stdin
    move $t0, $v0 # $t0 = $v0

    # print prime factors
    li $v0, 4
    la $a0, output
    syscall

    # li $v0, 1
    # move $a0, $t0 # $a0 = $t0
    # syscall


    # prime factorization

    # while(i<n){
    #    if(n%i==0){
    #        print i
    #        n = n/i
    #    }
    #    i++
    # }

    li $t1, 2 # i = 2
    
    # t0=20, t1=2
    
    while: bge $t1, $t0, endwhile	# if $t1 >= $t0 then endwhile

        div $t0,$t1 
        mfhi $t2 # $t2 = $t0 % $t1

        bnez $t2, else_case	# if $t2 != 0 then else_case
        
        # print i
        li $v0, 1
        move $a0, $t1 # $a0 = $t1
        syscall

        # print newline
        li $v0, 4
        la $a0, newline
        syscall

        mflo $t0 # $t0 = $t0 / $t1
        j while # goto while 

    else_case:
        addi $t1, $t1, 1 # $t1 = $t1 + 1
        j while

    endwhile:
        li $v0, 1
        move $a0, $t0 # $a0 = $t0
        syscall

        # print newline
        li $v0, 4
        la $a0, newline
        syscall

        # end
        li $v0, 10
        syscall
