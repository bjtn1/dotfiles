const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#334853", /* red     */
  [2] = "#3B5364", /* green   */
  [3] = "#565E5F", /* yellow  */
  [4] = "#8E725B", /* blue    */
  [5] = "#A1906C", /* magenta */
  [6] = "#6A7C81", /* cyan    */
  [7] = "#c2c4c7", /* white   */

  /* 8 bright colors */
  [8]  = "#5c6571",  /* black   */
  [9]  = "#334853",  /* red     */
  [10] = "#3B5364", /* green   */
  [11] = "#565E5F", /* yellow  */
  [12] = "#8E725B", /* blue    */
  [13] = "#A1906C", /* magenta */
  [14] = "#6A7C81", /* cyan    */
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
