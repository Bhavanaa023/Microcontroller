;6.Write an ARM assembly program that counts the number of 1 bits (set bits)  in a given 32-bit unsigned integer. The program should utilize barrel shifting  operations to efficiently count the set bits.

		AREA PGM, CODE, READONLY
START     
        LDR r0, =number      ; Load address of the number
        LDR r1, [r0]         ; Load the 32-bit number into r1
        MOV r2, #0           ; Initialize bit counter to 0
        MOV r3, #32          ; Loop counter (32 bits in a register)

count_loop
        TST r1, #1           ; Test if the least significant bit (LSB) is 1
        ADDNE r2, r2, #1     ; If LSB is 1, increment counter
        LSR r1, r1, #1       ; Perform logical shift right (barrel shift)
        SUBS r3, r3, #1      ; Decrement loop counter
BNE count_loop       ; Repeat until all 32 bits are checked
        LDR r0, =result      ; Load address of result storage
        STR r2, [r0]         ; Store the final count in memory
STOP    B STOP               ; Infinite loop to stop execution

        AREA DATA, DATA, READWRITE
number  DCD 0xF0F0F00F       ; Example number (Modify this for testing)
result  DCD 0                ; Memory location to store bit count result

        END