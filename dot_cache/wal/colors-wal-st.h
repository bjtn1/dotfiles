const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#296993", /* red     */
  [2] = "#2273BF", /* green   */
  [3] = "#596EA2", /* yellow  */
  [4] = "#A277A1", /* blue    */
  [5] = "#358AB4", /* magenta */
  [6] = "#37A2CB", /* cyan    */
  [7] = "#c3c4c8", /* white   */

  /* 8 bright colors */
  [8]  = "#5f6374",  /* black   */
  [9]  = "#296993",  /* red     */
  [10] = "#2273BF", /* green   */
  [11] = "#596EA2", /* yellow  */
  [12] = "#A277A1", /* blue    */
  [13] = "#358AB4", /* magenta */
  [14] = "#37A2CB", /* cyan    */
  [15] = "#c3c4c8", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c4c8", /* foreground */
  [258] = "#c3c4c8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
