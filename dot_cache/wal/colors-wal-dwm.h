static const char norm_fg[] = "#c6c3c2";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#70615b";

static const char sel_fg[] = "#c6c3c2";
static const char sel_bg[] = "#D96829";
static const char sel_border[] = "#c6c3c2";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
