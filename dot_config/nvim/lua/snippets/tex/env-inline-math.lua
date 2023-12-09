local u = require "helpers.tex.utils"

return
  {
    -- INLINE MATH --
    -- s(
    --   {
    --     trig="([^%a]mm)",
    --     dscr="Inline math",
    --     regTrig=true,
    --     wordTrig=false,
    --     snippetType="autosnippet",
    --   },
    --   fmta(
    --     [[
    --     <>\[<>\]
    --     ]],
    --     {
    --       f( function(_, snip) return snip.captures[1] end ),
    --       i(1),
    --     }
    --   )
    -- ),

    -- INLINE MATH ON NEW LINE --
    s(
      {
        trig="([^%l])mm",
        -- trig="mm",
        dscr="Inline math",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        <>$ <> $<>
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(0),
        }
      )
    ),

    s(
      {
        trig="([^%l])nm",
        -- trig="mm",
        dscr="Inline math (new line)",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        <>
        \[
          <>
        \]<>
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(0)
        }
      )
    ),



  }
