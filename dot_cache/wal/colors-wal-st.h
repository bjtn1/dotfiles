const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#566463", /* red     */
  [2] = "#7D8A7F", /* green   */
  [3] = "#4D6688", /* yellow  */
  [4] = "#A3AA9B", /* blue    */
  [5] = "#BABFB3", /* magenta */
  [6] = "#D0CDB5", /* cyan    */
  [7] = "#c2c4c7", /* white   */

  /* 8 bright colors */
  [8]  = "#5d6472",  /* black   */
  [9]  = "#566463",  /* red     */
  [10] = "#7D8A7F", /* green   */
  [11] = "#4D6688", /* yellow  */
  [12] = "#A3AA9B", /* blue    */
  [13] = "#BABFB3", /* magenta */
  [14] = "#D0CDB5", /* cyan    */
  [15] = "#c2c4c7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c2c4c7", /* foreground */
  [258] = "#c2c4c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
