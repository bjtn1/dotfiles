static const char norm_fg[] = "#c3c2c7";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#615d72";

static const char sel_fg[] = "#c3c2c7";
static const char sel_bg[] = "#684C68";
static const char sel_border[] = "#c3c2c7";

static const char urg_fg[] = "#c3c2c7";
static const char urg_bg[] = "#573264";
static const char urg_border[] = "#573264";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
