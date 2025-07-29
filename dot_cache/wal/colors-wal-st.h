const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#D65F39", /* red     */
  [2] = "#9D6A4F", /* green   */
  [3] = "#C89548", /* yellow  */
  [4] = "#DFA05A", /* blue    */
  [5] = "#FADD70", /* magenta */
  [6] = "#668EAB", /* cyan    */
  [7] = "#c3c3c3", /* white   */

  /* 8 bright colors */
  [8]  = "#59596d",  /* black   */
  [9]  = "#D65F39",  /* red     */
  [10] = "#9D6A4F", /* green   */
  [11] = "#C89548", /* yellow  */
  [12] = "#DFA05A", /* blue    */
  [13] = "#FADD70", /* magenta */
  [14] = "#668EAB", /* cyan    */
  [15] = "#c3c3c3", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c3c3", /* foreground */
  [258] = "#c3c3c3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
