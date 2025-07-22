static const char norm_fg[] = "#c4c3c4";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6e5a6e";

static const char sel_fg[] = "#c4c3c4";
static const char sel_bg[] = "#DE9574";
static const char sel_border[] = "#c4c3c4";

static const char urg_fg[] = "#c4c3c4";
static const char urg_bg[] = "#B38478";
static const char urg_border[] = "#B38478";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
