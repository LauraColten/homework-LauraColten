//Author: Roie Black and Laura Colten
#include <avr/io.h>
#include <util/delay.h>

// Buzzer is pin 4 on UNO
#define BUZZ_PIN         4
#define BUZZ_ON          (PORTB |= (1<<BUZZ_PIN))
#define BUZZ_OFF         (PORTB &= ~(1<<BUZZ_PIN))

#define BUZZ_CONFIG      (DDRB |= (1<<BUZZ_PIN))
#define CPU_PRESCALE(n) (CLKPR = 0x80, CLKPR = (n))

int main(void) {

    CPU_PRESCALE(0);
    BUZZ_CONFIG;
    BUZZ_OFF;

    while(1){
        BUZZ_ON;
        _delay_ms(2);
        BUZZ_OFF;
        _delay_ms(2);
    }
}