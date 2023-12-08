local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="to",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \to <>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="composition",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \circ <>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

  }

