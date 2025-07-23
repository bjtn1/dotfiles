static const char norm_fg[] = "#c7c2c7";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#715d71";

static const char sel_fg[] = "#c7c2c7";
static const char sel_bg[] = "#C49171";
static const char sel_border[] = "#c7c2c7";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
