local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="tt",
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
        condition=utils.in_align
      }
    ),

    s(
      {
        trig="te",
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
        condition=utils.in_align
      }
    ),

    s(
      {
        trig="aa",
        dsc="Align environment",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{align}\label{<>}
            <>
        \end{align}
        ]],
        {
          i(1),
          i(2)
        }
      ),
      {
        condition=utils.line_begin
      }
    ),

    s(
      {
        trig="al=",
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
      {condition=utils.in_align and not utils.in_equation}
    ),

    s(
      {
        trig="test",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \text{This should run in align only}<>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_align}
    )
  }
