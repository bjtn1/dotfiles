static const char norm_fg[] = "#c6cfc8";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6b826f";

static const char sel_fg[] = "#c6cfc8";
static const char sel_bg[] = "#A66886";
static const char sel_border[] = "#c6cfc8";

static const char urg_fg[] = "#c6cfc8";
static const char urg_bg[] = "#506F93";
static const char urg_border[] = "#506F93";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
