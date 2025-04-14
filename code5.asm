;5. Write an ARM assembly language program that swaps the values of two  numbers without temporary register and swp instruction available in ARM.

 
		AREA RESET, CODE, READONLY
START        
        LDR r0, =num1       ; Load address of first number
        LDR r1, =num2       ; Load address of second number
        LDR r2, [r0]        ; Load num1 into r2
        LDR r3, [r1]        ; Load num2 into r3
        ; XOR swap algorithm
        EOR r2, r2, r3      ; r2 = r2 XOR r3
        EOR r3, r2, r3      ; r3 = r2 XOR r3 (now r3 = original r2)
        EOR r2, r2, r3      ; r2 = r2 XOR r3 (now r2 = original r3)
      ; Store swapped values back to memory
        STR r2, [r0]        ; Store new num1
        STR r3, [r1]        ; Store new num2

STOP    B STOP              ; Infinite loop to stop execution

        AREA DATA, DATA, READWRITE
num1    DCD 5               ; First number (Changeable)
num2    DCD 10              ; Second number (Changeable)

        END