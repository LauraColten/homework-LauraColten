#include "config.h"

; pulse_task - Servo task - service at 50Hz

            .global     pulse_task
            .global     pulse_init

.equ        PULSE_MAX,  160

            .section    .data
pulse_countH:
            .byte       0
pulse_countL:
            .byte       0

            .section    .text

pulse_init:
            sts         pulse_countH, r1         ; clear counter
            sts         pulse_countL, r1
            sbi         PULSE_DIR, PULSE_PIN
            ret

pulse_task:
            lds         r26, pulse_countL        ; load counter into X
            lds         r27, pulse_countH
            adiw        r26, 1                  ; increment counter
            sts         pulse_countL, r26        ; save it back
            sts         pulse_countH, r27
            ;
            cpi         r26, PULSE_MAX & 0xff   ; Compare low byte
            ldi         r16, PULSE_MAX >> 8
            cpc         r27, r16                ; Compare high byte
            brne        1f                      ; branch if not equal
            ;
            in          r16, PULSE_PORT         ; toggle LED pin
            ldi         r17, (1<<PULSE_PIN)
            eor         r16, r17                ; flip the LED bit
            ;
            out         PULSE_PORT, r16         ; set the LED pin
            sts         pulse_countL, r1         ; and clear the counter
            sts         pulse_countH, r1
1:
            ret