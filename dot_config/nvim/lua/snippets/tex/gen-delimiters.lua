local line_begin = require("luasnip.extras.expand_conditions").line_begin
local text_utils = require("helpers.tex.utils")
local utils      = require("helpers.tex.utils")

return
  {
    -- LEFT/RIGHT PARENTHESES --
    -- NOTE
    -- The commented out trig forces you to put a space after the thing you wanna put an opening parentheses on `O<space>(...)` vs `O(...)`
    -- This does not make a difference once LaTeX gets rendered, but it's kind of annoying having to type a space before your parentheses trig
    -- If errors related to any of these trigs come up, consider uncommenting trig to fix them
    -- This relates to all of the bottom trigs
    s(
      {
        -- trig="([^%a])lp",
        trig="lp",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        <>\left(<>\right)<>
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    -- LEFT/RIGHT SQUARE BRACES --
    s(
      {
        -- trig="([^%a])ls",
        trig="ls",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        <>\left[<>\right]<>
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    -- LEFT/RIGHT CURLY BRACES --
    s(
      {
        -- trig="([^%a])lc",
        trig="lc",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        <>\left\{<>\right\}<>
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    -- LEFT/RIGHT BARS --
    s(
      {
        trig="l\\",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \left|<>\right|
        ]],
        {
          i(1),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    -- LEFT/RIGHT ANGLED BRACES --
    s(
      {
        -- trig="([^%a])la",
        trig="la",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        <>\left\langle{<>}\right\rangle<>
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    -- LEFT/RIGHT CELING --
    s(
      {
        trig="ceil",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \left\lceil{<>}\right\rceil <>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    -- LEFT/RIGHT FLOOR --
    s(
      {
        trig="flo",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \left\lfloor{<>}\right\rfloor <>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),
  }
