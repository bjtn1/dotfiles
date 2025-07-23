/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc3c2c6ff, 0x000000ff, 0x5f5c70ff },
	[SchemeSel]  = { 0xc3c2c6ff, 0x736C8Bff, 0xB7867Bff },
	[SchemeUrg]  = { 0xc3c2c6ff, 0xB7867Bff, 0x736C8Bff },
};
