static const char norm_fg[] = "#c4c4ca";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#646379";

static const char sel_fg[] = "#c4c4ca";
static const char sel_bg[] = "#863D6F";
static const char sel_border[] = "#c4c4ca";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
