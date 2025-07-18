static const char norm_fg[] = "#c6c2c2";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6f5b5b";

static const char sel_fg[] = "#c6c2c2";
static const char sel_bg[] = "#E6B45F";
static const char sel_border[] = "#c6c2c2";

static const char urg_fg[] = "#c6c2c2";
static const char urg_bg[] = "#ED6D4B";
static const char urg_border[] = "#ED6D4B";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
