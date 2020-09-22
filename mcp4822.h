#ifndef _MCP4822_H_
#define _MCP4822_H_

#include <inttypes.h>
#include "spi.h"

#define CHANNEL_BIT 15
#define CH_A 0
#define CH_B 1

#ifdef DOUBLE_GAIN
#   define SETUP_MASK 0x1000
#else
#   define SETUP_MASK 0x3000
#endif

void analog_write(uint16_t value, char channel);

#endif  // _MCP4822_H_
