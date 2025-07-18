static const char norm_fg[] = "#c6c7c2";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#6b715d";

static const char sel_fg[] = "#c6c7c2";
static const char sel_bg[] = "#915C39";
static const char sel_border[] = "#c6c7c2";

static const char urg_fg[] = "#c6c7c2";
static const char urg_bg[] = "#696053";
static const char urg_border[] = "#696053";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
