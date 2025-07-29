/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc8caccff, 0x000000ff, 0x6a7382ff },
	[SchemeSel]  = { 0xc8caccff, 0xCCBBBFff, 0x93A0AFff },
	[SchemeUrg]  = { 0xc8caccff, 0x93A0AFff, 0xCCBBBFff },
};
