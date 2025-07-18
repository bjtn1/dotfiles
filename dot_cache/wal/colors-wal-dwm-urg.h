static const char norm_fg[] = "#c8cbcf";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6c7785";

static const char sel_fg[] = "#c8cbcf";
static const char sel_bg[] = "#A0A2A7";
static const char sel_border[] = "#c8cbcf";

static const char urg_fg[] = "#c8cbcf";
static const char urg_bg[] = "#71CAE4";
static const char urg_border[] = "#71CAE4";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
