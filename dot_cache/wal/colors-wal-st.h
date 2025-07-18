const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#0C6492", /* red     */
  [2] = "#0274AD", /* green   */
  [3] = "#627887", /* yellow  */
  [4] = "#977C85", /* blue    */
  [5] = "#4C9CB5", /* magenta */
  [6] = "#9A9E9E", /* cyan    */
  [7] = "#c3c4c4", /* white   */

  /* 8 bright colors */
  [8]  = "#5a6f6f",  /* black   */
  [9]  = "#0C6492",  /* red     */
  [10] = "#0274AD", /* green   */
  [11] = "#627887", /* yellow  */
  [12] = "#977C85", /* blue    */
  [13] = "#4C9CB5", /* magenta */
  [14] = "#9A9E9E", /* cyan    */
  [15] = "#c3c4c4", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c4c4", /* foreground */
  [258] = "#c3c4c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
