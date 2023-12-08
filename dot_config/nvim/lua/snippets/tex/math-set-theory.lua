local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="inn",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \in <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="notin",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \not\in <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="subset",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \subset <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="subseteq",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \subseteq <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="notsubset",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \not\subset <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="supset",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \supset <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="supseteq",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \supseteq <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="union",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \cup <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="intersection",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \cap <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="cup",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \cup <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="cap",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \cap <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="bigcup",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \bigcup_{<>}^{<>} <>
        ]],
        {
          i(1),
          i(2),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="bigcap",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \bigcap_{<>}^{<>} <>
        ]],
        {
          i(1),
          i(2),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="bigunion",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \bigcup_{<>}^{<>} <>
        ]],
        {
          i(1),
          i(2),
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="bigintersection",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \bigcap_{<>}^{<>} <>
        ]],
        {
          i(1),
          i(2),
          i(0)
        }
      ),
      {condition = utils.in_mathzone}
    ),

    s(
      {
        trig="emptyset",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \emptyset <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="powerset",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \mathcal{P} <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="min",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \min <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="max",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \max <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),
  }
