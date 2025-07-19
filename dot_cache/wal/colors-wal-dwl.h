/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc8ccccff, 0x000000ff, 0x6a827eff },
	[SchemeSel]  = { 0xc8ccccff, 0x2C9FA9ff, 0x1399AFff },
	[SchemeUrg]  = { 0xc8ccccff, 0x1399AFff, 0x2C9FA9ff },
};
