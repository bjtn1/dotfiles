local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="tik",
        dscr="Tikzpicture environment",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{align*}
        \begin{tikzpicture}
          <>
        \end{tikzpicture}
        \end{align*}
        ]],
        {
          i(1)
        }
      ),
      {
        condition=utils.line_begin
      }
    ),

    s(
      {
        trig="taa",
        dscr="Add axis in tikz",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \begin{axis}[
          xmin=-<>,
          xmax=<>,
          ymin=-<>,
          ymax=<>,
          axis lines=middle,
          xlabel=$ <> $,
          ylabel=$ <> $,
          title={<>},
          xmajorgrids=true,
          ymajorgrids=true,
          grid style=dashed,
          domain=<>:<>,
          ]
          <>
        \end{axis}<>
        ]],
        {
          i(1, "bounds"),
          rep(1),
          rep(1),
          rep(1),
          i(2, "x"),
          i(3, "y"),
          i(4, "graph title"),
          rep(1),
          rep(1),
          i(5),
          i(0),
        }
      ),
      {
        condition=utils.in_tikz
      }
    ),

    s(
      {
        trig="asp",
        dscr="Add scatter plot",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \addplot+
        [
          only marks,
          scatter,
          mark size=2.9pt
        ]
        table[meta=ma]
        {<>}
        ;<>
        ]],
        {
          i(1, "input_file.txt"),
          i(0)
        }
      ),
      {
        condition=utils.in_tikz
      }
    ),

    s(
      {
        trig="ap",
        dscr="Add plot in tikz",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \addplot [<>] {<>};<>
        ]],
        {
          i(1),
          i(2, "x^2"),
          i(0)
        }
      ),
      {
        condition=utils.in_tikz
      }
    ),

    s(
      {
        trig="tdv",
        dscr="Tikz draw vector",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \draw[ultra thick, <>, <>] (<>,<>) -- (<>,<>);<>
        ]],
        {
          i(1,"blue"),
          i(2, "->"),
          i(3),
          i(4),
          i(5),
          i(6),
          i(0)
        }
      ),
      {
        condition=utils.in_tikz
      }
    ),

  }
