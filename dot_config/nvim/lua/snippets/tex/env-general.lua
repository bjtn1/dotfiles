-- Example: expanding a snippet on a new line only.
-- In a snippet file, first require the line_begin condition...
-- sources
-- https://github.com/ejmastnak/dotfiles/blob/main/config/nvim/LuaSnip/tex/environments.lua
-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#hello-world
-- TODO
-- CLEAN THIS UP MAKE IT MODULAR LIKE YOU DID WITH env-ENVIRONEMTN.lua files
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local utils = require("helpers.tex.utils")

return
  {
    -- GENERIC ENVIRONMENT --
    s(
      {
        trig="new",
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
    s({trig="n2", snippetType="autosnippet"},
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
    s({trig="n3", snippetType="autosnippet"},
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
