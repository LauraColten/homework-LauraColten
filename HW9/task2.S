; led_task.S - avr-gcc assembly code

#include "config.h"

; LED task
;
;   This task uses the built-in LED on the Teensy

        .global     led_init
        .global     led_task
        .global     led_on

.equ    LED_MAX,  4000                ; trigger every 1/2 second


        .section    .data
led_countH:         .byte       0
led_countL:         .byte       0

        .section    .text

led_init:
        sts         led_countH, r1     ; clear counter
        sts         led_countL, r1
        ; set up LED port
        sbi         LED_DIR, LED_PIN    ; set up the output port (bit 6)
        cbi         LED_PORT, LED_PIN   ; start off with the LED off
        ret

led_task:
        lds         r26, led_countL        ; load counter
        lds         r27, led_countH
        adiw        r26, 1                  ; increment counter
        sts         led_countL, r26        ; save it back
        sts         led_countH, r27
        ;
        cpi         r26, LED_MAX & 0xff    ; Compare low byte
        ldi         r16, LED_MAX >> 8
        cpc         r27, r16                ; Compare high byte
        brne        1f                      ; branch if not equal
        ;
        in          r16, LED_PORT           ; toggle LED pin
        ldi         r17, (1<<LED_PIN)
        eor         r16, r17                ; flip the LED bit
        ;
        out         LED_PORT, r16           ; set the LED pin
        sts         led_countL, r1         ; and clear the counter
        sts         led_countH, r1
1:
        ret