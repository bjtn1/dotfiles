-- Source:
-- https://raw.githubusercontent.com/ejmastnak/dotfiles/main/config/nvim/LuaSnip/tex/greek.lua
-- Return snippet tables
local text_utils = require("helpers.tex.utils")

return {
  s(
    {
      trig = ";a",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";b",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";g",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";G",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";d",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";D",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";e",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";ve",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";z",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";h",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";o",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";vo",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";O",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";k",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";l",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";L",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";m",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";n",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";x",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";X",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";i",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";I",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";r",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";s",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";S",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";t",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";f",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";vf",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";F",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";c",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";p",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";P",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";w",
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
      condition = text_utils.in_mathzone
    }
  ),

  s(
    {
      trig = ";W",
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
      condition = text_utils.in_mathzone
    }
  ),
}
