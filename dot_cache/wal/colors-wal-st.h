const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#A891B5", /* red     */
  [2] = "#D5B6AB", /* green   */
  [3] = "#A1AED3", /* yellow  */
  [4] = "#DAAFCC", /* blue    */
  [5] = "#B1CEE4", /* magenta */
  [6] = "#A0D3E6", /* cyan    */
  [7] = "#c7cccd", /* white   */

  /* 8 bright colors */
  [8]  = "#697c81",  /* black   */
  [9]  = "#A891B5",  /* red     */
  [10] = "#D5B6AB", /* green   */
  [11] = "#A1AED3", /* yellow  */
  [12] = "#DAAFCC", /* blue    */
  [13] = "#B1CEE4", /* magenta */
  [14] = "#A0D3E6", /* cyan    */
  [15] = "#c7cccd", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c7cccd", /* foreground */
  [258] = "#c7cccd",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
