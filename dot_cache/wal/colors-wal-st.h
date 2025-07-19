const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#1399AF", /* red     */
  [2] = "#2C9FA9", /* green   */
  [3] = "#62AFA6", /* yellow  */
  [4] = "#7EC1AE", /* blue    */
  [5] = "#8BBCAA", /* magenta */
  [6] = "#C8AC8A", /* cyan    */
  [7] = "#c8cccc", /* white   */

  /* 8 bright colors */
  [8]  = "#6a827e",  /* black   */
  [9]  = "#1399AF",  /* red     */
  [10] = "#2C9FA9", /* green   */
  [11] = "#62AFA6", /* yellow  */
  [12] = "#7EC1AE", /* blue    */
  [13] = "#8BBCAA", /* magenta */
  [14] = "#C8AC8A", /* cyan    */
  [15] = "#c8cccc", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c8cccc", /* foreground */
  [258] = "#c8cccc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
