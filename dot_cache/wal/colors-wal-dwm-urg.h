static const char norm_fg[] = "#c2c7c4";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#5c7165";

static const char sel_fg[] = "#c2c7c4";
static const char sel_bg[] = "#57748E";
static const char sel_border[] = "#c2c7c4";

static const char urg_fg[] = "#c2c7c4";
static const char urg_bg[] = "#9EB85C";
static const char urg_border[] = "#9EB85C";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
