const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#6C5234", /* red     */
  [2] = "#3D4041", /* green   */
  [3] = "#504D4A", /* yellow  */
  [4] = "#6A6056", /* blue    */
  [5] = "#986833", /* magenta */
  [6] = "#8C7454", /* cyan    */
  [7] = "#c5c3c1", /* white   */

  /* 8 bright colors */
  [8]  = "#6d6259",  /* black   */
  [9]  = "#6C5234",  /* red     */
  [10] = "#3D4041", /* green   */
  [11] = "#504D4A", /* yellow  */
  [12] = "#6A6056", /* blue    */
  [13] = "#986833", /* magenta */
  [14] = "#8C7454", /* cyan    */
  [15] = "#c5c3c1", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c5c3c1", /* foreground */
  [258] = "#c5c3c1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
