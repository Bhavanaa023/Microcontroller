;10. Write an ALP to transfer a block of data from source to destination location 7 
;using LDM and STM instruction. 

	AREA PRGM,CODE,READONLY
START
	LDR R0,SOURCE; R0 points to source
	LDR R1,DESTINATION; R1 points to destination
	LDMIA R0!,{R2-R3}; Load 2 words into R2 and R3
	STMIA R1!,{R2-R3}; Store them into destination
HERE B HERE 
SOURCE DCD 0x40000000
DESTINATION DCD 0x40000015
	END
