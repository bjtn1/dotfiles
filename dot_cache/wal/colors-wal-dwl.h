/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x000000ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc7c2c3ff, 0x000000ff, 0x725d5fff },
	[SchemeSel]  = { 0xc7c2c3ff, 0xF09863ff, 0xE27051ff },
	[SchemeUrg]  = { 0xc7c2c3ff, 0xE27051ff, 0xF09863ff },
};
