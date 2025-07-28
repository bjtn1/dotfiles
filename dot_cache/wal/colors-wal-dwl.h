/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc4c6ccff, 0x000000ff, 0x646b7bff },
	[SchemeSel]  = { 0xc4c6ccff, 0x225BA1ff, 0xAC9472ff },
	[SchemeUrg]  = { 0xc4c6ccff, 0xAC9472ff, 0x225BA1ff },
};
