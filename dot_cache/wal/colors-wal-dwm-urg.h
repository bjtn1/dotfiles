static const char norm_fg[] = "#c3c1c1";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6a5a57";

static const char sel_fg[] = "#c3c1c1";
static const char sel_bg[] = "#EC665B";
static const char sel_border[] = "#c3c1c1";

static const char urg_fg[] = "#c3c1c1";
static const char urg_bg[] = "#BB4446";
static const char urg_border[] = "#BB4446";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
