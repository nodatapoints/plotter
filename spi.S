#ifndef __ATtiny85__
#   define __ATtiny85__
#endif

; Without this I would have to use
; _SRT_IO_ADDR for every IO Register
#define __SFR_OFFSET 0

#include <avr/io.h>
#include "pins.h"

.global SPI_setup
SPI_setup: 
	ldi r16, _BV(SS_PIN) | _BV(DDB2) | _BV(DDB1)
	out DDRB, r16
	ldi r16, _BV(USIWM0) | _BV(USICS1) | _BV(USICLK)
	out USICR, r16
	sbi PORTB, SS_PIN
                ret

.global SPI_write
SPI_write:
                cli
                cbi PORTB, SS_PIN
                out USIDR, r25
                sbi USISR, USIOIF
spi_loop1:
                sbi USICR, USITC
                sbis USISR, USIOIF
                rjmp spi_loop1

                out USIDR, r24
                sbi USISR, USIOIF
spi_loop2:
                sbi USICR, USITC
                sbis USISR, USIOIF
                rjmp spi_loop2

                sbi PORTB, SS_PIN
                sei
                ret
               
; vim:autoindent ft=avr:ts=16:tw=70
