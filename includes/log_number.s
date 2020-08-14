.include "includes/division.s"

.data
    log_one_number_var: .word 0
    log_n_numbers: .word 1000000000,100000000,10000000,1000000,100000,10000,1000,100,10
    log_n_numbers_len: .word (.-log_n_numbers)/4

.text

log_number:
    push    {r0-r10, lr}
    
    mov     r10, r0     @ working copy of number to display
    ldr     r8, =log_n_numbers
    ldr     r9, =log_n_numbers_len
    ldr     r9, [r9]

    mov     r6, #0      @ i = 0
    mov     r5, #0      @ flag, turns 1 when on first non-zero

log_number_loop:
        mov     r0, r10
        ldr     r1, [r8, r6, lsl #2]  @ r1 = r8[r6] || r1 = log_n_numbers[i]

        bl      division
        cmp     r0, #0
        orrne   r5, #1      @ Set flag to 1 on first non-zero number
        movne   r10, r1     @ update current number with remainder of division
        cmp     r5, #1      @ If the number isn't a starting 0
        blge    log_one_number

        add     r6, #1      @ i += 1
        cmp     r6, r9      @ i == size of log_n_numbers
        blt     log_number_loop

    @ Last digit
    mov     r0, r10
    bl      log_one_number

    @ Newline
    mov     r0, #10 - 48 @ newline (10) - 48 for number offset (hack to use same fn)
    bl      log_one_number

    pop     {r0-r10, pc}

log_one_number:
    push    {r7, lr}
    add     r0, #48
    ldr     r1, =log_one_number_var
    str     r0, [r1]

    @ print
    mov     r0, #1
    ldr     r1, =log_one_number_var
    mov     r2, #1
    mov     r7, #4
    svc     #0

    pop     {r7, pc}
   
