/*************************************************************************
Title:    Testing output to a HD44780 based LCD display.
Author:   Peter Fleury  <pfleury@gmx.ch>  http://tinyurl.com/peterfleury
File:     $Id: test_lcd.c,v 1.8 2015/01/31 18:04:08 peter Exp $
Software: AVR-GCC 4.x
Hardware: HD44780 compatible LCD text display
          AVR with external SRAM interface if memory-mapped LCD interface is used
          any AVR with 7 free I/O pins if 4-bit IO port mode is used
**************************************************************************/
#include <stdlib.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include "lcd.h"


/*
** constant definitions
*/
static const PROGMEM unsigned char copyRightChar[] =
{
  0x07, 0x08, 0x13, 0x14, 0x14, 0x13, 0x08, 0x07,
  0x00, 0x10, 0x08, 0x08, 0x08, 0x08, 0x10, 0x00
};

void display(int n, char words[]){

    if (n == 1){
        /* put string to display (line 1) with linefeed */
        lcd_puts(words);
    }

    if (n == 2){
        /* put string to display (line 2) with linefeed */
        lcd_putc('\n');
        lcd_puts(words);
    }

}

void displayChar(int n, char c){

    if (n == 1){
        /* put string to display (line 1) with linefeed */
        lcd_putc(c);
    }

    if (n == 2){
        /* put string to display (line 2) with linefeed */
        lcd_putc('\n');
        lcd_putc(c);
    }

}

int main(void){

    char s[] = "Enter the key :"; 

    lcd_init(LCD_DISP_ON);

    /* clear display and home cursor */
    lcd_clrscr();

    display(1,s);
    display(2,s);

    _delay_ms(5000);
    lcd_clrscr();

    char c = 'a';
    displayChar(1,c);
    displayChar(2,c);

    _delay_ms(5000);

    
}
