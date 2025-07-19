const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#5E92A2", /* red     */
  [2] = "#28A4DD", /* green   */
  [3] = "#58ADD2", /* yellow  */
  [4] = "#5CB1DE", /* blue    */
  [5] = "#99A7A0", /* magenta */
  [6] = "#ACC5BF", /* cyan    */
  [7] = "#c4c6c7", /* white   */

  /* 8 bright colors */
  [8]  = "#5e7174",  /* black   */
  [9]  = "#5E92A2",  /* red     */
  [10] = "#28A4DD", /* green   */
  [11] = "#58ADD2", /* yellow  */
  [12] = "#5CB1DE", /* blue    */
  [13] = "#99A7A0", /* magenta */
  [14] = "#ACC5BF", /* cyan    */
  [15] = "#c4c6c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c6c7", /* foreground */
  [258] = "#c4c6c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
