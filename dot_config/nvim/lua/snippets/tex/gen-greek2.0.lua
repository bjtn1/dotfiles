-- My rendition of ejmastnak's greek.lua snippets for tex
-- Source:
-- https://raw.githubusercontent.com/ejmastnak/dotfiles/main/config/nvim/LuaSnip/tex/greek.lua
-- Return snippet tables
local utils = require("helpers.tex.utils")

return {
  s(
    {
      trig = "alpha",
      dscr = "Lowercase alpha",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \alpha<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "beta",
      dscr = "Lowercase beta",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \beta<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "gamma",
      dscr = "Lowercase gamma",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \gamma<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "Gamma",
      dscr = "Uppercase Gamma",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \Gamma<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "delta",
      dscr = "Lowercase delta",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \delta<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "Delta",
      dscr = "Uppercase Delta",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \Delta<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "epsilon",
      dscr = "Lowercase epsilon",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \epsilon<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "varepsilon",
      dscr = "Lowercase varepsilon",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \varepsilon<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "zeta",
      dscr = "Lowercase zeta",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \zeta<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "eta",
      dscr = "Lowercase eta",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \eta<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "theta",
      dscr = "Lowercase theta",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \theta<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "vartheta",
      dscr = "Lowercase vartheta",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \vartheta<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "Theta",
      dscr = "Uppercase Theta",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \Theta<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "kappa",
      dscr = "Lowercase kappa",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \kappa<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "lambda",
      dscr = "Lowercase lambda",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \lambda<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "Lambda",
      dscr = "Uppercase Lambda",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \Lambda<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "mu",
      dscr = "Lowercase mu",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \mu<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "nu",
      dscr = "Lowercase nu",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \nu<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "xi",
      dscr = "Lowercase xi",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \xi<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "Xi",
      dscr = "Uppercase Xi",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \Xi<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "pi",
      dscr = "Lowercase pi",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \pi<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "Pi",
      dscr = "Uppercase Pi",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \Pi<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "rho",
      dscr = "Lowercase rho",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \rho<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "sigma",
      dscr = "Lowercase sigma",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \sigma<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "Sigma",
      dscr = "Uppercase Sigma",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \Sigma<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "tau",
      dscr = "Lowercase tau",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \tau<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "phi",
      dscr = "Lowercase phi",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \phi<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "varphi",
      dscr = "Lowercase varphi",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \varphi<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "Phi",
      dscr = "Uppercase Phi",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \Phi<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "chi",
      dscr = "Lowercase chi",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \chi<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "psi",
      dscr = "Lowercase psi",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \psi<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "Psi",
      dscr = "Uppercase Psi",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \Psi<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "omega",
      dscr = "Lowercase omega",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \omega<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),

  s(
    {
      trig = "Omega",
      dscr = "Uppercase Omega",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \Omega<>
      ]],
      {
        i(0)
      }
    ),
    {
      condition = utils.in_mathzone
    }
  ),
}