/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc7c3c2ff, 0x000000ff, 0x71615cff },
	[SchemeSel]  = { 0xc7c3c2ff, 0x7C8476ff, 0x8F725Aff },
	[SchemeUrg]  = { 0xc7c3c2ff, 0x8F725Aff, 0x7C8476ff },
};
