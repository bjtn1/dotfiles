const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#134C89", /* red     */
  [2] = "#265B93", /* green   */
  [3] = "#2B50A0", /* yellow  */
  [4] = "#5B629A", /* blue    */
  [5] = "#9C7099", /* magenta */
  [6] = "#D47A9A", /* cyan    */
  [7] = "#c4cacc", /* white   */

  /* 8 bright colors */
  [8]  = "#65777c",  /* black   */
  [9]  = "#134C89",  /* red     */
  [10] = "#265B93", /* green   */
  [11] = "#2B50A0", /* yellow  */
  [12] = "#5B629A", /* blue    */
  [13] = "#9C7099", /* magenta */
  [14] = "#D47A9A", /* cyan    */
  [15] = "#c4cacc", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4cacc", /* foreground */
  [258] = "#c4cacc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
