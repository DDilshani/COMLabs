#include <avr/io.h>
#include <util/delay.h>

#define BLINK_DELAY_MS 100

int main(){
	
	DDRD &= (1<<7);

	DDRB |= 0xFF;

	// PORTB = 111; 
	
	unsigned char count = 0;
	PORTB = count;

	while (1){
		if (PIND & (1<<7)){
			PORTB = count;
			count++;
			while(PIND & (1<<7)){}
		}		
	}

}
