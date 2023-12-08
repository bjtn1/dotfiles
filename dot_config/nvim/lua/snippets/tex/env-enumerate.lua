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
        \begin{enumerate}

            \item <>

        \end{enumerate}
      ]],
        {
          i(0),
        }
      )
    ),
  }
