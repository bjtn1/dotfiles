const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#A56336", /* red     */
  [2] = "#5C906F", /* green   */
  [3] = "#C7AC58", /* yellow  */
  [4] = "#3D738B", /* blue    */
  [5] = "#6AA99A", /* magenta */
  [6] = "#A3C3AC", /* cyan    */
  [7] = "#c2c7c7", /* white   */

  /* 8 bright colors */
  [8]  = "#5d7272",  /* black   */
  [9]  = "#A56336",  /* red     */
  [10] = "#5C906F", /* green   */
  [11] = "#C7AC58", /* yellow  */
  [12] = "#3D738B", /* blue    */
  [13] = "#6AA99A", /* magenta */
  [14] = "#A3C3AC", /* cyan    */
  [15] = "#c2c7c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c2c7c7", /* foreground */
  [258] = "#c2c7c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
