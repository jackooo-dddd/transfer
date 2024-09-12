.global _start
_start:
	
.data
# TODO: What are the following 5 lines doing?
promptA: .string "Enter an integer:\n"
promptResult: .string "The number you input is:\n"
newline: .string "\n"
promptOdd: .string "THIS IS ODD\n"
promptEven: .string "THIS IS EVEN\n"
promptOddMany: .string "TOO MANY TIMES\n"
N: .word 5

.globl main
.text

main:
	
	# define counter s1 and s2, each iteration s1 increment by 1
	# when s1 == s2, stops the loop
	li s1, 0
	# load N into s2
	la a0, N
	lw s2, 0(a0)
	WHILE: 
		beq s1, s2, TOOMANYODD
		# Get user input
		li a7, 4
   		la a0, promptA
    	ecall
		
    	li a7, 5
    	ecall
    	mv t0, a0
		
		# checking for the last bit
		# if the user input an odd, andi gives 1. If user input an even, andi gives 0
		andi t0, t0, 1
		# if t0 == t1: input is odd
		li t1, 1 
		beq t1, t0, ELSE
		
		# if the input is even, ends the loop
		li a7, 4
		la a0, promptEven
		ecall
		j WHILEDONE
		
		ELSE:
			# odd input
			li a7, 4
			la a0, promptOdd
			ecall
		addi s1, s1, 1
		j WHILE
	TOOMANYODD:
		li a7, 4
		la a0, promptOddMany
		ecall
	WHILEDONE:
    li a7, 10
    ecall
