.include "includes/log.s"
.data
a:  .int   1

.text
.global main
.extern printf

main:
    push    {ip, lr}

    ldr     r4, =a
    ldr     r0, [r4]
    add     r0, #10
    str     r0, [r4]
    ldr     r1, [r4]
    bl log

    pop     {ip, pc}
    mov     r0, #0
    bx      lr
exit:
    mov     r7, #1
    svc     #0
