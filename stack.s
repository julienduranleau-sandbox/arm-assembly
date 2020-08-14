.include "includes/log.s"
.global main

main:

    mov     r4, #42
    mov     r5, #10

    @ Long tedius way one by one
    str     r4, [sp, #-4]!  @ same as push {r4}
    str     r5, [sp, #-4]!  @ same as push {r5}
    ldr     r0, [sp], #+4   @ same as pop {r0}
    ldr     r1, [sp], #+4   @ same as pop {r0}

    @ Multiple load, unload one at a time
    stmdb   sp!, {r4, r5}
    ldmia   sp!, {r0}
    ldmia   sp!, {r1}

    @ Multiple load, multiple unload
    stmdb   sp!, {r4, r5}
    ldmia   sp!, {r0, r1}

    @ Syntaxical sugar: Multiple load single unload
    push    {r4, r5}
    pop     {r0}
    pop     {r1}

    @ Syntaxical sugar: Multiple load, multiple unload
    push    {r4, r5}
    pop     {r4, r5}

    bl log


    mov     r7, #1
    svc     #0

