static const char norm_fg[] = "#c2c1c4";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#5b596c";

static const char sel_fg[] = "#c2c1c4";
static const char sel_bg[] = "#D23B3A";
static const char sel_border[] = "#c2c1c4";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
