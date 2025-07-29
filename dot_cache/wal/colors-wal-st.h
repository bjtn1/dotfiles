const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#93A0AF", /* red     */
  [2] = "#CCBBBF", /* green   */
  [3] = "#9EB7C3", /* yellow  */
  [4] = "#A8BCC6", /* blue    */
  [5] = "#EEB9CC", /* magenta */
  [6] = "#CAD3DD", /* cyan    */
  [7] = "#c8cacc", /* white   */

  /* 8 bright colors */
  [8]  = "#6a7382",  /* black   */
  [9]  = "#93A0AF",  /* red     */
  [10] = "#CCBBBF", /* green   */
  [11] = "#9EB7C3", /* yellow  */
  [12] = "#A8BCC6", /* blue    */
  [13] = "#EEB9CC", /* magenta */
  [14] = "#CAD3DD", /* cyan    */
  [15] = "#c8cacc", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c8cacc", /* foreground */
  [258] = "#c8cacc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
