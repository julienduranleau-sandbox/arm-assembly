.include "includes/log.s"
.include "includes/log_number.s"

.data
    num: .word 502800

.global main
.text

main:
    ldr     r0, =num
    ldr     r0, [r0]
    mov     r0, #123

    bl      log_number

    mov     r0, #0
    bl      exit
   
exit:
    mov     r7, #1
    svc     #0
