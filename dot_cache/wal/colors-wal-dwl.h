/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc5c5caff, 0x000000ff, 0x656379ff },
	[SchemeSel]  = { 0xc5c5caff, 0xAE86A7ff, 0x5D92C3ff },
	[SchemeUrg]  = { 0xc5c5caff, 0x5D92C3ff, 0xAE86A7ff },
};
