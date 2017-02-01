#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define BILINK 1

unsigned char count = 0;
unsigned int bouceCount = 0;
unsigned char internalSwitch = 0;
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

		while (timer < 100){

			timer++;

			if ((PIND>>2) & 1 ){

			bouceCount++;
			// while(PIND & (1<<2)){}
			
			} else {

				bouceCount = 0;
				internalSwitch = 0;

			}
			_delay_ms(BILINK);

		}
		timer = 0;

		if (bouceCount > 2){

			internalSwitch = 1;
		}

		if (internalSwitch){
			 count++;
			PORTB = count;

		}

}