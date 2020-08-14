.include "includes/log.s"
.extern printf
.extern scanf

.data
    scan_question: .asciz "Enter a number: "
    scan_format: .asciz "%d"
    scanned_number: .int 0

.global main

.text
main:
    push    {ip, lr}

    @ Ask question
    ldr     r0, =scan_question
    bl      printf
    
    @ Capture answer
    ldr     r0, =scan_format
    ldr     r1, =scanned_number
    bl      scanf

    @ Load answer
    ldr     r0, =scanned_number
    ldr     r0, [r0]

    @ Debug
    bl      log

    pop     {ip, pc}
