const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#C4AB3F", /* red     */
  [2] = "#E0DB0E", /* green   */
  [3] = "#EFE709", /* yellow  */
  [4] = "#95834A", /* blue    */
  [5] = "#F59659", /* magenta */
  [6] = "#1D728A", /* cyan    */
  [7] = "#c1c3c4", /* white   */

  /* 8 bright colors */
  [8]  = "#59626c",  /* black   */
  [9]  = "#C4AB3F",  /* red     */
  [10] = "#E0DB0E", /* green   */
  [11] = "#EFE709", /* yellow  */
  [12] = "#95834A", /* blue    */
  [13] = "#F59659", /* magenta */
  [14] = "#1D728A", /* cyan    */
  [15] = "#c1c3c4", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c1c3c4", /* foreground */
  [258] = "#c1c3c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
