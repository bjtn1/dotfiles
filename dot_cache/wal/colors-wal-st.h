const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#D96829", /* red     */
  [2] = "#AB7251", /* green   */
  [3] = "#DB9B58", /* yellow  */
  [4] = "#EBB65B", /* blue    */
  [5] = "#987F80", /* magenta */
  [6] = "#C7A99F", /* cyan    */
  [7] = "#c6c3c2", /* white   */

  /* 8 bright colors */
  [8]  = "#70615b",  /* black   */
  [9]  = "#D96829",  /* red     */
  [10] = "#AB7251", /* green   */
  [11] = "#DB9B58", /* yellow  */
  [12] = "#EBB65B", /* blue    */
  [13] = "#987F80", /* magenta */
  [14] = "#C7A99F", /* cyan    */
  [15] = "#c6c3c2", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c6c3c2", /* foreground */
  [258] = "#c6c3c2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
