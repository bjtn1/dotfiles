static const char norm_fg[] = "#c8cccc";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6a827e";

static const char sel_fg[] = "#c8cccc";
static const char sel_bg[] = "#1399AF";
static const char sel_border[] = "#c8cccc";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
