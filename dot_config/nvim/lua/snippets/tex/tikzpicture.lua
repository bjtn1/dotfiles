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
        \begin{tikzpicture}
          <>
        \end{tikzpicture}
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
          clip=false,
          xmin=<>, xmax=<>,
          ymin=<>, ymax=<>,
          axis lines=middle,
          xlabel=$ <> $,
          ylabel=$ <> $,
          title={<>},
          xmajorgrids=true,
          ymajorgrids=true,
          grid style=dashed,
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
        \addplot
        [<>]
        {<>}
        node[right, pos=1]{$<><>$};<>
        ]],
        {
          i(1),
          i(2, "x^2"),
          i(3, "f(x)"),
          rep(2),
          i(0)
        }
      ),
      {
        condition=utils.in_tikz
      }
    ),

    s(
      {
        trig="dd",
        dscr="Draw in tikzpicture env",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \draw[<>]
        ]],
        {
          i(1, "params")
        }
      ),
      {
        condition=utils.in_tikz
      }
    ),

  }
