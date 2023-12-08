local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="tik",
        dscr="Tikzpicture environment",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{tikzpicture}
          <>
        \end{tikzpicture}
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
        trig="dd",
        dscr="Draw in tikzpicture env",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \draw [<>]
        ]],
        {
          i(1, "params")
        }
      ),
      {
        condition=utils.in_tikz
      }
    ),

  }
