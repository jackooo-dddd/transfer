.global _start
_start:
	
.data
array1: .word 5, 8, 3, 4, 7, 2
# TODO: What are the following 5 lines doing?
promptA: .string "How many time do you want to multiply?\n"
promptMultiple: .string "Enter an integer for multiply.\n"
promptResult: .string "The product is: \n"
newline: .string "\n"
N: .word 5

.globl main
.text

main:
	
		
    li s2, 6 
	# define counter s1 and s2, each iteration s1 increment by 1
	# when s1 == s2, stops the loop
	li s1, 0
	
	# using s3  store the number that is multiplied
	li s3, 1
	
	# using s10 to store the base addr of array
	la s10, array1
	
	WHILE: 
		beq s1, s2, WHILEDONE
		
		# now t2 stores array1[s1]
		slli t1, s1, 2
		add t2, s10, t1
		
		# get the value stored in t2
		lw t2, 0(t2)
		
		# perform multiplying
		mul s3, s3, t2
		
		# increment array index s1
		addi s1, s1, 1
		j WHILE
	WHILEDONE:
	# print out the product
	li a7, 4
	la a0, promptResult
	ecall
	
	li a7, 1
	mv a0, s3
	ecall
	
	li a7, 4
	la a0, newline
	ecall
	
    li a7, 10
    ecall
