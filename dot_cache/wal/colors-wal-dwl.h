/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc1c3c4ff, 0x000000ff, 0x59626cff },
	[SchemeSel]  = { 0xc1c3c4ff, 0xE0DB0Eff, 0xC4AB3Fff },
	[SchemeUrg]  = { 0xc1c3c4ff, 0xC4AB3Fff, 0xE0DB0Eff },
};
