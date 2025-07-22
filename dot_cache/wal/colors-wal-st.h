const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#B38478", /* red     */
  [2] = "#DE9574", /* green   */
  [3] = "#FDC578", /* yellow  */
  [4] = "#997F81", /* blue    */
  [5] = "#B79489", /* magenta */
  [6] = "#DFAB90", /* cyan    */
  [7] = "#c4c3c4", /* white   */

  /* 8 bright colors */
  [8]  = "#6e5a6e",  /* black   */
  [9]  = "#B38478",  /* red     */
  [10] = "#DE9574", /* green   */
  [11] = "#FDC578", /* yellow  */
  [12] = "#997F81", /* blue    */
  [13] = "#B79489", /* magenta */
  [14] = "#DFAB90", /* cyan    */
  [15] = "#c4c3c4", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c3c4", /* foreground */
  [258] = "#c4c3c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
