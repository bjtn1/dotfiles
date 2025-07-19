const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#C54730", /* red     */
  [2] = "#EC592C", /* green   */
  [3] = "#F09562", /* yellow  */
  [4] = "#5F7C83", /* blue    */
  [5] = "#6D8D91", /* magenta */
  [6] = "#F6B08D", /* cyan    */
  [7] = "#c4c1c1", /* white   */

  /* 8 bright colors */
  [8]  = "#6c5858",  /* black   */
  [9]  = "#C54730",  /* red     */
  [10] = "#EC592C", /* green   */
  [11] = "#F09562", /* yellow  */
  [12] = "#5F7C83", /* blue    */
  [13] = "#6D8D91", /* magenta */
  [14] = "#F6B08D", /* cyan    */
  [15] = "#c4c1c1", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c1c1", /* foreground */
  [258] = "#c4c1c1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
