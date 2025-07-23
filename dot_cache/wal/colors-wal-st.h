const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#4B95AE", /* red     */
  [2] = "#57A4A8", /* green   */
  [3] = "#9CACA2", /* yellow  */
  [4] = "#E5ACA1", /* blue    */
  [5] = "#A8C8AA", /* magenta */
  [6] = "#DDCDB2", /* cyan    */
  [7] = "#c6caca", /* white   */

  /* 8 bright colors */
  [8]  = "#647a7a",  /* black   */
  [9]  = "#4B95AE",  /* red     */
  [10] = "#57A4A8", /* green   */
  [11] = "#9CACA2", /* yellow  */
  [12] = "#E5ACA1", /* blue    */
  [13] = "#A8C8AA", /* magenta */
  [14] = "#DDCDB2", /* cyan    */
  [15] = "#c6caca", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c6caca", /* foreground */
  [258] = "#c6caca",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
