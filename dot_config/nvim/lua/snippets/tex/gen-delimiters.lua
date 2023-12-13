local line_begin = require("luasnip.extras.expand_conditions").line_begin
local text_utils = require("helpers.tex.utils")
local utils      = require("helpers.tex.utils")

return
  {
    -- LEFT/RIGHT PARENTHESES --
    s(
      {
        -- trig="([^%a])lp",
        trig="(",
        -- regTrig=true,
        -- wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        \left(<>\right)<>
        ]],
        {
          -- f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    -- LEFT/RIGHT SQUARE BRACES --
    s(
      {
        -- trig="([^%a])lp",
        trig="[",
        -- regTrig=true,
        -- wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        \left[<>\right]<>
        ]],
        {
          -- f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    -- LEFT/RIGHT CURLY BRACES --
    s(
      {
        -- trig="([^%a])lp",
        trig="{",
        -- regTrig=true,
        -- wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        \left{<>\right}<>
        ]],
        {
          -- f( function(_, snip) return snip.captures[1] end ),
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
        trig="l<",
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
