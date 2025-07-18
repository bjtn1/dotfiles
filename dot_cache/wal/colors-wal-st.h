const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#696053", /* red     */
  [2] = "#915C39", /* green   */
  [3] = "#8E6C56", /* yellow  */
  [4] = "#A2926B", /* blue    */
  [5] = "#D0AB6B", /* magenta */
  [6] = "#5C7583", /* cyan    */
  [7] = "#c6c7c2", /* white   */

  /* 8 bright colors */
  [8]  = "#6b715d",  /* black   */
  [9]  = "#696053",  /* red     */
  [10] = "#915C39", /* green   */
  [11] = "#8E6C56", /* yellow  */
  [12] = "#A2926B", /* blue    */
  [13] = "#D0AB6B", /* magenta */
  [14] = "#5C7583", /* cyan    */
  [15] = "#c6c7c2", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c6c7c2", /* foreground */
  [258] = "#c6c7c2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
