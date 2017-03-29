#include <avr/io.h>

#define BAUD 9600
#define MYUBRR FOSC/16/BAUD-1

int main(){

	usart_init();
	char data_rec[256];
	char data_snd[256];

	while(1){

		char ch;
		int i = 0;
		int count;

		while((ch = usart_receive()) != '\r'){
			data_rec[i] = ch;
			i++;
		}

		count = i;

		for (i = 0; i < count; ++i){
			usart_send(data_snd[i]);
		}
	}
}

usart_init(){

	//Set baud rate 
	UBRR0H = (unsigned char)(MYUBRR>>8);
	UBRR0L = (unsigned char)MYUBRR;

	//Enable receiver and transmitter 
	UCSR0B = (1<<RXEN0)|(1<<TXEN0);

	//Set frame format: 8data
	UCSR0C |= (1<<UCSZ00);
	UCSR0C |= (1<<UCSZ01);

	//USCR0C --> UPMn1, UPMn0 = 0 --> set parity bits = 0


}