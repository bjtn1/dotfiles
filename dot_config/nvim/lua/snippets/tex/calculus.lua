local utils = require("helpers.tex.utils")

return
  {
    -- s(
    --   {
    --     trig="prime",
    --     snippetType="autosnippet"
    --   },
    --   fmta(
    --     [[
    --     \<>'<>
    --     ]],
    --     {
    --       i(1),
    --       i(0),
    --     }
    --   ),
    --   {condition=utils.in_mathzone}
    -- ),

    s(
      {
        trig="derivative",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \frac{d<>}{d<>}<>
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
        trig="dv",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \frac{d<>}{d<>}<>
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
        trig="partial",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \frac{\partial <>}{\partial <>}<>
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
        trig="pdv",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \frac{\partial <>}{\partial <>}<>
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
        trig="int",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \<>int_{<>}^{<>}<> d{<>}<>
        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
          i(5),
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="ii",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \<>int_{<>}^{<>}<> d{<>}
        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
          i(0),
        }
      ),
      {condition=utils.in_mathzone}
    ),

    s(
      {
        trig="lim",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \lim_{<> \to <>} <>
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
        trig="ll",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \lim_{<> \to <>} <>
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
        trig="sum",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \sum_{<>}^{<>}<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      {
        condition=utils.in_mathzone
      }
    ),

    s(
      {
        trig="ss",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \sum_{<>}^{<>}<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      {
        condition=utils.in_mathzone
      }
    ),

    s(
      {
        trig="product",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \prod_{<>}^{<>}<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      {
        condition=utils.in_mathzone
      }
    ),
  }
