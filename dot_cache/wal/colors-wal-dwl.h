/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc4c3c4ff, 0x000000ff, 0x6e5a6eff },
	[SchemeSel]  = { 0xc4c3c4ff, 0xDE9574ff, 0xB38478ff },
	[SchemeUrg]  = { 0xc4c3c4ff, 0xB38478ff, 0xDE9574ff },
};
