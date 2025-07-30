/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc6c2c2ff, 0x000000ff, 0x6f5b5bff },
	[SchemeSel]  = { 0xc6c2c2ff, 0xE6B45Fff, 0xED6D4Bff },
	[SchemeUrg]  = { 0xc6c2c2ff, 0xED6D4Bff, 0xE6B45Fff },
};
