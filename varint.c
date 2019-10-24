#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
//#include <arpa/inet.h>

#include "varint.h"

int varint_decode(int64_t *result, uint8_t *varint_p, uint8_t **end) {
	uint8_t *p = varint_p;
	int length = 1;
	int64_t value = 0;

	for (; length<9 && (*p & 0x80); length++, p++) {
		value <<= 7;
		value |= (*p & 0x7f);
	}

	if (value & 0x70000000000000)
		value <<= 1;

	value <<= 7;
	value |= *p;

	if (end != NULL)
		*end = ++p;

	*result = value;

	return length;
}


