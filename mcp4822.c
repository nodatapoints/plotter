#include "mcp4822.h"

void analog_write(uint16_t value, char channel) {
    SPI_write(SETUP_MASK
        | (channel << CHANNEL_BIT)
        | (value & 0x0FFF)
    );
}
