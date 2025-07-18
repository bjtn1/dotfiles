static const char norm_fg[] = "#c7c3c2";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#71615c";

static const char sel_fg[] = "#c7c3c2";
static const char sel_bg[] = "#7C8476";
static const char sel_border[] = "#c7c3c2";

static const char urg_fg[] = "#c7c3c2";
static const char urg_bg[] = "#8F725A";
static const char urg_border[] = "#8F725A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
