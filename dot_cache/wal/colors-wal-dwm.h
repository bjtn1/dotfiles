static const char norm_fg[] = "#c4c6cc";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#646b7b";

static const char sel_fg[] = "#c4c6cc";
static const char sel_bg[] = "#AC9472";
static const char sel_border[] = "#c4c6cc";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
