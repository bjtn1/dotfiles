const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#AD916F", /* red     */
  [2] = "#517987", /* green   */
  [3] = "#8B7E81", /* yellow  */
  [4] = "#5A8C91", /* blue    */
  [5] = "#A49E97", /* magenta */
  [6] = "#DDAD93", /* cyan    */
  [7] = "#c3c5c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5d6a71",  /* black   */
  [9]  = "#AD916F",  /* red     */
  [10] = "#517987", /* green   */
  [11] = "#8B7E81", /* yellow  */
  [12] = "#5A8C91", /* blue    */
  [13] = "#A49E97", /* magenta */
  [14] = "#DDAD93", /* cyan    */
  [15] = "#c3c5c6", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c5c6", /* foreground */
  [258] = "#c3c5c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
