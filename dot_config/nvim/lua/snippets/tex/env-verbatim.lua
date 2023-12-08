local u = require "helpers.tex.utils"

return
  {
    s(
      {
        trig="vrb",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \begin{Verbatim}[numbers=left, frame=single]
        <>
        \end{Verbatim}<>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {condition=u.line_begin}
    )
  }
