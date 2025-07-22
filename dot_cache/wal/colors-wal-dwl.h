/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc2c1c4ff, 0x000000ff, 0x5b596cff },
	[SchemeSel]  = { 0xc2c1c4ff, 0xEA5731ff, 0xD23B3Aff },
	[SchemeUrg]  = { 0xc2c1c4ff, 0xD23B3Aff, 0xEA5731ff },
};
