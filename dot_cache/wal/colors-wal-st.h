const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#3496C5", /* red     */
  [2] = "#17ADD2", /* green   */
  [3] = "#2CAFCF", /* yellow  */
  [4] = "#4CB5CD", /* blue    */
  [5] = "#EA9194", /* magenta */
  [6] = "#E8A69F", /* cyan    */
  [7] = "#cacbcf", /* white   */

  /* 8 bright colors */
  [8]  = "#6f7687",  /* black   */
  [9]  = "#3496C5",  /* red     */
  [10] = "#17ADD2", /* green   */
  [11] = "#2CAFCF", /* yellow  */
  [12] = "#4CB5CD", /* blue    */
  [13] = "#EA9194", /* magenta */
  [14] = "#E8A69F", /* cyan    */
  [15] = "#cacbcf", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#cacbcf", /* foreground */
  [258] = "#cacbcf",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
