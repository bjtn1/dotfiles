/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xcbcdd0ff, 0x000000ff, 0x707e8aff },
	[SchemeSel]  = { 0xcbcdd0ff, 0x96B4CEff, 0xC1AAAFff },
	[SchemeUrg]  = { 0xcbcdd0ff, 0xC1AAAFff, 0x96B4CEff },
};
