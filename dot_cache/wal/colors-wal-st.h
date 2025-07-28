const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#5B525C", /* red     */
  [2] = "#9F6553", /* green   */
  [3] = "#D19D6B", /* yellow  */
  [4] = "#2F53A5", /* blue    */
  [5] = "#9B5FAC", /* magenta */
  [6] = "#52A4E4", /* cyan    */
  [7] = "#c2c3c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5c5f70",  /* black   */
  [9]  = "#5B525C",  /* red     */
  [10] = "#9F6553", /* green   */
  [11] = "#D19D6B", /* yellow  */
  [12] = "#2F53A5", /* blue    */
  [13] = "#9B5FAC", /* magenta */
  [14] = "#52A4E4", /* cyan    */
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
