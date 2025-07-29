const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#AB674E", /* red     */
  [2] = "#548654", /* green   */
  [3] = "#6B8D66", /* yellow  */
  [4] = "#A0996D", /* blue    */
  [5] = "#547588", /* magenta */
  [6] = "#609BA5", /* cyan    */
  [7] = "#c3c6c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5d716d",  /* black   */
  [9]  = "#AB674E",  /* red     */
  [10] = "#548654", /* green   */
  [11] = "#6B8D66", /* yellow  */
  [12] = "#A0996D", /* blue    */
  [13] = "#547588", /* magenta */
  [14] = "#609BA5", /* cyan    */
  [15] = "#c3c6c6", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c6c6", /* foreground */
  [258] = "#c3c6c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
