#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define BILINK 1000

unsigned char count = 0;
int main(){

        DDRD &= ~(1<<2);
        DDRB |= 0xFF;

        PORTB = 0;

        EICRA |= (1<<ISC01);
        EICRA |= (1<<ISC00);


        sei();

        EIMSK |= (1<<INT0);

        while(1){

        }

        return 0;
}

ISR(INT0_vect){

        PORTB = count;
        count++;
        while(PIND & (1<<2)){}

}