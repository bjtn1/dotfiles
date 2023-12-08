local u = require "helpers.tex.utils"

return
  {
    s(
      {
        trig="fig",
        dscr="Figure environment",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \begin{figure}[htb!]
          \centering
          \includegraphics[width=<>\linewidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
        }
      ),
      {
        condition=u.line_begin
      }
    ),
  }
