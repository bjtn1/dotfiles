local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="\\\\",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \\
        <>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="__",
        snippetType="autosnippet",
      },
      fmta(
        [[
        _{<>}<>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="tt",
        dscr="Expands 'tt' into '\text{}'",
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
        condition=utils.in_mathzone
      }
    ),

    s(
      {
        -- NOTE
        -- When using regex, put <> at the beginning of the expansion and add the `f( function...)` node first.
        -- You have to do this because regex "eats" whatever is right before the expansion
        trig="([^%a])ff",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet"
      },
      fmta(
        [[
          <>\frac{<>}{<>}<>
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(2),
          i(0)
        }
      ),
      {
        condition=utils.in_mathzone
      }
    ),

  }
