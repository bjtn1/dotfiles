/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc8c9d2ff, 0x000000ff, 0x707389ff },
	[SchemeSel]  = { 0xc8c9d2ff, 0x6693CEff, 0x3C82CEff },
	[SchemeUrg]  = { 0xc8c9d2ff, 0x3C82CEff, 0x6693CEff },
};
