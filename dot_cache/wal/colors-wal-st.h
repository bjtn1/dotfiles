const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#3478CA", /* red     */
  [2] = "#437CC5", /* green   */
  [3] = "#917593", /* yellow  */
  [4] = "#3A88DB", /* blue    */
  [5] = "#488AD5", /* magenta */
  [6] = "#53A2E7", /* cyan    */
  [7] = "#c5c8cd", /* white   */

  /* 8 bright colors */
  [8]  = "#67707e",  /* black   */
  [9]  = "#3478CA",  /* red     */
  [10] = "#437CC5", /* green   */
  [11] = "#917593", /* yellow  */
  [12] = "#3A88DB", /* blue    */
  [13] = "#488AD5", /* magenta */
  [14] = "#53A2E7", /* cyan    */
  [15] = "#c5c8cd", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c5c8cd", /* foreground */
  [258] = "#c5c8cd",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
