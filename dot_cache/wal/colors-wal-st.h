const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#B19CC5", /* red     */
  [2] = "#92ABD8", /* green   */
  [3] = "#AEB0D4", /* yellow  */
  [4] = "#CB9DC2", /* blue    */
  [5] = "#D0ADC8", /* magenta */
  [6] = "#EFB3C5", /* cyan    */
  [7] = "#ddd1d8", /* white   */

  /* 8 bright colors */
  [8]  = "#a18d99",  /* black   */
  [9]  = "#B19CC5",  /* red     */
  [10] = "#92ABD8", /* green   */
  [11] = "#AEB0D4", /* yellow  */
  [12] = "#CB9DC2", /* blue    */
  [13] = "#D0ADC8", /* magenta */
  [14] = "#EFB3C5", /* cyan    */
  [15] = "#ddd1d8", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#ddd1d8", /* foreground */
  [258] = "#ddd1d8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
