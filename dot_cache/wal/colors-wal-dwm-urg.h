static const char norm_fg[] = "#cbcdd0";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#707e8a";

static const char sel_fg[] = "#cbcdd0";
static const char sel_bg[] = "#96B4CE";
static const char sel_border[] = "#cbcdd0";

static const char urg_fg[] = "#cbcdd0";
static const char urg_bg[] = "#C1AAAF";
static const char urg_border[] = "#C1AAAF";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
