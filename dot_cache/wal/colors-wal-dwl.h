/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc3c2c7ff, 0x000000ff, 0x615d72ff },
	[SchemeSel]  = { 0xc3c2c7ff, 0x684C68ff, 0x573264ff },
	[SchemeUrg]  = { 0xc3c2c7ff, 0x573264ff, 0x684C68ff },
};
