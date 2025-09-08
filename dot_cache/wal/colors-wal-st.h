const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#863D6F", /* red     */
  [2] = "#9B4878", /* green   */
  [3] = "#AF5887", /* yellow  */
  [4] = "#A17E82", /* blue    */
  [5] = "#D26491", /* magenta */
  [6] = "#F29DB0", /* cyan    */
  [7] = "#c4c4ca", /* white   */

  /* 8 bright colors */
  [8]  = "#646379",  /* black   */
  [9]  = "#863D6F",  /* red     */
  [10] = "#9B4878", /* green   */
  [11] = "#AF5887", /* yellow  */
  [12] = "#A17E82", /* blue    */
  [13] = "#D26491", /* magenta */
  [14] = "#F29DB0", /* cyan    */
  [15] = "#c4c4ca", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c4ca", /* foreground */
  [258] = "#c4c4ca",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
