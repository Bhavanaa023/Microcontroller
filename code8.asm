;8.Memory locations 0X40000000, 0X40000004 and 0X40000008 contain the  data 10, 20 and 30 respectively. 
;If the register r1 initialized with the value  0X40000000 the content of in register r2 after execution 
;of the following  code segment will be: 
;LDR r5, [r1] 
;LDR r6,[r1,#4] 
;LDR r7,[r1,#8] 
;ADD r2, r5,r6 
;SUB r2, r2, r7


	AREA PGM, CODE, READONLY
START
	LDR r1,=0x40000000	;Innitialize r1 with memory address 0x40000000
	;load values from memory
	LDR r5, [r1]       ; Load value at 0x40000000 into r5 ? r5 = 10
	LDR r6, [r1, #4]   ; Load value at 0x40000004 into r6 ? r6 = 20
	LDR r7, [r1, #8]   ; Load value at 0x40000008 into r7 ? r7 = 30
	ADD r2, r5, r6     ; r2 = r5 + r6 ? r2 = 10 + 20 = 30
	SUB r2, r2, r7     ; r2 = r2 - r7 ? r2 = 30 - 30 = 0
STOP B STOP				; Infinite loop to stop the program
	;Data section
	AREA DATA,DATA, READWRITE
	DCD 10;			DATA AT 0x40000000
	DCD 20;			DATA AT 0x40000004
	DCD 30;			DATA AT 0x40000008
	END