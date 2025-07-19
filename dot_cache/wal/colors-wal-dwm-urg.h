static const char norm_fg[] = "#c4c6c7";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#5e7174";

static const char sel_fg[] = "#c4c6c7";
static const char sel_bg[] = "#28A4DD";
static const char sel_border[] = "#c4c6c7";

static const char urg_fg[] = "#c4c6c7";
static const char urg_bg[] = "#5E92A2";
static const char urg_border[] = "#5E92A2";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
