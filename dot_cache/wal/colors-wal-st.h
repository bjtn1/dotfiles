const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#5D92C3", /* red     */
  [2] = "#AE86A7", /* green   */
  [3] = "#E0929D", /* yellow  */
  [4] = "#FDD5AC", /* blue    */
  [5] = "#A4B9D5", /* magenta */
  [6] = "#DAD8DC", /* cyan    */
  [7] = "#c5c5ca", /* white   */

  /* 8 bright colors */
  [8]  = "#656379",  /* black   */
  [9]  = "#5D92C3",  /* red     */
  [10] = "#AE86A7", /* green   */
  [11] = "#E0929D", /* yellow  */
  [12] = "#FDD5AC", /* blue    */
  [13] = "#A4B9D5", /* magenta */
  [14] = "#DAD8DC", /* cyan    */
  [15] = "#c5c5ca", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c5c5ca", /* foreground */
  [258] = "#c5c5ca",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
