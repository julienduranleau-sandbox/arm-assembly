.data
    str_n: .asciz "%d\n"
    n: .word 48
    n2: .word 6
.include "includes/log.s"
.text
.global main
.extern printf
.extern putc

main:
    push    {ip, lr}


    ldr     r4, =n          @ Load variable `n` adress in R4
    ldr     r3, [r4]        @ Load in R3 the value at the adress of R4
    ldr     r6, =n2         @ Load variable `n2` adress in R6
    ldr     r5, [r6]        @ Load in R5 the value at the adress of R6
    add     r2, r3, r5      @ R2 = R3 + R5


    ldr     r0, =str_n      @ String format for printf
    mov     r1, r2          @ Copy result in R1 for printf
    bl      log
    bl      printf          @ Call printf

    pop     {ip, pc}
    mov     r0, #0
    bx      lr
