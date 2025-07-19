static const char norm_fg[] = "#c6c4c6";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6b5e74";

static const char sel_fg[] = "#c6c4c6";
static const char sel_bg[] = "#D7996E";
static const char sel_border[] = "#c6c4c6";

static const char urg_fg[] = "#c6c4c6";
static const char urg_bg[] = "#B0966D";
static const char urg_border[] = "#B0966D";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
