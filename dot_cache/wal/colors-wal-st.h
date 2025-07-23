const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#667BC3", /* red     */
  [2] = "#9470A7", /* green   */
  [3] = "#7A83B5", /* yellow  */
  [4] = "#7388D1", /* blue    */
  [5] = "#7E92E1", /* magenta */
  [6] = "#D1A0BB", /* cyan    */
  [7] = "#c3c4c9", /* white   */

  /* 8 bright colors */
  [8]  = "#606276",  /* black   */
  [9]  = "#667BC3",  /* red     */
  [10] = "#9470A7", /* green   */
  [11] = "#7A83B5", /* yellow  */
  [12] = "#7388D1", /* blue    */
  [13] = "#7E92E1", /* magenta */
  [14] = "#D1A0BB", /* cyan    */
  [15] = "#c3c4c9", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c4c9", /* foreground */
  [258] = "#c3c4c9",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
