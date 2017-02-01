#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define BILINK 100

int main(){

	DDRD &= ~(1<<2);
	DDRB |= (1<<0);

	PORTB = 7;

	EICRA |= (1<<ISC01);
	EICRA |= (0<<ISC00);


	sei();

	EIMSK |= (1<<INT0);

	while(1){

		// PORTB |= (1<<0);

	}

	return 0;
}

ISR(INT0_vect){
	//PORTB |= (1<<0);
	PORTB &= ~(1<<0);
	_delay_ms(BILINK);
	PORTB |= (1<<0);

}