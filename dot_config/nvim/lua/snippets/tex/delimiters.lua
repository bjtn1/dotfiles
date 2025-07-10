-- Taken from https://github.com/ejmastnak/dotfiles/blob/main/config/nvim/LuaSnip/tex/delimiter.lua
local helpers = require('helpers.tex.utils')
local get_visual = helpers.get_visual

-- Math context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- Return snippet tables
return
{
  -- LEFT/RIGHT PARENTHESES
  s({trig = "([^%a])l%(", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\left(<>\\right)",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- LEFT/RIGHT SQUARE BRACES
  s({trig = "([^%a])l%[", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\left[<>\\right]",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- LEFT/RIGHT CURLY BRACES
  s({trig = "([^%a])l%{", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\left\\{<>\\right\\}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- BIG PARENTHESES
  s({trig = "([^%a])b%(", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\big(<>\\big)",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- BIG SQUARE BRACES
  s({trig = "([^%a])b%[", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\big[<>\\big]",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- BIG CURLY BRACES
  s({trig = "([^%a])b%{", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\big\\{<>\\big\\}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- ESCAPED CURLY BRACES
  s({trig = "([^%a])\\%{", regTrig = true, wordTrig = false, snippetType="autosnippet", priority=2000},
    fmta(
      "<>\\{<>\\}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- LATEX QUOTATION MARK
  s({trig = "``", snippetType="autosnippet"},
    fmta(
      "``<>''",
      {
        d(1, get_visual),
      }
    )
  ),
}

-- local line_begin = require("luasnip.extras.expand_conditions").line_begin
-- local text_utils = require("helpers.tex.utils")
-- local utils      = require("helpers.tex.utils")
--
-- return
--   {
--     -- LEFT/RIGHT PARENTHESES --
--     s(
--       {
--         -- trig="([^%a])lp",
--         trig="(",
--         -- regTrig=true,
--         -- wordTrig=false,
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--         \left(<>\right)<>
--         ]],
--         {
--           -- f( function(_, snip) return snip.captures[1] end ),
--           i(1),
--           i(0)
--         }
--       ),
--       {condition=utils.in_mathzone}
--     ),
--
--     -- LEFT/RIGHT SQUARE BRACES --
--     s(
--       {
--         -- trig="([^%a])lp",
--         trig="[",
--         -- regTrig=true,
--         -- wordTrig=false,
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--         \left[<>\right]<>
--         ]],
--         {
--           -- f( function(_, snip) return snip.captures[1] end ),
--           i(1),
--           i(0)
--         }
--       ),
--       {condition=utils.in_mathzone}
--     ),
--
--     -- LEFT/RIGHT CURLY BRACES --
--     s(
--       {
--         -- trig="([^%a])lp",
--         trig="{",
--         -- regTrig=true,
--         -- wordTrig=false,
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--         \left{<>\right}<>
--         ]],
--         {
--           -- f( function(_, snip) return snip.captures[1] end ),
--           i(1),
--           i(0)
--         }
--       ),
--       {condition=utils.in_mathzone}
--     ),
--
--     -- LEFT/RIGHT BARS --
--     s(
--       {
--         trig="l\\",
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--         \left|<>\right|
--         ]],
--         {
--           i(1),
--         }
--       ),
--       {condition=utils.in_mathzone}
--     ),
--
--     -- LEFT/RIGHT ANGLED BRACES --
--     s(
--       {
--         -- trig="([^%a])la",
--         trig="l<",
--         regTrig=true,
--         wordTrig=false,
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--         <>\left\langle{<>}\right\rangle<>
--         ]],
--         {
--           f( function(_, snip) return snip.captures[1] end ),
--           i(1),
--           i(0)
--         }
--       ),
--       {condition=utils.in_mathzone}
--     ),
--
--     -- LEFT/RIGHT CELING --
--     s(
--       {
--         trig="ceil",
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--         \left\lceil{<>}\right\rceil <>
--         ]],
--         {
--           i(1),
--           i(0),
--         }
--       ),
--       {condition=utils.in_mathzone}
--     ),
--
--     -- LEFT/RIGHT FLOOR --
--     s(
--       {
--         trig="flo",
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--         \left\lfloor{<>}\right\rfloor <>
--         ]],
--         {
--           i(1),
--           i(0),
--         }
--       ),
--       {condition=utils.in_mathzone}
--     ),
--   }
