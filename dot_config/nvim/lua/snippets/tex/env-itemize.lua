local u = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="itt",
        dscr="Itemize environment",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{itemize}
            \item <>
        \end{itemize}
        ]],
        {
          i(1),
        }
      ),
      {
        condition=u.line_begin and u.in_text
      }
    ),

    s(
      {
        trig="ii",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \item <>
        <>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {
        condition=u.line_begin and u.in_text and u.in_itemize
      }
    ),

  }
