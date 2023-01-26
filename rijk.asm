.ORIG x3000 ; LC-3 Brainfuck Compiler v0
    ADD R0 R0 #0
    LD R4 MEM_START ; output pointer
    LD R6 STACK_TOP ; stack pointer
LOOP
    GETC
    OUT
    ADD R1 R0 #0 ; move to R1

    LEA R7 LOOP ; this is where the subroutines must return to
CMD_INCR
    LD R2 CH_INCR
    ADD R1 R1 R2
    BRnp CMD_IN

    LEA R3 OP_INCR
    BR PUT

CMD_IN
    LD R2 CH_IN
    ADD R1 R1 R2
    BRnp CMD_DECR

    LEA R3 OP_IN
    BR PUT

CMD_DECR
    LD R2 CH_DECR
    ADD R1 R1 R2
    BRnp CMD_OUT

    LEA R3 OP_DECR
    BR PUT

CMD_OUT
    LD R2 CH_OUT
    ADD R1 R1 R2
    BRnp CMD_ML

    LEA R3 OP_OUT
    BR PUT

CMD_ML
    LD R2 CH_ML
    ADD R1 R1 R2
    BRnp CMD_MR

    LEA R3 OP_ML
    BR PUT

CMD_MR
    LD R2 CH_MR
    ADD R1 R1 R2
    BRnp CMD_BRZ

    LEA R3 OP_MR
    BR PUT

CMD_BRZ
    LD R2 CH_BRZ
    ADD R1 R1 R2
    BRnp CMD_BRNZ

    ; Left Bracket: add empty indicator byte and push that location to the stack
    ADD R6 R6 #-1   ; increase stack
    STR R4 R6 #0    ; push location to stack
    ; TODO: Handle stack overflow (unlikelier than the underflow since there is quite a bit of memory available)

    ; Make space for 2 instructions
    ADD R4 R4 #2    ; increase location pointer

    BR LOOP
CMD_BRNZ
    LD R2 CH_BRNZ
    ADD R1 R1 R2
    BRnp CMD_END

    ; Right Bracket: pop the stack, update the referencing memory location to the current, add location
    LDR R3 R6 #0    ; load location from stack
    ADD R6 R6 #1   ; decrease stack
    ; TODO: Handle stack underflow

    ; Step 1: update the right bracket so it references to this location
    LD R1 OP_PRE_BR
    STR R1 R3 #0

    LD R1 OP_BRZ
    ADD R2 R3 #0 ; copy
    NOT R2 R2
    ADD R2 R2 #1
    ADD R0 R4 R2 ; pcoffset9 = current - previous
    ADD R0 R0 #-1 ; PC is always one more
    ; R2 contains a 16 bit offset now BUT we need a PCOffset9
    ; NOTE: I assume that the [ and ] won't be more than 255 locations apart from each other
    ; BITWISE OR
    NOT R0 R0
    NOT R1 R1
    AND R0 R0 R1
    NOT R0 R0

    STR R0 R3 #1 ; store at previous + 1

    ; Step 2: create a instruction at current loation that branches to previous
    LD R1 OP_PRE_BR
    STR R1 R4 #0
    ADD R4 R4 #1

    ADD R2 R4 #0 ; copy current
    NOT R2 R2
    ADD R2 R2 #1 ; negated current
    ADD R0 R3 R2 ; pcoffset 9 = previous - current
    ADD R0 R0 #-1 ; PC is always one more
    LD R1 MASK_PC9 ; only take the left 9 bits
    AND R0 R0 R1
    LD R1 OP_BRNP
    ; BITWISE OR
    NOT R0 R0
    NOT R1 R1
    AND R0 R0 R1
    NOT R0 R0

    STR R0 R4 #0 ; store at current location
    ADD R4 R4 #1 ; increase location pointer

    BR LOOP
CMD_END
    LD R2 CH_END
    ADD R1 R1 R2
    BRnp LOOP
    ; Append HALT instruction to end of program
    LD R0 OP_HALT
    STR R0 R4 #0

    ; start running compiled brainfuck
    LD R1 DATA_START
    LDR R0 R1 #0 ; load first value
    LD R3 MEM_START
    JMP R3

    HALT ; TODO: unnesecarry, can be removed

; OPERATION FRAGMENTS HERE
; R0 = current value (works nicely with IN/OUT)
; R1 = data pointer
OP_INCR
    ADD R0 R0 #1    ; increase value
    STR R0 R1 #0    ; store result
.FILL x0
OP_IN
    GETC            ; input chracter
    STR R0 R1 #0    ; store result
.FILL x0
OP_DECR
    ADD R0 R0 #-1    ; decrease value
    STR R0 R1 #0    ; store result
.FILL x0
OP_OUT
    OUT             ; output chracter
.FILL x0
OP_ML
    ADD R1 R1 #-1   ; decrease data pointer
    LDR R0 R1 #0    ; update current value register
.FILL x0
OP_MR
    ADD R1 R1 #1    ; increase data pointer
    LDR R0 R1 #0    ; update current value register
.FILL x0
OP_PRE_BR .FILL x1020 ; ADD R0 R0 #0 (before the branch to set the condition codes)
OP_BRZ .FILL x0400      ; BRz
OP_BRNP .FILL x0A00     ; BRnp
MASK_PC9 .FILL x01FF     ; pccoffset9 mask
; END OF INSTRUCTION FRAGMENTS

; Put subroutine: appends a program fragment to the location pointer
; Inputs
; - R3: fragment pointer
; - R4: location pointer
; Overwrites: R0 (TODO: can be changed to R3 to peform this in place???)
PUT
    LDR R0 R3 #0    ; load next instruction in R0
    BRz PUT_END     ; terminate on null byte
    STR R0 R4 #0    ; store at current location
    ADD R4 R4 #1    ; increase location pointer
    ADD R3 R3 #1    ; increase copy pointer
    BR PUT
PUT_END
    RET

OP_HALT .FILL xF025
LEFT_MARKER .FILL xFF00
RIGHT_MARKER .FILL x00FF
CH_INCR .FILL #-43  ; +
CH_IN   .FILL #-1   ; , TODO: Optimize distances of -1
CH_DECR .FILL #-1   ; -
CH_OUT  .FILL #-1   ; .
CH_ML   .FILL #-14  ; <
CH_MR   .FILL #-2   ; >
CH_BRZ  .FILL #-29  ; [
CH_BRNZ .FILL #-2   ; ]
CH_END  .FILL #-33  ; ~
STACK_TOP .FILL x31FF
MEM_START .FILL x4000
DATA_START .FILL x5000
.END
