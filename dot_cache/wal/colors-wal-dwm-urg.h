static const char norm_fg[] = "#c5c8cd";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#67707e";

static const char sel_fg[] = "#c5c8cd";
static const char sel_bg[] = "#437CC5";
static const char sel_border[] = "#c5c8cd";

static const char urg_fg[] = "#c5c8cd";
static const char urg_bg[] = "#3478CA";
static const char urg_border[] = "#3478CA";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
