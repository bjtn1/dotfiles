-- Example: expanding a snippet on a new line only.
-- In a snippet file, first require the line_begin condition...
-- sources
-- https://github.com/ejmastnak/dotfiles/blob/main/config/nvim/LuaSnip/tex/environments.lua
-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#hello-world
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local text_utils = require("helpers.tex.utils")

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
    s(
      {
        trig="nn",
        dscr="Equation environment",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \begin{equation}
          <>
        \end{equation}
        ]],
        {
          i(1)
        }
      ),
      {
        condition=line_begin
      }
    ),

    -- SPLIT EQUATION ENVIRONMENT --
    s(
      {
        trig="ss",
        dscr="Split equation environment",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \begin{equation*}
          \begin{split}
              <>
          \end{split}
        \end{equation*}
        ]],
        {
          i(1)
        }
      ),
      {
        condition=line_begin
      }
    ),

    -- ALIGN ENVIRONMENT --
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
        \end{align*}
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
    s(
      {
        trig="itt",
        dscr="Itemize environment",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{itemize}

            \item <>

        \end{itemize}
      ]],
        {
          i(0),
        }
      ),
      {
        condition=line_begin
      }
    ),

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
        \[<>\]
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

    -- TIKZPICTURE ENVIRONMENT --
    s(
      {
        trig="tik",
        dscr="Tikzpicture environment",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{tikzpicture}
          <>
        \end{tikzpicture}
        ]],
        {
          i(1)
        }
      ),
      {
        condition=line_begin
      }
    )
  }
