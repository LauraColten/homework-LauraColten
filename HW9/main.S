; main.S - avr-gcc assembly language

#include "config.h"

        .extern Timer0Setup
        .extern trigger

        .extern buzz_task
        .extern buzz_init
        .extern led_task
        .extern led_init
        ; .extern pulse_task
        ; .extern pulse_init

        .section    .text
        .global main

main:
        ; set up the system clock
        ldi     r24, 0x80               ; set up prescaler
        sts     CLKPR, r24
        sts     CLKPR, r1               ; set to full speed

        ; initialize the system
        call    Timer0Setup
        call    buzz_init
        call    led_init
        ; call    pulse_init

        ; task management loop
1:
        lds     r16, trigger
        cpi     r16, 1                  ; gone off yet?
        brne    1b                      ; wait for it
        call    buzz_task
        call    led_task
        ; call    pulse_task
        sts     trigger, r1             ; turn off the trigger
        rjmp    1b

