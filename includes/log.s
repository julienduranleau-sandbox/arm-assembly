.include "includes/int_to_binary_str_truncated.s"

.extern printf

.data
log_top1: .asciz "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n" 
log_top2: .asciz "┃ Reg | Decimal     | Hex          | Binary (truncated)  ┃\n" 
log_top3: .asciz "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┃\n" 
log_str:  .asciz "┃ r%-2.1d | %-11.1d | #%-11.1X | %s ┃\n"
log_bot:  .asciz "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n" 

.text
log:
    push    {r0-r10, lr}

    @ Top box cap
    ldr     r0, =log_top1
    bl      printf
    ldr     r0, =log_top2
    bl      printf
    ldr     r0, =log_top3
    bl      printf

    mov     r10, #0     @ counter 0..=10

log_loop:
    ldr     r5, [sp, r10, lsl #2] @ Value in stack for register `n` (r2 = sp[r10])
    mov     r0, r5
    bl      int_to_binary_str_truncated
    mov     r4, r0

    ldr     r0, =log_str
    mov     r1, r10               @ Register n 
    ldr     r2, [sp, r10, lsl #2] @ Value in stack for register `n` (r2 = sp[r10])
    mov     r3, r2                @ Same value but displayed in hex
    push    {r4}
    bl      printf
    pop     {r4}
    add     r10, #1     @ counter += 1
    cmp     r10, #10    @ counter vs 10
    ble     log_loop    @ loop if counter <= 10

    @ Bottom box cap
    ldr     r0, =log_bot
    bl      printf

    pop     {r0-r10, pc}

