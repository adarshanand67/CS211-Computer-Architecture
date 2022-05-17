# Adarsh Anand
# 2003101
# CSE

# This program is written as part of assignment 1 of CSE 211 - Computer Architecture course by Prof - Sharad Sinha and TA - Mr. Prashant Kumar

	
	# Include directives
	
	.text
	.globl main
	
main:
	## a) -Add numbers 100 and -82 and store the result in register $10.
		
	# Store 100 in $8
	li $8, 100
	
	# Store 82 in $9
	li $9, 82
	
	# $11 = $0 - $9
	sub $11, $0, $9
	
	# $10 = $8 + $11 = 100 - 82 = 18
	add $10, $8, $11
	# Final value of $10 is 18
	
	
	# # b) Store FFFF in $8. Left shift it 2 times and store the result in memory location 0x10000000.

	# # Store FFFF in $8
	# li $8, 0xFFFF

	# # Shift left by 2 times
	# sll $8, $8, 2

	# # Store the result in memory location 0x10000000
	# sw $8, 0x10000000


	# # ## c) - Evaluate the expression (2x + 3)^2 where x is the content in register $10 based on exercise (a). Store the result in register $13
	
	# (2x + 3)^2 = 2x^2 + 6x + 9 => $13
	
	li $8, 2 # assign 2 to $8
	
	li $9, 3 # assign 3 to $9
	
	# multiply $10 by 2
	mul $10, $10, $8

	# add 3
	add $10, $10, $9

	# square $10
	multu $10, $10

	# Store product in $13
	mflo $13