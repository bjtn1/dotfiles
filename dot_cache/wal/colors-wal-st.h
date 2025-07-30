const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#ED6D4B", /* red     */
  [2] = "#E6B45F", /* green   */
  [3] = "#E5A161", /* yellow  */
  [4] = "#8E7F8D", /* blue    */
  [5] = "#A9A096", /* magenta */
  [6] = "#DFB689", /* cyan    */
  [7] = "#c6c2c2", /* white   */

  /* 8 bright colors */
  [8]  = "#6f5b5b",  /* black   */
  [9]  = "#ED6D4B",  /* red     */
  [10] = "#E6B45F", /* green   */
  [11] = "#E5A161", /* yellow  */
  [12] = "#8E7F8D", /* blue    */
  [13] = "#A9A096", /* magenta */
  [14] = "#DFB689", /* cyan    */
  [15] = "#c6c2c2", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c6c2c2", /* foreground */
  [258] = "#c6c2c2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
