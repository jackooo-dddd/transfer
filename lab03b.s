# func1.s
.data
before: .string "Before function\n"
resAdd: .string "A + B is\n"
resSub: .string "A - B is\n"
newline: .string "\n"

.text
main:
	li t0, 5	# hard coded value for A
	li t1, 3	# hard coded value for B

	li a7, 4 	# system call code for print_string
	la a0, before 	# address of string to print
	ecall 	# print the string

	li a7, 4 	# system call code for print_string
	la a0, resAdd 	# address of string to print
	ecall 	# print the string

	# TODO: setup the arguments for function call doAdd
	mv a0, t0
	mv a1, t1
	jal doAdd 	# Make a function call to doAdd()
	#TODO: what exactly does jal do? Lookup the reference sheet
	# jal jump to the function and saves the return addr in register ra(jal ra, function_label)
	# TODO: print the return value of doAdd
	li a7, 1
	mv a0, a0
	ecall
	
	li a7, 4 	# system call code for print_string
	la a0, newline # address of string to print
	ecall 	# print the string	

	li a7, 4 	# system call code for print_string
	la a0, resSub 	# address of string to print
	ecall 	# print the string

	# TODO: setup the arguments for function call doSub
	mv a0, t0
	mv a1, t1								
	jal doSub 	# Make a function call to doSub()
	
	# TODO: print the return value of doSub
	li a7, 1
	mv a0, a0
	ecall
	
	li a7, 4 	# system call code for print_string
	la a0, newline # address of string to print
	ecall 	# print the string	
									
	# End of main, make a ecall to "exit"
	li a7, 10 	# system call code for exit
	ecall 	# terminate program	
	
# start of function doAdd()
doAdd:
	add a0, a0, a1
	# TODO: what need to be done here?
	jr ra
	
# start of function doSub()
doSub:
 	sub a0, a0, a1
	# TODO: what need to be done here?
	jr ra
 	 
