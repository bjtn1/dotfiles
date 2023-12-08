local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="nn",
        dscr="Equation environment",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \begin{equation*}
          <>
        \end{equation*}
        ]],
        {
          i(1)
        }
      ),
      {
        condition=utils.line_begin
      }
    ),

    s(
      {
        trig="test",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \text{This should run in equation only}<>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_equation}
    )
  }
