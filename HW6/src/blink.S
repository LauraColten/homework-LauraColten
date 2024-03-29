; Hello Blinky World for AVR
; Author: Roie R. Black and Laura Colten
; Date: April 10, 2019

#include "../include/config.h"

	.section .data
dummy: 	.byte 0		; dummy global variable

        .section .text
        .global     main
        .extern     delay
        .org        0x0000

main:
	; clear the SREG register
        eor     r1, r1                  ; cheap zero
        out     _(SREG), r1                ; clear flag register


        ; set up the stack
        ldi         r28, (RAMEND & 0x00ff)
        ldi         r29, (RAMEND >> 8)
        out         _(SPH), r29
        out         _(SPL), r28

	; initialize the CPU clock to run at full speed
	ldi         r24, 0x80
        sts         CLKPR, r24              ; allow access to clock setup
        sts         CLKPR, r1               ; run at full speed

        ; set up the LED port
        sbi         LED_DIR, LED_PIN        ; set LED pin to output
        cbi         LED_PORT, LED_PIN       ; start with the LED off


        ; enter the blink loop
1:      call        toggle
        call        delay
        rjmp        1b

toggle:
        in          r24, LED_PORT           ; get current bits
        ldi         r25, (1 << LED_PIN)     ; LED is pin 5
        eor         r24, r25                ; flip the bit
        out         LED_PORT, r24           ; write the bits back
        ret

delay:
        ldi      r26, 5
1:

        ldi      r27, 200
2:

        ldi      r28, 200
3:
        dec r28
        brne 3b
        dec r27
        brne 2b
        dec r26
        brne 1b
        ret
