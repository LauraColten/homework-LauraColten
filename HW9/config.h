; config.h - pin assignments for this project

#include <avr/io.h>

#define     LED_PORT   _(PORTB)
#define     LED_DIR    _(DDRB)
#define     LED_PIN    5

#define     BUZZ_PORT  _(PORTB)
#define     BUZZ_DIR   _(DDRB)
#define     BUZZ_PIN   4

#define     PULSE_DIR  _(DDRD)
#define     PULSE_PORT _(PORTD)
#define     PULSE_PIN  7

// include this line to avoid SFR_REG issues
#define _(s)    _SFR_IO_ADDR(s)