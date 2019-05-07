; buzz_task.S - avr-gcc assembly code

#include "config.h"

; buzzer task
;
;   hook the buzzer to PB4 for this task

            .global     buzz_task
            .global     buzz_init

.equ        BUZZ_MAX,  1               ; service every interrupt

            .section    .data
buzz_counter:
            .byte       0

            .section    .text

;buzz_task - piezo buzzer at 4000Hz
;   uses r16, r17
;
buzz_init:
            sbi     BUZZ_DIR, BUZZ_PIN     ; set to output
            cbi     BUZZ_PORT, BUZZ_PIN    ; start this one with 0
            ret

buzz_task:
            lds     r16, buzz_counter
            inc     r16
            sts     buzz_counter, r16
            ;
            ldi     r17, BUZZ_MAX
            cpse    r16, r17
            rjmp    1f
            ;
            in      r16, BUZZ_PORT
            ldi     r17, (1 << BUZZ_PIN)
            eor     r16, r17
            out     BUZZ_PORT, r16
            ;
2:
            sts     buzz_counter, r1        ; zero the counter
1:
            ret