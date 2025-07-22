const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#BFAA3B", /* red     */
  [2] = "#DFA923", /* green   */
  [3] = "#2451AF", /* yellow  */
  [4] = "#57689B", /* blue    */
  [5] = "#5E9FD5", /* magenta */
  [6] = "#44ADCA", /* cyan    */
  [7] = "#c4c5cc", /* white   */

  /* 8 bright colors */
  [8]  = "#65667b",  /* black   */
  [9]  = "#BFAA3B",  /* red     */
  [10] = "#DFA923", /* green   */
  [11] = "#2451AF", /* yellow  */
  [12] = "#57689B", /* blue    */
  [13] = "#5E9FD5", /* magenta */
  [14] = "#44ADCA", /* cyan    */
  [15] = "#c4c5cc", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c5cc", /* foreground */
  [258] = "#c4c5cc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
