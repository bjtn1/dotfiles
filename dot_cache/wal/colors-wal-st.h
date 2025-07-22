const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#3C82CE", /* red     */
  [2] = "#6693CE", /* green   */
  [3] = "#9D93B7", /* yellow  */
  [4] = "#DFAFB7", /* blue    */
  [5] = "#9EADD1", /* magenta */
  [6] = "#D3B4CA", /* cyan    */
  [7] = "#c8c9d2", /* white   */

  /* 8 bright colors */
  [8]  = "#707389",  /* black   */
  [9]  = "#3C82CE",  /* red     */
  [10] = "#6693CE", /* green   */
  [11] = "#9D93B7", /* yellow  */
  [12] = "#DFAFB7", /* blue    */
  [13] = "#9EADD1", /* magenta */
  [14] = "#D3B4CA", /* cyan    */
  [15] = "#c8c9d2", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c8c9d2", /* foreground */
  [258] = "#c8c9d2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
