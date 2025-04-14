;7. Write an ARM assembly program to demonstrate the usage of the MRS and  MSR instruction.

		AREA PGM, CODE, READONLY
START
        MRS r0, CPSR        ; Move CPSR (Current Program Status Register) to r0
        MOV r1, r0          ; Copy original CPSR to r1 for backup
        BIC r0, r0, #0x80   ; Clear IRQ disable bit (Enable IRQ)
        MSR CPSR_c, r0      ; Write modified CPSR back
        MRS r2, CPSR        ; Read the modified CPSR value into r2
        MSR CPSR_c, r1      ; Restore original CPSR from backup (r1)

STOP	B STOP              ; Infinite loop to stop execution
        END