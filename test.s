.include "includes/log.s"
.include "includes/int_to_binary_str_full.s"
.extern puts
.data
abc: .word 1386564178
abc2: .word 123
abc3: .word 541
.global main
.text
main:
    push    {lr}

    ldr     r0, =abc
    ldr     r0, [r0]
    mov     r1, #11
    mov     r2, #22
    mov     r3, #13
    mov     r4, #14
    mov     r5, #15
    mov     r6, #16
    mov     r7, #17
    mov     r8, #18
    mov     r9, #19
    mov     r10, #20

    bl      log

    bl int_to_binary_str_full
    bl puts

    pop     {pc}
