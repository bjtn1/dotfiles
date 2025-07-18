const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#4A5BAB", /* red     */
  [2] = "#5677C7", /* green   */
  [3] = "#8579C4", /* yellow  */
  [4] = "#6894DE", /* blue    */
  [5] = "#77C2F9", /* magenta */
  [6] = "#98ABEE", /* cyan    */
  [7] = "#c4c5cc", /* white   */

  /* 8 bright colors */
  [8]  = "#65677c",  /* black   */
  [9]  = "#4A5BAB",  /* red     */
  [10] = "#5677C7", /* green   */
  [11] = "#8579C4", /* yellow  */
  [12] = "#6894DE", /* blue    */
  [13] = "#77C2F9", /* magenta */
  [14] = "#98ABEE", /* cyan    */
  [15] = "#c4c5cc", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c5cc", /* foreground */
  [258] = "#c4c5cc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
