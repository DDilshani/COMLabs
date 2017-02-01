avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -o led interCount_switchDebounce.c
avr-objcopy -O ihex -R .eeprom led led.hex
avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:led.hex

