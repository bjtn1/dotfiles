local u = require "helpers.tex.utils"

return
  {
    -- s(
    --   {
    --     trig="{",
    --     -- regTrig=true,
    --     -- wordTrig=false,
    --     snippetType="autosnippet",
    --   },
    --   fmta(
    --     [[
    --     {<>}<>
    --     ]],
    --     {
    --       -- f( function(_, snip) return snip.captures[1] end ),
    --       i(1),
    --       i(0),
    --     }
    --   ),
    --   {condition=u.in_text}
    -- ),
    --
    -- s(
    --   {
    --     trig="[",
    --     -- regTrig=true,
    --     -- wordTrig=false,
    --     snippetType="autosnippet",
    --   },
    --   fmta(
    --     [[
    --     [<>]<>
    --     ]],
    --     {
    --       -- f( function(_, snip) return snip.captures[1] end ),
    --       i(1),
    --       i(0),
    --     }
    --   ),
    --   {condition=u.in_text}
    -- ),
    --
    -- s(
    --   {
    --     trig="(",
    --     -- regTrig=true,
    --     -- wordTrig=false,
    --     snippetType="autosnippet",
    --   },
    --   fmta(
    --     [[
    --     (<>)<>
    --     ]],
    --     {
    --       -- f( function(_, snip) return snip.captures[1] end ),
    --       i(1),
    --       i(0),
    --     }
    --   ),
    --   {condition=u.in_text}
    -- ),

    -- For references
    s(
      {
        trig="([^%a])rr",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        <>\cref{<>}<>
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(0),
        }
      ),
      {condition=u.in_text}
    ),

    -- For adding newline in matrices and tables
    s(
      {
        trig="\\\\",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        <>\\
        <>
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(0),
        }
      ),
      {condition=u.in_bmatrix or u.in_table}
    ),

    -- For adding column delimeter in matrices and tables
    s(
      {
        trig=" ",
        snippetType="autosnippet",
      },
      fmta(
        [[
        & <>
        ]],
        {
          i(1),
        }
      ),
      {condition=u.in_bmatrix or u.in_table}
    ),

    -- For adding links
    s(
      {
        trig="href",
        dscr="The hyperref package's href{}{} command (for url links)",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \href{<>}{<>}
        ]],
        {
          i(1, "url"),
          i(2, "display name"),
        }
      ),
      {condition=u.in_text}
    ),

    -- For bold fonts in text
    s(
      {
        trig="*",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \textbf{<>}<>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {condition=u.in_text}
    ),

    -- For italicizing in text
    s(
      {
        trig="emp",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \emph{<>}<>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {condition=u.in_text}
    ),
  }
