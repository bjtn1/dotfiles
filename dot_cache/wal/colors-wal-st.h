const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#BDCA51", /* red     */
  [2] = "#F3E76C", /* green   */
  [3] = "#096B95", /* yellow  */
  [4] = "#1D949C", /* blue    */
  [5] = "#23B0DE", /* magenta */
  [6] = "#4DC3CF", /* cyan    */
  [7] = "#c3c9c9", /* white   */

  /* 8 bright colors */
  [8]  = "#607676",  /* black   */
  [9]  = "#BDCA51",  /* red     */
  [10] = "#F3E76C", /* green   */
  [11] = "#096B95", /* yellow  */
  [12] = "#1D949C", /* blue    */
  [13] = "#23B0DE", /* magenta */
  [14] = "#4DC3CF", /* cyan    */
  [15] = "#c3c9c9", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c9c9", /* foreground */
  [258] = "#c3c9c9",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
