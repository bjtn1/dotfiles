const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#326698", /* red     */
  [2] = "#5D748C", /* green   */
  [3] = "#6E899A", /* yellow  */
  [4] = "#4694A9", /* blue    */
  [5] = "#96A0AA", /* magenta */
  [6] = "#C8BEBA", /* cyan    */
  [7] = "#c2c3c7", /* white   */

  /* 8 bright colors */
  [8]  = "#5c6171",  /* black   */
  [9]  = "#326698",  /* red     */
  [10] = "#5D748C", /* green   */
  [11] = "#6E899A", /* yellow  */
  [12] = "#4694A9", /* blue    */
  [13] = "#96A0AA", /* magenta */
  [14] = "#C8BEBA", /* cyan    */
  [15] = "#c2c3c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c2c3c7", /* foreground */
  [258] = "#c2c3c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
