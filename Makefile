.PHONY: clean check upload

PROGRAMMER=usbasp
CHIP=attiny85

AVRDUDE=avrdude -c ${PROGRAMMER} -p ${CHIP}
CPPFLAGS=-mmcu=${CHIP} 
CFLAGS=-O2
CC=avr-gcc

upload: main.hex
		${AVRDUDE} -U flash:w:$<

main.hex: main.elf
		avr-objcopy -O ihex $^ $@

main.elf: main.o mcp4822.o spi.o
		${CC} ${CFLAGS} ${CPPFLAGS} -o $@ $^

check:
		${AVRDUDE}

clean:
		rm -rvf *.o *.hex *.elf

