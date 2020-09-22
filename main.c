#include <inttypes.h>

#include "spi.h"
#include "mcp4822.h"


int main() {
    SPI_setup();

    uint16_t vout = 0;
    while (1) {
        analog_write(vout, CH_B);
        vout += 128;
    }
}
