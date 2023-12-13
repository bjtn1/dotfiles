local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="vec",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \vec{<>}<>
        ]],
        {
          i(1),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="norm",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \left|\left|\vec{<>}\right|\right|<>
        ]],
        {
          i(1),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="mat",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \begin{<>matrix}
        <>
        \end{<>matrix}<>
        ]],
        {
          i(1),
          i(2),
          rep(1),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="det",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \det\left({<>}\right) <>
        ]],
        {
          i(1),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    )
  }

