static const char norm_fg[] = "#c8c9d2";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#707389";

static const char sel_fg[] = "#c8c9d2";
static const char sel_bg[] = "#6693CE";
static const char sel_border[] = "#c8c9d2";

static const char urg_fg[] = "#c8c9d2";
static const char urg_bg[] = "#3C82CE";
static const char urg_border[] = "#3C82CE";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
