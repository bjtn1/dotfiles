const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#E05E21", /* red     */
  [2] = "#D26F24", /* green   */
  [3] = "#EA952A", /* yellow  */
  [4] = "#FDDD27", /* blue    */
  [5] = "#F1A557", /* magenta */
  [6] = "#FAE059", /* cyan    */
  [7] = "#c6c2c2", /* white   */

  /* 8 bright colors */
  [8]  = "#6f5a5a",  /* black   */
  [9]  = "#E05E21",  /* red     */
  [10] = "#D26F24", /* green   */
  [11] = "#EA952A", /* yellow  */
  [12] = "#FDDD27", /* blue    */
  [13] = "#F1A557", /* magenta */
  [14] = "#FAE059", /* cyan    */
  [15] = "#c6c2c2", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c6c2c2", /* foreground */
  [258] = "#c6c2c2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
