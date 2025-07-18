const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#8F725A", /* red     */
  [2] = "#7C8476", /* green   */
  [3] = "#A1886E", /* yellow  */
  [4] = "#CDA272", /* blue    */
  [5] = "#A0A49A", /* magenta */
  [6] = "#D0BA98", /* cyan    */
  [7] = "#c7c3c2", /* white   */

  /* 8 bright colors */
  [8]  = "#71615c",  /* black   */
  [9]  = "#8F725A",  /* red     */
  [10] = "#7C8476", /* green   */
  [11] = "#A1886E", /* yellow  */
  [12] = "#CDA272", /* blue    */
  [13] = "#A0A49A", /* magenta */
  [14] = "#D0BA98", /* cyan    */
  [15] = "#c7c3c2", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c7c3c2", /* foreground */
  [258] = "#c7c3c2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
