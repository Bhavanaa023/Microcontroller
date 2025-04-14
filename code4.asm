;4. Write an Assembly language program to check whether the given number is  prime or not. 

	AREA RESET, CODE, READONLY
START
    LDR r0, =num          ; Load address of the number to check
    LDR r1, [r0]          ; Load the number into r1
    MOV r2, #2            ; Start divisor from 2
    MOV r3, #0            ; Initialize flag as 0 (Assume number is prime)
    CMP r1, #2            ; Check if number is less than 2
    BLT not_prime         ; If number < 2, it is not prime
    BEQ prime             ; If number = 2, it is prime
check_loop				; Perform division using repeated subtraction
    MOV r4, r1            ; Copy the number to r4 for division
    MOV r5, #0            ; Quotient set to 0
divide_loop
    CMP r4, r2            ; Check if divisor <= number
    BLT remainder_check   ; If divisor is greater, check remainder
    SUB r4, r4, r2        ; Subtract divisor from number
    ADD r5, r5, #1        ; Increment quotient
    B divide_loop
remainder_check
    CMP r4, #0            ; Check if remainder is zero
    BEQ not_prime         ; If remainder is 0, number is not prime
    ADD r2, r2, #1        ; Increment divisor
    MUL r7, r2, r2        ; Calculate divisor squared
    CMP r7, r1            ; Check if divisor squared > number
    BGT prime             ; If yes, number is prime
    B check_loop
not_prime
    MOV r3, #0            ; r3 = 0 (Not Prime)
    B end_program
prime
    MOV r3, #1            ; r3 = 1 (Prime)

end_program
    B end_program         ; Infinite loop to hold result
	; Data Section
    AREA DATA, DATA, READWRITE
num DCD 29                ; Change this number to test for primality

    END

