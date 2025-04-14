;2. Write an ARM assembly language program to generate first 10 Fibonacci  numbers. 

	AREA PGM, CODE, READONLY
START
    MOV r0, #0          ; First Fibonacci number (F0)
    MOV r1, #1          ; Second Fibonacci number (F1)
	LDR r2, =fib_series ; Load address of storage location
    STR r0, [r2], #4    ; Store F0 in memory and increment pointer
    STR r1, [r2], #4    ; Store F1 in memory and increment pointer
    MOV r3, #8          ; Loop counter (since first two numbers are already stored)
loop    
    ADD r4, r0, r1      ; F(n) = F(n-1) + F(n-2)
    STR r4, [r2], #4    ; Store Fibonacci number in memory and increment pointer
	MOV r0, r1          ; Update F(n-2) = F(n-1)
    MOV r1, r4          ; Update F(n-1) = F(n)
	SUBS r3, r3, #1     ; Decrement loop counter
    BNE loop            ; Repeat until 10 numbers are generated
STOP  B STOP             ; Infinite loop to stop execution

     AREA DATA, DATA, READWRITE
fib_series SPACE 40        ; Reserve space for 10 Fibonacci numbers (10 * 4 bytes)
	END
