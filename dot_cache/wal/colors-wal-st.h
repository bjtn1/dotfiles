const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#556E9C", /* red     */
  [2] = "#937989", /* green   */
  [3] = "#F5628D", /* yellow  */
  [4] = "#459FD0", /* blue    */
  [5] = "#9D8896", /* magenta */
  [6] = "#DCABA9", /* cyan    */
  [7] = "#c4c5ca", /* white   */

  /* 8 bright colors */
  [8]  = "#636679",  /* black   */
  [9]  = "#556E9C",  /* red     */
  [10] = "#937989", /* green   */
  [11] = "#F5628D", /* yellow  */
  [12] = "#459FD0", /* blue    */
  [13] = "#9D8896", /* magenta */
  [14] = "#DCABA9", /* cyan    */
  [15] = "#c4c5ca", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c5ca", /* foreground */
  [258] = "#c4c5ca",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
