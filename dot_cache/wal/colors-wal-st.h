const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#3272A9", /* red     */
  [2] = "#3894BD", /* green   */
  [3] = "#15A2D9", /* yellow  */
  [4] = "#28CBF4", /* blue    */
  [5] = "#5DD3F4", /* magenta */
  [6] = "#9EA7B9", /* cyan    */
  [7] = "#c6cacf", /* white   */

  /* 8 bright colors */
  [8]  = "#6a7581",  /* black   */
  [9]  = "#3272A9",  /* red     */
  [10] = "#3894BD", /* green   */
  [11] = "#15A2D9", /* yellow  */
  [12] = "#28CBF4", /* blue    */
  [13] = "#5DD3F4", /* magenta */
  [14] = "#9EA7B9", /* cyan    */
  [15] = "#c6cacf", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c6cacf", /* foreground */
  [258] = "#c6cacf",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
