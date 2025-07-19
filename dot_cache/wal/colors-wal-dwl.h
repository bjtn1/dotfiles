/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc2c3c6ff, 0x000000ff, 0x5a626fff },
	[SchemeSel]  = { 0xc2c3c6ff, 0x916A62ff, 0x675D62ff },
	[SchemeUrg]  = { 0xc2c3c6ff, 0x675D62ff, 0x916A62ff },
};
