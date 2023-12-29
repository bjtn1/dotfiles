local u = require("helpers.tex.utils")

return
  {
    ------------------------------ BEGIN GENERAL SECTION ------------------------------
    -- For multiplication symbol math
    s(
      {
        trig="times",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \cdot<>
        ]],
        {
          i(0),
        }
      ),
      {condition=u.in_mathzone}
    ),
    -- For inline math
    s(
      {
        trig="$",
        snippetType="autosnippet",
      },
      fmta(
        [[
        $ <> $<>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {condition=u.in_mathzone or u.in_text}
    ),

    -- For bold in math zones
    s(
      {
        trig="*",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \mathbf{<>}<>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {condition=u.in_mathzone}
    ),

    -- FIX
    -- Taken from https://github.com/ejmastnak/dotfiles/blob/main/config/nvim/LuaSnip/tex/math.lua
    -- For subscripts
    s(
      {
        trig = "([%w%)%]%}]);",
        wordTrig=false,
        regTrig = true,
        snippetType="autosnippet"
      },
      fmta(
        [[
        <>_{<>}
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, u.get_visual),
        }
      ),
      {condition = u.in_mathzone}
    ),

    -- FIX
    -- Taken from https://github.com/ejmastnak/dotfiles/blob/main/config/nvim/LuaSnip/tex/math.lua
    -- For superscripts
    s(
      {
        trig = "([%w%)%]%}])'",
        wordTrig=false,
        regTrig = true,
        snippetType="autosnippet"
      },
      fmta(
        [[
        <>^{<>}
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, u.get_visual),
        }
      ),
      {condition = u.in_mathzone}
    ),

    -- For adding text in mathzones
    s(
      {
        trig="tt",
        dscr="Expands 'tt' into '\text{}'",
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
        condition=u.in_mathzone
      }
    ),

    -- For fractions
    s(
      {
        -- NOTE
        -- When using regex, put <> at the beginning of the expansion and add the `f( function...)` node first.
        -- You have to do this because regex "eats" whatever is right before the expansion
        trig="([^%a])ff",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet"
      },
      fmta(
        [[
          <>\frac{<>}{<>}<>
        ]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(2),
          i(0)
        }
      ),
      {
        condition=u.in_mathzone
      }
    ),
    ------------------------------ END GENERAL SECTION ------------------------------

    ------------------------------ BEGIN CALCULUS SECTION ------------------------------
    -- For derivatives
    s(
      {
        trig="dd",
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
      {condition=u.in_mathzone}
    ),

      -- For partial derivative
    s(
      {
        trig="pdd",
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
      {
        -- condition=u.in_mathzone
      }
    ),

    -- For integrals (one or many)
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
      {condition=u.in_mathzone}
    ),

    -- For limits
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
      {condition=u.in_mathzone}
    ),

    -- For sum
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
        condition=u.in_mathzone
      }
    ),

    -- For big product
    s(
      {
        trig="pp",
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
        condition=u.in_mathzone
      }
    ),
    ------------------------------ END CALCULUS SECTION ------------------------------


    ------------------------------ BEGIN LINEAR ALGEBRA SECTION ------------------------------
    -- For vector(s)
    s(
      {
        trig="vv",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \vec{<>}<>
        ]],
        {
          i(1),
          i(0)
        }
      ),
      {condition=u.in_mathzone}
    ),

    -- For matrices
    s(
      {
        trig="mm",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \begin{<>matrix}
        <>
        \end{<>matrix}<>
        ]],
        {
          i(1, "b"),
          i(2),
          rep(1, "b"),
          i(0)
        }
      ),
      {condition=u.in_mathzone}
    ),

    -- For the determinant
    s(
      {
        trig="det",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \det\left({<>}\right) <>
        ]],
        {
          i(1),
          i(0)
        }
      ),
      {condition=u.in_mathzone}
    ),
    ------------------------------ END LINEAR ALGEBRA SECTION ------------------------------

    ------------------------------ BEGIN TRIGONOMETRY SECTION ------------------------------
    -- For sin
    s(
      {
        trig = "sin",
        snippetType = "autosnippet"
      },
      fmta(
        [[
        \sin^{<>}\left(<>\right)<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      { condition = u.in_mathzone }
    ),

    -- For cos
    s(
      {
        trig = "cos",
        snippetType = "autosnippet"
      },
      fmta(
        [[
        \cos^{<>}\left(<>\right)<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      { condition = u.in_mathzone }
    ),

    -- For tan
    s(
      {
        trig = "tan",
        snippetType = "autosnippet"
      },
      fmta(
        [[
        \tan^{<>}\left(<>\right)<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      { condition = u.in_mathzone }
    ),

    -- For cotangent
    s(
      {
        trig = "cot",
        snippetType = "autosnippet"
      },
      fmta(
        [[
        \cot^{<>}\left(<>\right)<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      { condition = u.in_mathzone }
    ),

    -- For secant
    s(
      {
        trig = "sec",
        snippetType = "autosnippet"
      },
      fmta(
        [[
        \sec^{<>}\left(<>\right)<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      { condition = u.in_mathzone }
    ),

    -- For cosecant
    s(
      {
        trig = "csc",
        snippetType = "autosnippet"
      },
      fmta(
        [[
        \csc^{<>}\left(<>\right)<>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      { condition = u.in_mathzone }
    ),
    ------------------------------ END TRIGONOMETRY SECTION ------------------------------

    ------------------------------ BEGIN LOGIC SECTION ------------------------------
    -- For therefore
    s(
      {
        trig="tf",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \therefore<>
        ]],
        {
          i(0),
        }
      ),
      {condition = u.in_mathzone}
    ),

    -- For logical and
    s(
      {
        trig="land",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \land<>
        ]],
        {
          i(0),
        }
      ),
      {condition = u.in_mathzone}
    ),

    -- For logical or
    s(
      {
        trig="lor",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \lor<>
        ]],
        {
          i(0),
        }
      ),
      {
        condition=u.in_mathzone
      }
    ),

    -- For logical negation
    s(
      {
        trig="not",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \neg<>
        ]],
        {
          i(0),
        }
      ),
      {condition = u.in_mathzone}
    ),

    -- For logical implies
    s(
      {
        trig="imp",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \implies<>
        ]],
        {
          i(0),
        }
      ),
      {condition = u.in_mathzone}
    ),

    -- For existential quantifier
    s(
      {
        trig="exists",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \exists<>
        ]],
        {
          i(0),
        }
      ),
      {condition = u.in_mathzone}
    ),

    -- For universal quantifier
    s(
      {
        trig="forall",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \forall<>
        ]],
        {
          i(0),
        }
      ),
      {condition = u.in_mathzone}
    ),

    -- For biconditional logical connective
    s(
      {
        trig="iff",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \iff<>
        ]],
        {
          i(0),
        }
      ),
      {condition = u.in_mathzone}
    ),

    -- For logical equivalence
    s(
      {
        trig="equiv",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \equiv<>
        ]],
        {
          i(0),
        }
      ),
      {condition = u.in_mathzone}
    ),
    ------------------------------ END LOGIC SECTION ------------------------------

    ------------------------------ BEGIN SYMBOLS SECTION ------------------------------
    -- For rightarrow
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
      {condition=u.in_mathzone}
    ),

    -- For composition of functions
    s(
      {
        trig="comp",
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
      {condition=u.in_mathzone}
    ),

    -- For plus or minus
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
        condition = u.in_mathzone
      }
    ),

    -- For xor
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
      {condition=u.in_mathzone}
    ),

    -- For not equal to
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
      {condition=u.in_mathzone}
    ),

    -- For less than or equal to
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
      {condition=u.in_mathzone}
    ),

    -- For greater than or equal to 
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
      {condition=u.in_mathzone}
    ),

    -- For approximately
    s(
      {
        trig="xx",
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
      {condition=u.in_mathzone}
    ),

    -- For infinity
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
      {condition=u.in_mathzone}
    ),

    -- For ellipsis
    s(
      {
        trig="ell",
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
      {condition=u.in_mathzone}
    ),

    -- For diagonal ellipsis
    s(
      {
        trig="dll",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \ddots<>
        ]],
        {
          i(0),
        }
      ),
      {condition=u.in_mathzone}
    ),
    
    -- For square root
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
      {condition=u.in_mathzone}
    ),

    -- For nth root
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
      {condition=u.in_mathzone}
    ),

    -- For natural log
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
      {condition=u.in_mathzone}
    ),

    -- For log
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
      {condition=u.in_mathzone}
    ),

    -- For e to the power of something
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
        condition=u.in_mathzone
      }
    ),

    -- For modulus operator
    s(
      {
        trig="mod",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \bmod <>
        ]],
        {
          i(0),
        }
      ),
      {condition=u.in_mathzone}
    ),
    ------------------------------ END SYMBOLS SECTION ------------------------------
  }
