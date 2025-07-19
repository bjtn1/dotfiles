static const char norm_fg[] = "#c3c4c7";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#5d6372";

static const char sel_fg[] = "#c3c4c7";
static const char sel_bg[] = "#51778F";
static const char sel_border[] = "#c3c4c7";

static const char urg_fg[] = "#c3c4c7";
static const char urg_bg[] = "#2F6F91";
static const char urg_border[] = "#2F6F91";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
