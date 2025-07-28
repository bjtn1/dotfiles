static const char norm_fg[] = "#c7cccd";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#697c81";

static const char sel_fg[] = "#c7cccd";
static const char sel_bg[] = "#D5B6AB";
static const char sel_border[] = "#c7cccd";

static const char urg_fg[] = "#c7cccd";
static const char urg_bg[] = "#A891B5";
static const char urg_border[] = "#A891B5";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
