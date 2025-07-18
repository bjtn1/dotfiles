/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xddd1d8ff, 0x000000ff, 0xa18d99ff },
	[SchemeSel]  = { 0xddd1d8ff, 0x92ABD8ff, 0xB19CC5ff },
	[SchemeUrg]  = { 0xddd1d8ff, 0xB19CC5ff, 0x92ABD8ff },
};
