const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#71CAE4", /* red     */
  [2] = "#A0A2A7", /* green   */
  [3] = "#E0B0A5", /* yellow  */
  [4] = "#F1CFA7", /* blue    */
  [5] = "#BABAC3", /* magenta */
  [6] = "#A2CFE5", /* cyan    */
  [7] = "#c8cbcf", /* white   */

  /* 8 bright colors */
  [8]  = "#6c7785",  /* black   */
  [9]  = "#71CAE4",  /* red     */
  [10] = "#A0A2A7", /* green   */
  [11] = "#E0B0A5", /* yellow  */
  [12] = "#F1CFA7", /* blue    */
  [13] = "#BABAC3", /* magenta */
  [14] = "#A2CFE5", /* cyan    */
  [15] = "#c8cbcf", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c8cbcf", /* foreground */
  [258] = "#c8cbcf",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
