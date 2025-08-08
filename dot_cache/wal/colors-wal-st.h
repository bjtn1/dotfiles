const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#39445C", /* red     */
  [2] = "#3E4A63", /* green   */
  [3] = "#43425E", /* yellow  */
  [4] = "#4E4A77", /* blue    */
  [5] = "#4A637D", /* magenta */
  [6] = "#555384", /* cyan    */
  [7] = "#c3c3c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5d5d71",  /* black   */
  [9]  = "#39445C",  /* red     */
  [10] = "#3E4A63", /* green   */
  [11] = "#43425E", /* yellow  */
  [12] = "#4E4A77", /* blue    */
  [13] = "#4A637D", /* magenta */
  [14] = "#555384", /* cyan    */
  [15] = "#c3c3c6", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c3c6", /* foreground */
  [258] = "#c3c3c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
