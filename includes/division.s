.text

division:
    push    { r2, lr }
    mov     r2, #0
division_loop:
    CMP     r0, r1
    BLT     division_end
    SUB     r0, r1
    ADD     r2, #1
    B       division_loop

division_end:
    mov     r1, r0      @ remain
    mov     r0, r2      @ division result
    pop     { r2, pc }
