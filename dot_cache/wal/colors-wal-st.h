const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#B0966D", /* red     */
  [2] = "#D7996E", /* green   */
  [3] = "#767886", /* yellow  */
  [4] = "#A69A95", /* blue    */
  [5] = "#D3B196", /* magenta */
  [6] = "#E9D0A9", /* cyan    */
  [7] = "#c6c4c6", /* white   */

  /* 8 bright colors */
  [8]  = "#6b5e74",  /* black   */
  [9]  = "#B0966D",  /* red     */
  [10] = "#D7996E", /* green   */
  [11] = "#767886", /* yellow  */
  [12] = "#A69A95", /* blue    */
  [13] = "#D3B196", /* magenta */
  [14] = "#E9D0A9", /* cyan    */
  [15] = "#c6c4c6", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c6c4c6", /* foreground */
  [258] = "#c6c4c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
