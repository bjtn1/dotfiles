const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#646487", /* red     */
  [2] = "#8F768B", /* green   */
  [3] = "#837796", /* yellow  */
  [4] = "#C2A5A6", /* blue    */
  [5] = "#DCACA9", /* magenta */
  [6] = "#ECD7CF", /* cyan    */
  [7] = "#c2c3c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5a606f",  /* black   */
  [9]  = "#646487",  /* red     */
  [10] = "#8F768B", /* green   */
  [11] = "#837796", /* yellow  */
  [12] = "#C2A5A6", /* blue    */
  [13] = "#DCACA9", /* magenta */
  [14] = "#ECD7CF", /* cyan    */
  [15] = "#c2c3c6", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c2c3c6", /* foreground */
  [258] = "#c2c3c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
