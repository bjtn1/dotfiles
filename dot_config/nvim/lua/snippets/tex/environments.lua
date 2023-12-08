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

    -- EQUATION ENVIRONMENT --

    -- SPLIT EQUATION ENVIRONMENT --
    -- s(
    --   {
    --     trig="ss",
    --     dscr="Split equation environment",
    --     snippetType="autosnippet",
    --   },
    --   fmta(
    --     [[
    --     \begin{equation*}
    --       \begin{split}
    --           <>
    --       \end{split}
    --     \end{equation*}
    --     ]],
    --     {
    --       i(1)
    --     }
    --   ),
    --   {
    --     condition=line_begin
    --   }
    -- ),

    -- GATHER ENVIRONMENT --
    s(
      {
        trig="gg",
        dsc="Gather environment",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{gather*}
            <>
        \end{gather*}
        ]],
        {
          i(1)
        }
      ),
      {
        condition=line_begin
      }
    ),

    -- ITEMIZE ENVIRONMENT --

    -- ENUMERATE ENVIRONMENT --
    s(
      {
        trig="enn",
        dscr="Enumerate environment",
      },
      fmta(
        [[
        \begin{enumerate}

            \item <>

        \end{enumerate}
      ]],
        {
          i(0),
        }
      )
    ),

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

    -- FIGURE ENVIRONMENT --
    s(
      {
        trig="fig",
        dscr="Figure environment",
      },
      fmta(
        [[
        \begin{figure}[htb!]
          \centering
          \includegraphics[width=<>\linewidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
        }
      ),
      {
        condition=line_begin
      }
    ),

    -- PIECEWISE FUNCTION ENVIRONMENT --

    s(
      {
        trig="pf",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{cases}
        <>
        \end{cases}
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="piecewisefunc",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{cases}
        <>
        \end{cases}
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

  }
