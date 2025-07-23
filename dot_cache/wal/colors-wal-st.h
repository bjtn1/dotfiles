const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#344871", /* red     */
  [2] = "#4F516E", /* green   */
  [3] = "#37518C", /* yellow  */
  [4] = "#4B55A0", /* blue    */
  [5] = "#5468A0", /* magenta */
  [6] = "#906983", /* cyan    */
  [7] = "#c2c3c5", /* white   */

  /* 8 bright colors */
  [8]  = "#5a636e",  /* black   */
  [9]  = "#344871",  /* red     */
  [10] = "#4F516E", /* green   */
  [11] = "#37518C", /* yellow  */
  [12] = "#4B55A0", /* blue    */
  [13] = "#5468A0", /* magenta */
  [14] = "#906983", /* cyan    */
  [15] = "#c2c3c5", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c2c3c5", /* foreground */
  [258] = "#c2c3c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
