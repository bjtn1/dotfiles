const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#BB4446", /* red     */
  [2] = "#EC665B", /* green   */
  [3] = "#AB8975", /* yellow  */
  [4] = "#F9946D", /* blue    */
  [5] = "#F75B8F", /* magenta */
  [6] = "#F4A897", /* cyan    */
  [7] = "#c3c1c1", /* white   */

  /* 8 bright colors */
  [8]  = "#6a5a57",  /* black   */
  [9]  = "#BB4446",  /* red     */
  [10] = "#EC665B", /* green   */
  [11] = "#AB8975", /* yellow  */
  [12] = "#F9946D", /* blue    */
  [13] = "#F75B8F", /* magenta */
  [14] = "#F4A897", /* cyan    */
  [15] = "#c3c1c1", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c1c1", /* foreground */
  [258] = "#c3c1c1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
