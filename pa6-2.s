	@---------------------
	@ Collin Mask and Anthony De La Cruz
	@ 11/16/2018
		@	Programming Assignment 6, Problem 2
		@	Your required header information goes here
		@--------------------
		@	You are to write a function that performs integer division
		@	Your function must be called div.  It takes two values, a and b passed as parameters,
		@	and should return a/b.  Code is given for you that tests
		@	your program.  Upon successful completion the following values should print
		@	0
		@	1
		@	11
		@	4
		@	5
	.extern printf
        .global main
        .func main 		
main:		@	DO NOT TOUCH!
		PUSH	{LR}
		MOV	R0, #5
		MOV	R1, #9
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #9
		MOV	R1, #5
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #80
		MOV	R1, #7
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #19
		MOV	R1, #4
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #60
		MOV	R1, #12
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		POP	{PC}
		
		@---------------------
		@	div function.  Your code goes here!
		@---------------------
div:		PUSH	{LR}	 @ Leave this here
	PUSH   {R2-R14} 	 @ push registers R2-R14 into stack
	MOV R2, R1 		 @ move R1 which is 9 into R2
	MOV R1, R0 		 @ move R0 which is 5 into R1
	MOV R3, R2		 @ R3 contains the value of R2
	CMP R3, R1, LSR #1 	 @ rotate to the right by 1 value in R1 and put it into R3 

Div1:
	MOVLS R3, R3, LSL #1 	 @ rotate to the left by 1 if R3 lower or same than R3
	CMP R3, R1, LSR #1	 @ rotate to the right value in R1 by 1 and put into R3
	BLS Div1		 @ if lower or same go back to the top
	MOV R4, #0 

Div2:
	CMP R1, R3 		 @ compare R1 and R3 
	SUBCS R1, R1, R3         @ substract R1 and R3 if the operation creates a result bigger than 32-bits
	ADC R4, R4, R4

	MOV R3, R3, LSR #1	 @ rotate to the right by 1 value in R3 and put it into R3
	CMP R3, R2 		 @ compare R3 and R2	
	BHS Div2		 @ if higher or same go back to the top 

	MOV R0, R4 		 
	POP {R2-R14}		 @ pop R2-R14 out of stack
	POP {PC}
	
	
	
		@ Your code here
	
		POP	{PC} 	@ return statement
.data
out:	.asciz "%d\n"	@ String for printf
