static const char norm_fg[] = "#c6caca";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#647a7a";

static const char sel_fg[] = "#c6caca";
static const char sel_bg[] = "#57A4A8";
static const char sel_border[] = "#c6caca";

static const char urg_fg[] = "#c6caca";
static const char urg_bg[] = "#4B95AE";
static const char urg_border[] = "#4B95AE";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
