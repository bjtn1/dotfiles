const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#E27051", /* red     */
  [2] = "#F09863", /* green   */
  [3] = "#F6CA40", /* yellow  */
  [4] = "#AC6F87", /* blue    */
  [5] = "#B29C9F", /* magenta */
  [6] = "#EDAB92", /* cyan    */
  [7] = "#c7c2c3", /* white   */

  /* 8 bright colors */
  [8]  = "#725d5f",  /* black   */
  [9]  = "#E27051",  /* red     */
  [10] = "#F09863", /* green   */
  [11] = "#F6CA40", /* yellow  */
  [12] = "#AC6F87", /* blue    */
  [13] = "#B29C9F", /* magenta */
  [14] = "#EDAB92", /* cyan    */
  [15] = "#c7c2c3", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c7c2c3", /* foreground */
  [258] = "#c7c2c3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
