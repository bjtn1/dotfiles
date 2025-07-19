/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc5c3c1ff, 0x000000ff, 0x6d6259ff },
	[SchemeSel]  = { 0xc5c3c1ff, 0x3D4041ff, 0x6C5234ff },
	[SchemeUrg]  = { 0xc5c3c1ff, 0x6C5234ff, 0x3D4041ff },
};
