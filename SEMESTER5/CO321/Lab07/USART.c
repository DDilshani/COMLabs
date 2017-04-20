#include <avr/io.h>

#define BAUD 9600
#define MYUBRR 103

char usart_receive();
void usart_send(char data);
void usart_init();

int main(){

	usart_init();
	char data_rec[256];
	char data_snd[256];

	while(1){

		char ch;
		int i = 0;
		int count = 256;

		int j;
		for (j = 0; j<256; j++){
			data_snd[j] = 'a';
		}
		// data_snd[255] = '\r';

		for (i = 0; i < count; i++){
			usart_send(data_snd[i]);
		}

		while((ch = usart_receive()) != '\r'){
			data_rec[i] = ch;
			i++;
		}

	}
}


void usart_init(){

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

char usart_receive(){
	while (UCSR0A && (1 << RXC0) == 0) {
	}

	char data = UDR0;
	return data;
}

void usart_send(char data){

	while (UCSR0A && (1 << UDRE0) == 0) {
	}

	UDR0 = data;

}