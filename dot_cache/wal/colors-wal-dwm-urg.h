static const char norm_fg[] = "#c1c3c4";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#59626c";

static const char sel_fg[] = "#c1c3c4";
static const char sel_bg[] = "#E0DB0E";
static const char sel_border[] = "#c1c3c4";

static const char urg_fg[] = "#c1c3c4";
static const char urg_bg[] = "#C4AB3F";
static const char urg_border[] = "#C4AB3F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
