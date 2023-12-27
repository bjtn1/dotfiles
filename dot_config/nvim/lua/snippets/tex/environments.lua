local line_begin = require("luasnip.extras.expand_conditions").line_begin
local u = require("helpers.tex.utils")

return
  {
    ------------------------------ BEGIN ALIGN SECTION ------------------------------
    -- For adding intertext in an align environment
    s(
      {
        trig="itt",
        snippetType="autosnippet",
      },
      fmta(
        [[
          \intertext{<>}<>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {
        condition=u.in_align
      }
    ),

    -- For adding text in an align environment
    s(
      {
        trig="tt",
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
        condition=u.in_align
      }
    ),

    -- For adding an align environment
    s(
      {
        trig="aa",
        dsc="Align environment",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{align*}
            <>
        \end{align*}<>
        ]],
        {
          i(1),
          i(0)
        }
      ),
      {
        condition=u.line_begin
      }
    ),

    s(
      {
        trig="l=",
        snippetType="autosnippet"
      },
      fmta(
        [[
        &= <>
        ]],
        {
          i(0),
        }
      ),
      {condition=u.in_align and not u.in_equation}
    ),

    ------------------------------ END ALIGN SECTION ------------------------------

    ------------------------------ BEGIN GENERAL SECTION ------------------------------
    -- Sources
    -- https://github.com/ejmastnak/dotfiles/blob/main/config/nvim/LuaSnip/tex/environments.lua
    -- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#hello-world
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
        -- condition=line_begin
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
    ------------------------------ END GENERAL SECTION ------------------------------
  }
