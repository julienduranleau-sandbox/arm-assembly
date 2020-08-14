.data
    loop_str: .asciz "r10 is : %d\n" 
.text
.global main
.extern printf

main:
    push    {ip, lr}

    mov     r10, #0         @ i = 0
loop:
    ldr     r0, =loop_str   @ debug only
    mov     r1, r10         @ debug only
    bl      printf          @ debug only

    ADD     r10, #1         @ i++
    CMP     r10, #10        @ if
    BLT     loop            @   (i < 10) { goto loop }

    pop     {ip, pc}
    mov     r0, #0
    bx      lr
