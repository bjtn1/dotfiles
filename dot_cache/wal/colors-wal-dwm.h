static const char norm_fg[] = "#c3c9c9";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#607676";

static const char sel_fg[] = "#c3c9c9";
static const char sel_bg[] = "#BDCA51";
static const char sel_border[] = "#c3c9c9";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
