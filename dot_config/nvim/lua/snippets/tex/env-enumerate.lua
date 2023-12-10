local u = require "helpers.tex.utils"

return
  {
    s(
      {
        trig="enn",
        dscr="Enumerate environment",
      },
      fmta(
        [[
        \begin{enumerate}\label{<>}
            \item <>
        \end{enumerate}
      ]],
        {
          i(1),
          i(0),
        }
      )
    ),
  }
