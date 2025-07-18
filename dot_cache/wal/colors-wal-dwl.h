/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc2c7c4ff, 0x000000ff, 0x5c7165ff },
	[SchemeSel]  = { 0xc2c7c4ff, 0x57748Eff, 0x9EB85Cff },
	[SchemeUrg]  = { 0xc2c7c4ff, 0x9EB85Cff, 0x57748Eff },
};
