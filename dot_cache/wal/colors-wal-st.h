const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#C6B978", /* red     */
  [2] = "#546D8B", /* green   */
  [3] = "#A26FBC", /* yellow  */
  [4] = "#649390", /* blue    */
  [5] = "#51AAA9", /* magenta */
  [6] = "#B4A8BC", /* cyan    */
  [7] = "#c4c6cb", /* white   */

  /* 8 bright colors */
  [8]  = "#646a7a",  /* black   */
  [9]  = "#C6B978",  /* red     */
  [10] = "#546D8B", /* green   */
  [11] = "#A26FBC", /* yellow  */
  [12] = "#649390", /* blue    */
  [13] = "#51AAA9", /* magenta */
  [14] = "#B4A8BC", /* cyan    */
  [15] = "#c4c6cb", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c6cb", /* foreground */
  [258] = "#c4c6cb",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
