static const char norm_fg[] = "#c6cacf";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6a7581";

static const char sel_fg[] = "#c6cacf";
static const char sel_bg[] = "#3272A9";
static const char sel_border[] = "#c6cacf";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
