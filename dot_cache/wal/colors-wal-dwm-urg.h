static const char norm_fg[] = "#c6c2c2";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6f5a5a";

static const char sel_fg[] = "#c6c2c2";
static const char sel_bg[] = "#D26F24";
static const char sel_border[] = "#c6c2c2";

static const char urg_fg[] = "#c6c2c2";
static const char urg_bg[] = "#E05E21";
static const char urg_border[] = "#E05E21";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
