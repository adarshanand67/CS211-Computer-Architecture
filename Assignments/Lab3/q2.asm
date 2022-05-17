# Compute  the  dot  product  of  two  vectors  each  of  length  5.  Ask  the  user  to  enter  the  value  of  each 
# element of the two vectors. Display the dot product. 
# (Hint:  The  dot  product  of  two  vectors  is  sum  of  product  of  the  corresponding  elements.  For example, (1,2,3) dot (4,5,6) is 1*4+2*5+3*6 = 32)

#############################################################################

# Code in python 
# def dot_product(a,b):
#     sum = 0
#     for i in range(len(a)):
#         sum += a[i]*b[i]
#     return sum

# example 
# a = [1,2,3,4,5]
# b = [6,7,8,9,10]
# dot_product(a,b) = 1*6+2*7+3*8+4*9+5*10 = 6+14+24+30+40 = 106

#############################################################################


    .data
userInput1 : .asciiz "Enter 5 numbers for 1st vector: \n"
arr1 : .word 0,0,0,0,0
userInput2 : .asciiz "Enter 5 numbers for 2nd vector: \n"
arr2 : .word 0,0,0,0,0
ans:.asciiz "The dot product is: \n"
newline: .asciiz "\n"
thanks: .asciiz "Thanks for using the program! \n"

main:
    li $v0, 4 # $v0 = 4 (syscall)
    la $a0, userInput1 # $a0 = userInput1
    syscall # print userInput1 = "Enter 5 numbers for 1st vector: \n"

    # Reading 5 numbers for 1st vectors
    readFirstVector:
        beq $t0,20,endFirstVector # if $t0 == 20, goto endLoop

        li $v0,5
        syscall # read int from stdin

        sw $v0, arr1($t0) # arr1[$t0] = $v0
        addi $t0, $t0, 4 # $t0 += 4
        
        j readFirstVector # goto readFirstVector

    endFirstVector:
        jr $ra # return
    
    
    li $v0, 4 # $v0 = 4 (syscall)
    la $a0, userInput2 # $a0 = userInput1
    syscall # print userInput1 = "Enter 5 numbers for 1st vector: \n"

    # Reading 5 numbers for 2nd vectors
    readSecondVector:
        beq $t0,20,endSecondVector # if $t0 == 20, goto endSecondVector

        li $v0,5
        syscall # read int from stdin

        sw $v0, arr2($t0) # arr2[$t0] = $v0
        addi $t0, $t0, 4 # $t0 += 4

        j readSecondVector # goto readSecondVector
    
    endSecondVector:
        jr $ra # return

            
        dot_product:
            # Function dot_product
            # input : $a0,$a1 two vectors of length 5
            #       : $a2 - length(vectors) = 5

            # output : $v0 the dot product of the two vectors

            addu $v0, $zero, $zero # $v0 = 0
            
        loop:
            beq $a2, $zero, end # if $a2 == 0, goto end
            
            lw $t0, 0($a0) # $t0 = arr1[0]
            lw $t1, 0($a1) # $t1 = arr2[0]

            mul $t0, $t0, $t1 # $t0 = arr1[0] * arr2[0]
            addu $v0, $v0, $t0 # $v0 += $t0

            addiu $a0, $a0, 4 # $a0 += 4 (arr1[1])
            addiu $a1, $a1, 4 # $a1 += 4 (arr2[1])

            addiu $a2, $a2, -1 # $a2 -= 1

            j loop # goto loop

        end:
            jr $ra # return


    # print the dot product
    li $v0, 1 # $v0 = 1 (syscall)
    la $a0, ans # $a0 = ans
    syscall # print ans = "The dot product is: \n"

    # thanks
    li $v0, 4 # $v0 = 4 (syscall)
    la $a0, thanks # $a0 = thanks
    syscall # print thanks = "Thanks for using the program! \n"

    # end
    li $v0, 10 # $v0 = 10 (syscall)
    syscall # exit


