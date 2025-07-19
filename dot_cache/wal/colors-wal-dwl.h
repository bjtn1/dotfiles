/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc3c4c7ff, 0x000000ff, 0x5d6372ff },
	[SchemeSel]  = { 0xc3c4c7ff, 0x51778Fff, 0x2F6F91ff },
	[SchemeUrg]  = { 0xc3c4c7ff, 0x2F6F91ff, 0x51778Fff },
};
