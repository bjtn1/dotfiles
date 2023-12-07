local line_begin = require("luasnip.extras.expand_conditions").line_begin
local text_utils = require("helpers.tex.utils")

return
  {
    -- LEFT/RIGHT PARENTHESES --
    s(
      {
        trig="([^%a])l%(",
        dscr="Left/right parentheses",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        \left(<>\right)
        ]],
        {
          i(1)
        }
      )
    ),

    -- LEFT/RIGHT SQUARE BRACES --
    s(
      {
        trig="([^%a])l%[",
        dscr="Left/right square braces",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        \left[<>\right]
        ]],
        {
          i(1)
        }
      )
    ),

    -- LEFT/RIGHT CURLY BRACES --
    s(
      {
        trig="([^%a])l%}",
        dscr="Left/right curly braces",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        \left{<>\right}
        ]],
        {
          i(1)
        }
      )
    ),
  }
