const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#D23B3A", /* red     */
  [2] = "#EA5731", /* green   */
  [3] = "#A0354D", /* yellow  */
  [4] = "#C35A55", /* blue    */
  [5] = "#F99833", /* magenta */
  [6] = "#FDC839", /* cyan    */
  [7] = "#c2c1c4", /* white   */

  /* 8 bright colors */
  [8]  = "#5b596c",  /* black   */
  [9]  = "#D23B3A",  /* red     */
  [10] = "#EA5731", /* green   */
  [11] = "#A0354D", /* yellow  */
  [12] = "#C35A55", /* blue    */
  [13] = "#F99833", /* magenta */
  [14] = "#FDC839", /* cyan    */
  [15] = "#c2c1c4", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c2c1c4", /* foreground */
  [258] = "#c2c1c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
