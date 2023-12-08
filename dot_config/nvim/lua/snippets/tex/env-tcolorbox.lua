local u = require "helpers.tex.utils"

return
  {
-- TODO
    s(
      {
        trig="tcb",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \begin{tcolorbox}[title=<>]
        <>
        \end{tcolorbox}<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      {condition=u.line_begin}
    )

  }
