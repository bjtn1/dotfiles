const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#573264", /* red     */
  [2] = "#684C68", /* green   */
  [3] = "#B55D5F", /* yellow  */
  [4] = "#975B6A", /* blue    */
  [5] = "#E6986F", /* magenta */
  [6] = "#735787", /* cyan    */
  [7] = "#c3c2c7", /* white   */

  /* 8 bright colors */
  [8]  = "#615d72",  /* black   */
  [9]  = "#573264",  /* red     */
  [10] = "#684C68", /* green   */
  [11] = "#B55D5F", /* yellow  */
  [12] = "#975B6A", /* blue    */
  [13] = "#E6986F", /* magenta */
  [14] = "#735787", /* cyan    */
  [15] = "#c3c2c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c2c7", /* foreground */
  [258] = "#c3c2c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
