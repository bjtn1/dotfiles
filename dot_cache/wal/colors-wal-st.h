const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#615453", /* red     */
  [2] = "#A25836", /* green   */
  [3] = "#9E6B4F", /* yellow  */
  [4] = "#D9A058", /* blue    */
  [5] = "#D6B760", /* magenta */
  [6] = "#7A7581", /* cyan    */
  [7] = "#c2c4c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5c6370",  /* black   */
  [9]  = "#615453",  /* red     */
  [10] = "#A25836", /* green   */
  [11] = "#9E6B4F", /* yellow  */
  [12] = "#D9A058", /* blue    */
  [13] = "#D6B760", /* magenta */
  [14] = "#7A7581", /* cyan    */
  [15] = "#c2c4c6", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c2c4c6", /* foreground */
  [258] = "#c2c4c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
