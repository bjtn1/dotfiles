/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc6c3c2ff, 0x000000ff, 0x70615bff },
	[SchemeSel]  = { 0xc6c3c2ff, 0xAB7251ff, 0xD96829ff },
	[SchemeUrg]  = { 0xc6c3c2ff, 0xD96829ff, 0xAB7251ff },
};
