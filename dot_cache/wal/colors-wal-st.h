const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#225C8E", /* red     */
  [2] = "#1E61AE", /* green   */
  [3] = "#5B6E90", /* yellow  */
  [4] = "#54A8C6", /* blue    */
  [5] = "#8E99AF", /* magenta */
  [6] = "#9AB3CC", /* cyan    */
  [7] = "#c1c1c3", /* white   */

  /* 8 bright colors */
  [8]  = "#575a6a",  /* black   */
  [9]  = "#225C8E",  /* red     */
  [10] = "#1E61AE", /* green   */
  [11] = "#5B6E90", /* yellow  */
  [12] = "#54A8C6", /* blue    */
  [13] = "#8E99AF", /* magenta */
  [14] = "#9AB3CC", /* cyan    */
  [15] = "#c1c1c3", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c1c1c3", /* foreground */
  [258] = "#c1c1c3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
