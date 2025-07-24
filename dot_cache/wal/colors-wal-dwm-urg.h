static const char norm_fg[] = "#c4cacc";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#65777c";

static const char sel_fg[] = "#c4cacc";
static const char sel_bg[] = "#265B93";
static const char sel_border[] = "#c4cacc";

static const char urg_fg[] = "#c4cacc";
static const char urg_bg[] = "#134C89";
static const char urg_border[] = "#134C89";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
