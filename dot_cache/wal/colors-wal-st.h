const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#937290", /* red     */
  [2] = "#AF78AC", /* green   */
  [3] = "#90879A", /* yellow  */
  [4] = "#A290A3", /* blue    */
  [5] = "#AF96A6", /* magenta */
  [6] = "#D4A7AF", /* cyan    */
  [7] = "#c1c0c0", /* white   */

  /* 8 bright colors */
  [8]  = "#665353",  /* black   */
  [9]  = "#937290",  /* red     */
  [10] = "#AF78AC", /* green   */
  [11] = "#90879A", /* yellow  */
  [12] = "#A290A3", /* blue    */
  [13] = "#AF96A6", /* magenta */
  [14] = "#D4A7AF", /* cyan    */
  [15] = "#c1c0c0", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c1c0c0", /* foreground */
  [258] = "#c1c0c0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
