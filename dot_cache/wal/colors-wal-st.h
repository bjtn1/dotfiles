const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#507298", /* red     */
  [2] = "#5D7498", /* green   */
  [3] = "#6C7792", /* yellow  */
  [4] = "#6C889A", /* blue    */
  [5] = "#6D97A4", /* magenta */
  [6] = "#7AA8C3", /* cyan    */
  [7] = "#c5c6c7", /* white   */

  /* 8 bright colors */
  [8]  = "#606676",  /* black   */
  [9]  = "#507298",  /* red     */
  [10] = "#5D7498", /* green   */
  [11] = "#6C7792", /* yellow  */
  [12] = "#6C889A", /* blue    */
  [13] = "#6D97A4", /* magenta */
  [14] = "#7AA8C3", /* cyan    */
  [15] = "#c5c6c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c5c6c7", /* foreground */
  [258] = "#c5c6c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
