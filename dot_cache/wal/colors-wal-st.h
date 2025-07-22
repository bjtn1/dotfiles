const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#505065", /* red     */
  [2] = "#535267", /* green   */
  [3] = "#6E6678", /* yellow  */
  [4] = "#82727C", /* blue    */
  [5] = "#7D7181", /* magenta */
  [6] = "#887988", /* cyan    */
  [7] = "#c1c1c5", /* white   */

  /* 8 bright colors */
  [8]  = "#59596d",  /* black   */
  [9]  = "#505065",  /* red     */
  [10] = "#535267", /* green   */
  [11] = "#6E6678", /* yellow  */
  [12] = "#82727C", /* blue    */
  [13] = "#7D7181", /* magenta */
  [14] = "#887988", /* cyan    */
  [15] = "#c1c1c5", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c1c1c5", /* foreground */
  [258] = "#c1c1c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
