const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#2F6F91", /* red     */
  [2] = "#51778F", /* green   */
  [3] = "#5B92AA", /* yellow  */
  [4] = "#4EAAC9", /* blue    */
  [5] = "#5DB0CE", /* magenta */
  [6] = "#BFC9AE", /* cyan    */
  [7] = "#c3c4c7", /* white   */

  /* 8 bright colors */
  [8]  = "#5d6372",  /* black   */
  [9]  = "#2F6F91",  /* red     */
  [10] = "#51778F", /* green   */
  [11] = "#5B92AA", /* yellow  */
  [12] = "#4EAAC9", /* blue    */
  [13] = "#5DB0CE", /* magenta */
  [14] = "#BFC9AE", /* cyan    */
  [15] = "#c3c4c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c4c7", /* foreground */
  [258] = "#c3c4c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
