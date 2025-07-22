static const char norm_fg[] = "#c3c3c4";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#5f5a6f";

static const char sel_fg[] = "#c3c3c4";
static const char sel_bg[] = "#90363B";
static const char sel_border[] = "#c3c3c4";

static const char urg_fg[] = "#c3c3c4";
static const char urg_bg[] = "#654847";
static const char urg_border[] = "#654847";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
