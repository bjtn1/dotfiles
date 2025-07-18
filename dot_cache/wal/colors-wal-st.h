const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#F05B9A", /* red     */
  [2] = "#F730F5", /* green   */
  [3] = "#F461ED", /* yellow  */
  [4] = "#69A6F3", /* blue    */
  [5] = "#FC9F99", /* magenta */
  [6] = "#B4B8E0", /* cyan    */
  [7] = "#c4c3c6", /* white   */

  /* 8 bright colors */
  [8]  = "#605d71",  /* black   */
  [9]  = "#F05B9A",  /* red     */
  [10] = "#F730F5", /* green   */
  [11] = "#F461ED", /* yellow  */
  [12] = "#69A6F3", /* blue    */
  [13] = "#FC9F99", /* magenta */
  [14] = "#B4B8E0", /* cyan    */
  [15] = "#c4c3c6", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c3c6", /* foreground */
  [258] = "#c4c3c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
