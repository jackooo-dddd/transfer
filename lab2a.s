.global _start
_start:
	
	.data
# TODO: What are the following 5 lines doing?
promptA: .string "Enter an integer:\n"
promptResult: .string "The number you input is:\n"
newline: .string "\n"
promptOdd: .string "THIS IS ODD\n"
promptEven: .string "THIS IS EVEN\n "

.globl main
.text

main:
    # TODO: Set a breakpoint here and step through.
    # What does this block of 3 lines do?
    li a7, 4
    la a0, promptA
    ecall

	# Get user input
    li a7, 5
    ecall
    mv t0, a0
	
	
	# checking for the last bit
	# if the user input an odd, andi gives 1. If user input an even, andi gives 0
	andi t0, t0, 1
	# if t0 == t1: input is odd
	li t1, 1 
	beq t1, t0, ELSE
	
	li a7, 4
	la a0, promptEven
	ecall
	j DONE
	
	ELSE:
		li a7, 4
		la a0, promptOdd
		ecall
	DONE:

    li a7, 10
    ecall
