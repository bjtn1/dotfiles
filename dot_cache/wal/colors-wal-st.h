const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#5B4C70", /* red     */
  [2] = "#603889", /* green   */
  [3] = "#334DAD", /* yellow  */
  [4] = "#664D96", /* blue    */
  [5] = "#91438E", /* magenta */
  [6] = "#A0489A", /* cyan    */
  [7] = "#c4c2c7", /* white   */

  /* 8 bright colors */
  [8]  = "#645e72",  /* black   */
  [9]  = "#5B4C70",  /* red     */
  [10] = "#603889", /* green   */
  [11] = "#334DAD", /* yellow  */
  [12] = "#664D96", /* blue    */
  [13] = "#91438E", /* magenta */
  [14] = "#A0489A", /* cyan    */
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
