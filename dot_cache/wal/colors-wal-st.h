const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#68CAFC", /* red     */
  [2] = "#B3ADA8", /* green   */
  [3] = "#F3A0A5", /* yellow  */
  [4] = "#E7D2A6", /* blue    */
  [5] = "#A1DBF9", /* magenta */
  [6] = "#EFDCD6", /* cyan    */
  [7] = "#c7cbcc", /* white   */

  /* 8 bright colors */
  [8]  = "#687d7f",  /* black   */
  [9]  = "#68CAFC",  /* red     */
  [10] = "#B3ADA8", /* green   */
  [11] = "#F3A0A5", /* yellow  */
  [12] = "#E7D2A6", /* blue    */
  [13] = "#A1DBF9", /* magenta */
  [14] = "#EFDCD6", /* cyan    */
  [15] = "#c7cbcc", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c7cbcc", /* foreground */
  [258] = "#c7cbcc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
