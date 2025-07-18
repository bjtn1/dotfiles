const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#6DBFC4", /* red     */
  [2] = "#9BA5A0", /* green   */
  [3] = "#DDA8AA", /* yellow  */
  [4] = "#9BC6BA", /* blue    */
  [5] = "#D6BEC1", /* magenta */
  [6] = "#A4D5CD", /* cyan    */
  [7] = "#c7cbcb", /* white   */

  /* 8 bright colors */
  [8]  = "#687f7f",  /* black   */
  [9]  = "#6DBFC4",  /* red     */
  [10] = "#9BA5A0", /* green   */
  [11] = "#DDA8AA", /* yellow  */
  [12] = "#9BC6BA", /* blue    */
  [13] = "#D6BEC1", /* magenta */
  [14] = "#A4D5CD", /* cyan    */
  [15] = "#c7cbcb", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c7cbcb", /* foreground */
  [258] = "#c7cbcb",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
