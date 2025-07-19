static const char norm_fg[] = "#c1c4c5";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#596b6d";

static const char sel_fg[] = "#c1c4c5";
static const char sel_bg[] = "#01536E";
static const char sel_border[] = "#c1c4c5";

static const char urg_fg[] = "#c1c4c5";
static const char urg_bg[] = "#026958";
static const char urg_border[] = "#026958";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
