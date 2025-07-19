const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#485157", /* red     */
  [2] = "#58646B", /* green   */
  [3] = "#9E6526", /* yellow  */
  [4] = "#6B9F73", /* blue    */
  [5] = "#D3AB3E", /* magenta */
  [6] = "#697A85", /* cyan    */
  [7] = "#c2c4c7", /* white   */

  /* 8 bright colors */
  [8]  = "#5c6571",  /* black   */
  [9]  = "#485157",  /* red     */
  [10] = "#58646B", /* green   */
  [11] = "#9E6526", /* yellow  */
  [12] = "#6B9F73", /* blue    */
  [13] = "#D3AB3E", /* magenta */
  [14] = "#697A85", /* cyan    */
  [15] = "#c2c4c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c2c4c7", /* foreground */
  [258] = "#c2c4c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
