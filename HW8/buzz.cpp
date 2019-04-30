#include <avr/io.h>
#include <util/delay.h>

#define CLOCK_PRESCALE(n)   (CLKPR = 0x80, CLKPR = (n))
#define BUZZER_CONFIG       (DDRB |= (1<<4))
#define BUZZ_ON             (PORTD |= (1<<7))
#define BUZZ_OFF            (PORTD &= ~(1<<7))

int main(void){
    CLOCK_PRESCALE(0);
    BUZZER_CONFIG;
    while(1) {
        BUZZ_ON;
        _delay_us(200);
        BUZZ_OFF;
        _delay_us(200);
    }
}