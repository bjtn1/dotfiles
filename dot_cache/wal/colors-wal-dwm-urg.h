static const char norm_fg[] = "#c4c2c7";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#655c71";

static const char sel_fg[] = "#c4c2c7";
static const char sel_bg[] = "#B8807A";
static const char sel_border[] = "#c4c2c7";

static const char urg_fg[] = "#c4c2c7";
static const char urg_bg[] = "#9C4C6D";
static const char urg_border[] = "#9C4C6D";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
