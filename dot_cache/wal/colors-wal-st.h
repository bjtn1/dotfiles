const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#9C4C6D", /* red     */
  [2] = "#B8807A", /* green   */
  [3] = "#59708F", /* yellow  */
  [4] = "#AA678A", /* blue    */
  [5] = "#E16C90", /* magenta */
  [6] = "#7092AC", /* cyan    */
  [7] = "#c4c2c7", /* white   */

  /* 8 bright colors */
  [8]  = "#655c71",  /* black   */
  [9]  = "#9C4C6D",  /* red     */
  [10] = "#B8807A", /* green   */
  [11] = "#59708F", /* yellow  */
  [12] = "#AA678A", /* blue    */
  [13] = "#E16C90", /* magenta */
  [14] = "#7092AC", /* cyan    */
  [15] = "#c4c2c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c2c7", /* foreground */
  [258] = "#c4c2c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
