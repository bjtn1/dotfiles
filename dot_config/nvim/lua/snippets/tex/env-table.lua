local u = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="hl",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \hline<>
        ]],
        {
          i(1),
        }
      ),
      {condition=u.in_table}
    ),

  }
