/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc4c1c1ff, 0x000000ff, 0x6c5858ff },
	[SchemeSel]  = { 0xc4c1c1ff, 0xEC592Cff, 0xC54730ff },
	[SchemeUrg]  = { 0xc4c1c1ff, 0xC54730ff, 0xEC592Cff },
};
