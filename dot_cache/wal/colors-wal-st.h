const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#AC9472", /* red     */
  [2] = "#225BA1", /* green   */
  [3] = "#2857B2", /* yellow  */
  [4] = "#5F66A0", /* blue    */
  [5] = "#946D9D", /* magenta */
  [6] = "#4B94C8", /* cyan    */
  [7] = "#c4c6cc", /* white   */

  /* 8 bright colors */
  [8]  = "#646b7b",  /* black   */
  [9]  = "#AC9472",  /* red     */
  [10] = "#225BA1", /* green   */
  [11] = "#2857B2", /* yellow  */
  [12] = "#5F66A0", /* blue    */
  [13] = "#946D9D", /* magenta */
  [14] = "#4B94C8", /* cyan    */
  [15] = "#c4c6cc", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c4c6cc", /* foreground */
  [258] = "#c4c6cc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
