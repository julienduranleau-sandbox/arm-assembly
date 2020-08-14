.data
.balign 4
    binary_str_truncated: .asciz "0000 0000 0000 0000"

.text

int_to_binary_str_truncated:
    @ r0: int

    push    {r1-r10, lr}
    
    mov     r10, #0
    mov     r8, #48
    mov     r9, #49
    ldr     r3, =binary_str_truncated
    add     r3, #18  @16 numbers - 1(current) + 3 spaces

int_to_binary_str_truncated_loop:
    and     r2, r0, #0b1
    cmp     r2, #0
    streqb  r8, [r3]
    strneb  r9, [r3]
    sub     r3, #1
    add     r10, #1
    mov     r0, r0, lsr #1

    cmp     r10, #4
    subeq   r3, #1
    cmp     r10, #8
    subeq   r3, #1
    cmp     r10, #12
    subeq   r3, #1

    cmp     r10, #16
    blt     int_to_binary_str_truncated_loop

    ldr     r0, =binary_str_truncated
    pop     {r1-r10, pc}
