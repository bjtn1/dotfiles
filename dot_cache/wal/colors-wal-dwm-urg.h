static const char norm_fg[] = "#c2c3c6";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#5c5f70";

static const char sel_fg[] = "#c2c3c6";
static const char sel_bg[] = "#9F6553";
static const char sel_border[] = "#c2c3c6";

static const char urg_fg[] = "#c2c3c6";
static const char urg_bg[] = "#5B525C";
static const char urg_border[] = "#5B525C";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
