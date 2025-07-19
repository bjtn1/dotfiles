const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#506F93", /* red     */
  [2] = "#A66886", /* green   */
  [3] = "#619BA0", /* yellow  */
  [4] = "#49ACB7", /* blue    */
  [5] = "#5FAADA", /* magenta */
  [6] = "#97A69F", /* cyan    */
  [7] = "#c6cfc8", /* white   */

  /* 8 bright colors */
  [8]  = "#6b826f",  /* black   */
  [9]  = "#506F93",  /* red     */
  [10] = "#A66886", /* green   */
  [11] = "#619BA0", /* yellow  */
  [12] = "#49ACB7", /* blue    */
  [13] = "#5FAADA", /* magenta */
  [14] = "#97A69F", /* cyan    */
  [15] = "#c6cfc8", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c6cfc8", /* foreground */
  [258] = "#c6cfc8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
