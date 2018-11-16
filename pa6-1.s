		@---------------------
	@ Collin Mask and Anthony De La Cruz
	@ 11/16/2018
	@	Programming Assignment 6, Problem 1
	@	Your required header information goes here
		@ 
		@---------------------
		@ In those you will use the provided function pow to comput
		@ a^b - 3a
		@ You must set up the arguments to pow and call it using BL
		@ The result should be in R4 after the program completes
	.extern printf
	.global	main
	.func main	
main:	PUSH {LR}
	@	Your code goes here
	LDR R0, =a @ load  value a into R0
	LDR R0,[R0] @ load R0 into R0 to assign the value of a to it
	LDR R1, =b @ load value b to R1
	LDR R1, [R1] @ load R1 into R1 to assign the value of b to it
	MOV R5, #3 @ move 3 into R5
	BL pow

	LDR R7, =a @ laod a into R7
	LDR R7,[R7] @load R7 into R7 to assign the value of a to it

	MUL R3, R7, R5 @ multiply R5 and R7 and put into R3
	SUB R4, R0, R3 @ substract R0 and R3 and put into R4 

	@ Code to print your answer.  DO NOT CHANGE!
	LDR	R0, =out
	MOV	R1, R4
	BL 	printf
	POP	{PC}
		
	@---------------------
	@  pow function.  DO NOT CHANGE!
	@---------------------
pow:	PUSH		{LR}
	PUSH		{R4-R6}
	MOV		R4, R1
	MOV		R5, #1
loop:	CMP		R4, #0
	BEQ		exit
	MUL		R5, R0, R5
	SUB		R4, R4, #1
	BAL		loop
exit:	MOV		R0, R5
	POP		{R4-R6}
	POP		{PC}

.data
a:	.word	3
b:	.word	4
out:	.asciz "Answer: %d\n"
