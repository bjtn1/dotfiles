static const char norm_fg[] = "#c7cbcb";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#687f7f";

static const char sel_fg[] = "#c7cbcb";
static const char sel_bg[] = "#9BA5A0";
static const char sel_border[] = "#c7cbcb";

static const char urg_fg[] = "#c7cbcb";
static const char urg_bg[] = "#6DBFC4";
static const char urg_border[] = "#6DBFC4";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
