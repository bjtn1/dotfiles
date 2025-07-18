static const char norm_fg[] = "#ddd1d8";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#a18d99";

static const char sel_fg[] = "#ddd1d8";
static const char sel_bg[] = "#92ABD8";
static const char sel_border[] = "#ddd1d8";

static const char urg_fg[] = "#ddd1d8";
static const char urg_bg[] = "#B19CC5";
static const char urg_border[] = "#B19CC5";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
