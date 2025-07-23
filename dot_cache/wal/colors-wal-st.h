const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#274D90", /* red     */
  [2] = "#255197", /* green   */
  [3] = "#3469B3", /* yellow  */
  [4] = "#3A6AB6", /* blue    */
  [5] = "#4868B3", /* magenta */
  [6] = "#3AA0DC", /* cyan    */
  [7] = "#c3c4c8", /* white   */

  /* 8 bright colors */
  [8]  = "#5f6374",  /* black   */
  [9]  = "#274D90",  /* red     */
  [10] = "#255197", /* green   */
  [11] = "#3469B3", /* yellow  */
  [12] = "#3A6AB6", /* blue    */
  [13] = "#4868B3", /* magenta */
  [14] = "#3AA0DC", /* cyan    */
  [15] = "#c3c4c8", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c4c8", /* foreground */
  [258] = "#c3c4c8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
