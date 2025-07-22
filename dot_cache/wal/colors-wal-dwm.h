static const char norm_fg[] = "#c7cbcc";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#687d7f";

static const char sel_fg[] = "#c7cbcc";
static const char sel_bg[] = "#68CAFC";
static const char sel_border[] = "#c7cbcc";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
