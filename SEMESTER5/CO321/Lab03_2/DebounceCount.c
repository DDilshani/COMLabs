#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define BILINK 1

unsigned char count = 0;
unsigned char bounces = 0;
int timer = 0;


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
        // wait for 1 second to check bounces
        while(timer < 1000){
                timer++;
                _delay_ms(BILINK);
                if (PIND & (1<<2)){
                        bounces++;
                        while(PIND & (1<<2)){}      // wait for next bounce
                }
        }

        // if some event happens...
        if (bounces > 0){
                PORTB = count;
                count++;
                bounces = 0;

        } else {
                bounces = 0;
        }
        timer = 0;
}