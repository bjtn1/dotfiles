/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc5c8cdff, 0x000000ff, 0x67707eff },
	[SchemeSel]  = { 0xc5c8cdff, 0x437CC5ff, 0x3478CAff },
	[SchemeUrg]  = { 0xc5c8cdff, 0x3478CAff, 0x437CC5ff },
};
