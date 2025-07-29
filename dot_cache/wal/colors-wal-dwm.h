static const char norm_fg[] = "#cacbcf";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6f7687";

static const char sel_fg[] = "#cacbcf";
static const char sel_bg[] = "#3496C5";
static const char sel_border[] = "#cacbcf";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
