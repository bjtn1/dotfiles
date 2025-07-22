const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#654847", /* red     */
  [2] = "#90363B", /* green   */
  [3] = "#913A45", /* yellow  */
  [4] = "#A0514F", /* blue    */
  [5] = "#D3685B", /* magenta */
  [6] = "#E0956E", /* cyan    */
  [7] = "#c3c3c4", /* white   */

  /* 8 bright colors */
  [8]  = "#5f5a6f",  /* black   */
  [9]  = "#654847",  /* red     */
  [10] = "#90363B", /* green   */
  [11] = "#913A45", /* yellow  */
  [12] = "#A0514F", /* blue    */
  [13] = "#D3685B", /* magenta */
  [14] = "#E0956E", /* cyan    */
  [15] = "#c3c3c4", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c3c4", /* foreground */
  [258] = "#c3c3c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
