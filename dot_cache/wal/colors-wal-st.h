const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#274D8E", /* red     */
  [2] = "#2962A9", /* green   */
  [3] = "#486098", /* yellow  */
  [4] = "#1F76D4", /* blue    */
  [5] = "#90718B", /* magenta */
  [6] = "#2599DF", /* cyan    */
  [7] = "#c8c6ca", /* white   */

  /* 8 bright colors */
  [8]  = "#6f657b",  /* black   */
  [9]  = "#274D8E",  /* red     */
  [10] = "#2962A9", /* green   */
  [11] = "#486098", /* yellow  */
  [12] = "#1F76D4", /* blue    */
  [13] = "#90718B", /* magenta */
  [14] = "#2599DF", /* cyan    */
  [15] = "#c8c6ca", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c8c6ca", /* foreground */
  [258] = "#c8c6ca",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
