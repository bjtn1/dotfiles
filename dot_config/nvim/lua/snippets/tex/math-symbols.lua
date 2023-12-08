local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="pm",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \pm <>
        ]],
        {
          i(0),
        }
      ),
      {
        condition = utils.in_mathzone
      }
    ),

    s(
      {
        trig="cd",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \cdot <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="times",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \cdot <>
        ]],
        {
          i(0)
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="xor",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \otimes <>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="ne",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \ne <>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="le",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \le <>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="ge",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \ge <>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="approx",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \approx <>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="inf",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \infty<>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="ellipsis",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \cdots<>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="dots",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \cdots<>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="sqrt",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \sqrt{<>}<>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="nrt",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \sqrt[<>]{<>}<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="ln",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \ln\left(<>\right)<>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="log",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \log_{<>}\left(<>\right)<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="ee",
        snippetType="autosnippet",
      },
      fmta(
        [[
        e^{<>}
        ]],
        {
          i(1)
        }
      ),
      {
        condition=utils.in_mathzone
      }
    ),

    s(
      {
        trig="mod",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \mod <>
        ]],
        {
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),
  }

