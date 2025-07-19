const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#026958", /* red     */
  [2] = "#01536E", /* green   */
  [3] = "#01647B", /* yellow  */
  [4] = "#028F76", /* blue    */
  [5] = "#016988", /* magenta */
  [6] = "#026799", /* cyan    */
  [7] = "#c1c4c5", /* white   */

  /* 8 bright colors */
  [8]  = "#596b6d",  /* black   */
  [9]  = "#026958",  /* red     */
  [10] = "#01536E", /* green   */
  [11] = "#01647B", /* yellow  */
  [12] = "#028F76", /* blue    */
  [13] = "#016988", /* magenta */
  [14] = "#026799", /* cyan    */
  [15] = "#c1c4c5", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c1c4c5", /* foreground */
  [258] = "#c1c4c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
