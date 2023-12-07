return
  {
    s(
      {
        trig="tt",
        dscr="Expands 'tt' into '\text{}'",
        snippetType="autosnippet",
      },
      fmta(
        [[
          \text{<>}
        ]],
        {
          i(1)
        }
      )
    ),

    s(
      {
        trig="ff",
        dscr="Expands 'ff' into '\frac{}{}'",
        snippetType="autosnippet",
      },
      fmta(
        [[
          \frac{<>}{<>}
        ]],
        {
          i(1),
          i(2)
        }
      )
    ),

    s(
      {
        trig="eq",
        dscr="A LaTeX equation environment",
        snippetType="autosnippet"
      },
      fmta(
        [[
          \begin{equation*}
            <>
          \end{equation*}
        ]],
        {
          i(1),
        }
      )
    ),

    s(
      {
        trig="env",
        dscr="Begin environment",
        snippetType="autosnippet",
      },
      fmta(
        [[
          \begin{<>}
            <>
          \end{<>}
        ]],
        {
          i(1),
          i(2),
          rep(1),
        }
      )
    ),

    s(
      {
        trig="href",
        dscr="The hyperref package's href{}{} command (for url links)",
      },
      fmta(
        [[
          \href{<>}{<>}
        ]],
        {
          i(1, "url"),
          i(2, "display name"),
        }
      )
    ),

    s(
      {
        trig="mm",
        dscr="Inline math",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \[<>\]
        ]],
        {
          i(1),
        }
      )
    ),
  }
