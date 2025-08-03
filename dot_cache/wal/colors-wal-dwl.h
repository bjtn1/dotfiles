/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc5c7c7ff, 0x000000ff, 0x607572ff },
	[SchemeSel]  = { 0xc5c7c7ff, 0x95A8A4ff, 0x6AC5ADff },
	[SchemeUrg]  = { 0xc5c7c7ff, 0x6AC5ADff, 0x95A8A4ff },
};
