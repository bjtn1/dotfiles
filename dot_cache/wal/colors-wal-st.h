const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#3267DE", /* red     */
  [2] = "#5B6ADA", /* green   */
  [3] = "#9966C1", /* yellow  */
  [4] = "#418AEF", /* blue    */
  [5] = "#6192F4", /* magenta */
  [6] = "#9A9CF7", /* cyan    */
  [7] = "#c3c2c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5f5b70",  /* black   */
  [9]  = "#3267DE",  /* red     */
  [10] = "#5B6ADA", /* green   */
  [11] = "#9966C1", /* yellow  */
  [12] = "#418AEF", /* blue    */
  [13] = "#6192F4", /* magenta */
  [14] = "#9A9CF7", /* cyan    */
  [15] = "#c3c2c6", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c2c6", /* foreground */
  [258] = "#c3c2c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
