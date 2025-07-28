const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#8D6A83", /* red     */
  [2] = "#768BA4", /* green   */
  [3] = "#9D9CB2", /* yellow  */
  [4] = "#B1B5C7", /* blue    */
  [5] = "#C2B8C7", /* magenta */
  [6] = "#BCC7D0", /* cyan    */
  [7] = "#c4c6cc", /* white   */

  /* 8 bright colors */
  [8]  = "#65687b",  /* black   */
  [9]  = "#8D6A83",  /* red     */
  [10] = "#768BA4", /* green   */
  [11] = "#9D9CB2", /* yellow  */
  [12] = "#B1B5C7", /* blue    */
  [13] = "#C2B8C7", /* magenta */
  [14] = "#BCC7D0", /* cyan    */
  [15] = "#c4c6cc", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c6cc", /* foreground */
  [258] = "#c4c6cc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
