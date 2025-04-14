;3. Write an ARM assembly language program to calculate the sum of squares  of 5 numbers stored in a memory location. 

	AREA RESET, CODE, READONLY
START
        LDR r0, =numbers    ; Load address of numbers array
        LDR r1, =result     ; Load address to store result
        MOV r2, #5          ; Counter (number of elements)
        MOV r3, #0          ; Initialize sum (sum_of_squares = 0)
loop    
        LDR r4, [r0], #4    ; Load a number from memory and increment pointer
        MUL r5, r4, r4      ; Square the number (r5 = r4 * r4)
        ADD r3, r3, r5      ; Add squared number to sum
        SUBS r2, r2, #1     ; Decrease counter
        BNE loop            ; Repeat until all numbers are processed
        STR r3, [r1]        ; Store the final sum in memory
STOP    B STOP              ; Infinite loop to stop execution

        AREA DATA, DATA, READWRITE
numbers DCD 2, 3, 4, 5, 6   ; Array of 5 numbers
result  DCD 0               ; Memory location to store the result

        END
