const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#B7867B", /* red     */
  [2] = "#736C8B", /* green   */
  [3] = "#8F7596", /* yellow  */
  [4] = "#A07692", /* blue    */
  [5] = "#CA7984", /* magenta */
  [6] = "#A3869A", /* cyan    */
  [7] = "#c3c2c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5f5c70",  /* black   */
  [9]  = "#B7867B",  /* red     */
  [10] = "#736C8B", /* green   */
  [11] = "#8F7596", /* yellow  */
  [12] = "#A07692", /* blue    */
  [13] = "#CA7984", /* magenta */
  [14] = "#A3869A", /* cyan    */
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
