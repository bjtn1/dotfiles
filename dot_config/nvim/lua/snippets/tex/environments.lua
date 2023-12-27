-- Sources
-- https://github.com/ejmastnak/dotfiles/blob/main/config/nvim/LuaSnip/tex/environments.lua
-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#hello-world
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local u = require("helpers.tex.utils")

return
  {
    -- GENERIC ENVIRONMENT --
    s(
      {
        trig="bb",
        dscr="A generic new environment",
        snippetType="autosnippet"
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
          rep(1)
        }
      ),
      {
        condition=line_begin
      }
    ),

    -- ENVIRONMENT WITH ONE EXTRA ARGUMENT
    s({trig="b2", snippetType="autosnippet"},
      fmta(
        [[
        \begin{<>}{<>}
            <>
        \end{<>}
      ]],
        {
          i(1),
          i(2),
          i(3),
          rep(1),
        }
      ),
      { condition = line_begin }
    ),

    -- ENVIRONMENT WITH TWO EXTRA ARGUMENTS
    s({trig="b3", snippetType="autosnippet"},
      fmta(
        [[
        \begin{<>}{<>}{<>}
            <>
        \end{<>}
      ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
          rep(1),
        }
      ),
      { condition = line_begin }
    ),
  }
