const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#675D62", /* red     */
  [2] = "#916A62", /* green   */
  [3] = "#C17347", /* yellow  */
  [4] = "#D6A960", /* blue    */
  [5] = "#5C7086", /* magenta */
  [6] = "#7D8189", /* cyan    */
  [7] = "#c2c3c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5a626f",  /* black   */
  [9]  = "#675D62",  /* red     */
  [10] = "#916A62", /* green   */
  [11] = "#C17347", /* yellow  */
  [12] = "#D6A960", /* blue    */
  [13] = "#5C7086", /* magenta */
  [14] = "#7D8189", /* cyan    */
  [15] = "#c2c3c6", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c2c3c6", /* foreground */
  [258] = "#c2c3c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
