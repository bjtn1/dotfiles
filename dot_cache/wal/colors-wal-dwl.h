/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc4c3c6ff, 0x000000ff, 0x605d71ff },
	[SchemeSel]  = { 0xc4c3c6ff, 0xF730F5ff, 0xF05B9Aff },
	[SchemeUrg]  = { 0xc4c3c6ff, 0xF05B9Aff, 0xF730F5ff },
};
