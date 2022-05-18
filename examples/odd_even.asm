# check if integer is even or odd

.data

msg: .asciiz "enter integer:"
even: .asciiz "\nNumber is even"
odd: .asciiz "\nNumber is odd"
.text

main:
	li $v0, 4
	la $a0, msg
	syscall	# print message

	li $v0, 5
	syscall	# read integer	from user
	
	andi $t0, $v0, 1	# t0 = $v0 & 1
	li $v0, 4	# print even or odd

	beq $t0, $zero, even_label	# if t0 == 0, goto even_label
	
	la $a0, odd	# print odd
	j end_label	# goto end_label
	
	even_label: 	# even_label
		la $a0, even
	
	end_label:
	syscall	# print even or odd

	li $v0, 10
	syscall		#exit