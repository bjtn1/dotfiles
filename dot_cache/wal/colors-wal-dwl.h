/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc3c4c8ff, 0x000000ff, 0x5f6374ff },
	[SchemeSel]  = { 0xc3c4c8ff, 0x255197ff, 0x274D90ff },
	[SchemeUrg]  = { 0xc3c4c8ff, 0x274D90ff, 0x255197ff },
};
