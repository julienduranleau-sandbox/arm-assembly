.data
    log_top: .asciz "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n┃ Reg | Decimal     | Hex         ┃\n┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┃\n" 
    log_str: .asciz "┃ r%-2.1d | %-11.1d | #%-11.1X┃\n"
    log_bot: .asciz "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n" 

.text
.global main
.extern printf

log:
    push    {ip, lr}

    push    {r0,r1,r2,r3}
    push    {r6,r8,r9,r10}
    mov     r6, r0
    mov     r8, r1
    mov     r9, r2
    mov     r10, r3

    @ Cap
    ldr     r0, =log_top
    bl      printf

    @ R0
    ldr     r0, =log_str
    mov     r1, #0
    mov     r2, r6
    mov     r3, r6
    bl      printf
    @ R1
    ldr     r0, =log_str
    mov     r1, #1
    mov     r2, r8
    mov     r3, r8
    bl      printf
    @ R2
    ldr     r0, =log_str
    mov     r1, #2
    mov     r2, r9
    mov     r3, r9
    bl      printf
    @ R3
    ldr     r0, =log_str
    mov     r1, #3
    mov     r2, r10
    mov     r3, r10
    bl      printf

    pop     {r6,r8,r9,r10}

    @ R4
    ldr     r0, =log_str
    mov     r1, #4
    mov     r2, r4
    mov     r3, r4
    bl      printf
    @ R5
    ldr     r0, =log_str
    mov     r1, #5
    mov     r2, r5
    mov     r3, r5
    bl      printf
    @ R6
    ldr     r0, =log_str
    mov     r1, #6
    mov     r2, r6
    mov     r3, r6
    bl      printf
    @ R7
    ldr     r0, =log_str
    mov     r1, #7
    mov     r2, r7
    mov     r3, r7
    bl      printf
    @ R8
    ldr     r0, =log_str
    mov     r1, #8
    mov     r2, r8
    mov     r3, r8
    bl      printf
    @ R9
    ldr     r0, =log_str
    mov     r1, #9
    mov     r2, r9
    mov     r3, r9
    bl      printf
    @ R10
    ldr     r0, =log_str
    mov     r1, #10
    mov     r2, r10
    mov     r3, r10
    bl      printf
    @ Cap
    ldr     r0, =log_bot
    bl      printf

    pop     {r0,r1,r2,r3}
    pop     {ip, pc}
    bx      lr

