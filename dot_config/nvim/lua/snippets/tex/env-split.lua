local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="tt",
        snippetType="autosnippet",
      },
      fmta(
        [[
          \intertext{<>}<>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {
        condition=utils.in_align
      }
    ),

    s(
      {
        trig="te",
        snippetType="autosnippet",
      },
      fmta(
        [[
          \text{<>}<>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {
        condition=utils.in_align
      }
    ),

    s(
      {
        trig="ss",
        dsc="Align split environment",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{align}\label{<>}
        \begin{split}
            <>
        \end{split}
        \end{align}
        ]],
        {
          i(1),
          i(2)
        }
      ),
      {
        condition=utils.line_begin
      }
    ),

  }
