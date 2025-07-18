const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#9EB85C", /* red     */
  [2] = "#57748E", /* green   */
  [3] = "#6F8D9F", /* yellow  */
  [4] = "#35B7FC", /* blue    */
  [5] = "#5BB5F6", /* magenta */
  [6] = "#6DC0F6", /* cyan    */
  [7] = "#c2c7c4", /* white   */

  /* 8 bright colors */
  [8]  = "#5c7165",  /* black   */
  [9]  = "#9EB85C",  /* red     */
  [10] = "#57748E", /* green   */
  [11] = "#6F8D9F", /* yellow  */
  [12] = "#35B7FC", /* blue    */
  [13] = "#5BB5F6", /* magenta */
  [14] = "#6DC0F6", /* cyan    */
  [15] = "#c2c7c4", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c2c7c4", /* foreground */
  [258] = "#c2c7c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
