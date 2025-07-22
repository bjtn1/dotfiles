const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#C6C4B3", /* red     */
  [2] = "#A4B9C5", /* green   */
  [3] = "#B5CBCF", /* yellow  */
  [4] = "#BEE6E8", /* blue    */
  [5] = "#C9D6D4", /* magenta */
  [6] = "#CFECED", /* cyan    */
  [7] = "#c6c7c9", /* white   */

  /* 8 bright colors */
  [8]  = "#636e7a",  /* black   */
  [9]  = "#C6C4B3",  /* red     */
  [10] = "#A4B9C5", /* green   */
  [11] = "#B5CBCF", /* yellow  */
  [12] = "#BEE6E8", /* blue    */
  [13] = "#C9D6D4", /* magenta */
  [14] = "#CFECED", /* cyan    */
  [15] = "#c6c7c9", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c6c7c9", /* foreground */
  [258] = "#c6c7c9",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
