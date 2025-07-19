/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc1c5c5ff, 0x000000ff, 0x596d6dff },
	[SchemeSel]  = { 0xc1c5c5ff, 0x2B5366ff, 0x31454Fff },
	[SchemeUrg]  = { 0xc1c5c5ff, 0x31454Fff, 0x2B5366ff },
};
