const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#C49171", /* red     */
  [2] = "#36548D", /* green   */
  [3] = "#636C90", /* yellow  */
  [4] = "#9A7887", /* blue    */
  [5] = "#C17F82", /* magenta */
  [6] = "#6F92B2", /* cyan    */
  [7] = "#c7c2c7", /* white   */

  /* 8 bright colors */
  [8]  = "#715d71",  /* black   */
  [9]  = "#C49171",  /* red     */
  [10] = "#36548D", /* green   */
  [11] = "#636C90", /* yellow  */
  [12] = "#9A7887", /* blue    */
  [13] = "#C17F82", /* magenta */
  [14] = "#6F92B2", /* cyan    */
  [15] = "#c7c2c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c7c2c7", /* foreground */
  [258] = "#c7c2c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
