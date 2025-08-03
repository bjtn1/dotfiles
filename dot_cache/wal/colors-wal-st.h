const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#6AC5AD", /* red     */
  [2] = "#95A8A4", /* green   */
  [3] = "#9ED4A3", /* yellow  */
  [4] = "#D6D89D", /* blue    */
  [5] = "#94B7CF", /* magenta */
  [6] = "#95CDCD", /* cyan    */
  [7] = "#c5c7c7", /* white   */

  /* 8 bright colors */
  [8]  = "#607572",  /* black   */
  [9]  = "#6AC5AD",  /* red     */
  [10] = "#95A8A4", /* green   */
  [11] = "#9ED4A3", /* yellow  */
  [12] = "#D6D89D", /* blue    */
  [13] = "#94B7CF", /* magenta */
  [14] = "#95CDCD", /* cyan    */
  [15] = "#c5c7c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c5c7c7", /* foreground */
  [258] = "#c5c7c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
