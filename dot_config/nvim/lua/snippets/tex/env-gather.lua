local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="gg",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{gather*}
        <>
        \end{gather*}
        <>
        ]],
        {
          i(1),
          i(0)
        }
      ),
      {condition=utils.line_begin}
    ),
  }
