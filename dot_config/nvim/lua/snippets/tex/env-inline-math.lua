local u = require "helpers.tex.utils"

return
  {
    -- INLINE MATH --
    s(
      {
        trig="([^%l]mm)",
        dscr="Inline math",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        <>\[<>\]
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual),
        }
      )
    ),

    -- INLINE MATH ON NEW LINE --
    s(
      {
        trig="^mm",
        dscr="Inline math (new line)",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        \[\displaystyle <>\]
        ]],
        {
          i(1)
        }
      )
    ),

  }
