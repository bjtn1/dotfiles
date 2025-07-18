static const char norm_fg[] = "#c8c6ca";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6f657b";

static const char sel_fg[] = "#c8c6ca";
static const char sel_bg[] = "#2962A9";
static const char sel_border[] = "#c8c6ca";

static const char urg_fg[] = "#c8c6ca";
static const char urg_bg[] = "#274D8E";
static const char urg_border[] = "#274D8E";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
