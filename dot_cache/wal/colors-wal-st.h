const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#31454F", /* red     */
  [2] = "#2B5366", /* green   */
  [3] = "#4D4F4E", /* yellow  */
  [4] = "#656766", /* blue    */
  [5] = "#A73B36", /* magenta */
  [6] = "#80817F", /* cyan    */
  [7] = "#c1c5c5", /* white   */

  /* 8 bright colors */
  [8]  = "#596d6d",  /* black   */
  [9]  = "#31454F",  /* red     */
  [10] = "#2B5366", /* green   */
  [11] = "#4D4F4E", /* yellow  */
  [12] = "#656766", /* blue    */
  [13] = "#A73B36", /* magenta */
  [14] = "#80817F", /* cyan    */
  [15] = "#c1c5c5", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c1c5c5", /* foreground */
  [258] = "#c1c5c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
