.global _start
_start:
	
.data
# TODO: What are the following 5 lines doing?
promptA: .string "How many time do you want to multiply?\n"
promptMultiple: .string "Enter an integer for multiply.\n"
promptResult: .string "The product is: \n"
newline: .string "\n"
N: .word 5

.globl main
.text

main:
	
	li a7, 4
	la a0, promptA
    ecall
		
    li a7, 5
    ecall
    mv s2, a0
	# define counter s1 and s2, each iteration s1 increment by 1
	# when s1 == s2, stops the loop
	li s1, 0
	
	# using s3  store the number that is multiplied
	li s3, 1
	WHILE: 
		beq s1, s2, WHILEDONE
		# Get user input
		li a7, 4
   		la a0, promptMultiple
    	ecall
		
    	li a7, 5
    	ecall
    	mv t0, a0
		
		# perform multiplying
		mul s3, s3, t0
		
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
