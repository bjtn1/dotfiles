static const char norm_fg[] = "#c4c2c7";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#645e72";

static const char sel_fg[] = "#c4c2c7";
static const char sel_bg[] = "#603889";
static const char sel_border[] = "#c4c2c7";

static const char urg_fg[] = "#c4c2c7";
static const char urg_bg[] = "#5B4C70";
static const char urg_border[] = "#5B4C70";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
