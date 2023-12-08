local u = require "helpers.tex.utils"

return
  {
    -- PIECEWISE FUNCTION ENVIRONMENT --

    s(
      {
        trig="pf",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{cases}
        <>
        \end{cases}
        ]],
        {
          i(0),
        }
      ),
      {condition=u.in_mathzone}
    ),

  }
