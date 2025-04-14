;9.Memory locations 0X40000000 contains the data 0x12341234, the registers  r0, r1 and r2 
;contain the values 0x00000000, 0x11112222 and  0X40000000 respectively, what will be the 
;value in register r0, r1 and r2  after execution of the following instruction 
;SWP r0, r1, [r2]

		AREA PGM, CODE, READONLY
START
        LDR r0, MEMORY  ;Number is loaded to r0
		LDR r0,=0x00000000 ;Load 0x0 to r0
        LDR r1, =0x11112222  ; Load memory address 0x11112222 into r1
        LDR r2, =0x40000000    ; Load memory address 0x40000000 into r2		
        SWP r0, r1, [r2]     ; Swap value at [r2] with r1, old memory value goes to r0
MEMORY DCD 0x40000000
        END