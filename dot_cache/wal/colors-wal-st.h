const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#4C4C56", /* red     */
  [2] = "#5C5D6A", /* green   */
  [3] = "#936F6E", /* yellow  */
  [4] = "#A6867A", /* blue    */
  [5] = "#335D84", /* magenta */
  [6] = "#556E90", /* cyan    */
  [7] = "#c3c4c7", /* white   */

  /* 8 bright colors */
  [8]  = "#5e6572",  /* black   */
  [9]  = "#4C4C56",  /* red     */
  [10] = "#5C5D6A", /* green   */
  [11] = "#936F6E", /* yellow  */
  [12] = "#A6867A", /* blue    */
  [13] = "#335D84", /* magenta */
  [14] = "#556E90", /* cyan    */
  [15] = "#c3c4c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c4c7", /* foreground */
  [258] = "#c3c4c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
