/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc4caccff, 0x000000ff, 0x65777cff },
	[SchemeSel]  = { 0xc4caccff, 0x265B93ff, 0x134C89ff },
	[SchemeUrg]  = { 0xc4caccff, 0x134C89ff, 0x265B93ff },
};
