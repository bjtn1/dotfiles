const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#C1AAAF", /* red     */
  [2] = "#96B4CE", /* green   */
  [3] = "#AAD3EA", /* yellow  */
  [4] = "#F7DACC", /* blue    */
  [5] = "#FEE7D4", /* magenta */
  [6] = "#CED6E2", /* cyan    */
  [7] = "#cbcdd0", /* white   */

  /* 8 bright colors */
  [8]  = "#707e8a",  /* black   */
  [9]  = "#C1AAAF",  /* red     */
  [10] = "#96B4CE", /* green   */
  [11] = "#AAD3EA", /* yellow  */
  [12] = "#F7DACC", /* blue    */
  [13] = "#FEE7D4", /* magenta */
  [14] = "#CED6E2", /* cyan    */
  [15] = "#cbcdd0", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#cbcdd0", /* foreground */
  [258] = "#cbcdd0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
