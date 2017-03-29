#include <avr/io.h>

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