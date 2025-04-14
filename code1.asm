;1.If the registers r1, r2 and r3 contain the values 0, 15 and 12 respectively, 
;what will be the value in register r4 after execution of the following code  segment? 
;Assume that the registers are 32-bits in size.  MVN r0, r1  AND r4, r0,r2  EOR r4, r4, r3
		
	AREA PGM, CODE, READONLY
START       
    MOV r1, #0       ; Move value 0 to r1
    MOV r2, #15      ; Move value 15 to r2
    MOV r3, #12      ; Move value 12 to r3
    MVN r0, r1       ; r0 = NOT r1 (bitwise complement of 0 -> 0xFFFFFFFF)
    AND r4, r0, r2   ; r4 = r0 AND r2 (0xFFFFFFFF AND 0x0000000F = 0x0000000F)
    EOR r4, r4, r3   ; r4 = r4 XOR r3 (0x0000000F XOR 0x0000000C = 0x00000003)
STOP B STOP           ; Infinite loop to stop execution
    END