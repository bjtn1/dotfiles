local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="main",
        snippetType="autosnippet"
      },
      fmta(
        [[
        \documentclass{article}

        \usepackage{amsmath} % For math
        \usepackage{amssymb} % For more math
        \usepackage{fancyhdr} % For fancy headers and footers
        \usepackage{fancyvrb} % For writing blocks of code verbatim (like LaTeX code)
        \usepackage{geometry} % For manipulating margins and meta doc stuff
        \usepackage{graphicx} % Required for inserting images
        \usepackage{hyperref} % For linking stuff
        \usepackage[utf8]{inputenc} % For encoding type (UTF-8)
        \usepackage{lastpage} % For doing "Page n of |n|"
        \usepackage{minted} % For color coding code sections
        \usepackage{pgfplots} % For adding plots and graphs
        \usepackage[indent=00pt]{parskip} % Get rid of beginning indents on paragraphs and set spacing between paragraphs
        \usepackage{siunitx} % For adding siunits inside math zones
        \usepackage[most]{tcolorbox} % For inserting color boxes
        \usepackage{tikz}
        \usepackage{tocloft} % For cooler toc
        \usepackage{xcolor} % For coloring text
        \usepackage{witharrows} % For cool arrows for pointing at stuff

        %%%%%%%%% Begin tocloft setup %%%%%%%%%%%%%%
        \renewcommand\cftsecfont{\normalfont}
        \renewcommand\cftsecpagefont{\normalfont}
        \renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
        \renewcommand\cftsecdotsep{\cftdot}
        \renewcommand\cftsubsecdotsep{\cftdot}
        %%%%%%%%% End tocloft %%%%%%%%%%%%%%

        %%%%%%%%%% Begin hyperref setup %%%%%%%%%%%%%%%%%%%
        \hypersetup{
            colorlinks=true,
            linkcolor=blue,
            urlcolor=blue,
        }
        %%%%%%%%%% End hyperref setup %%%%%%%%%%%%%%%%%%%

        %%%%%%% Begin pgfplotsset setup %%%%%%%
        \pgfplotsset{compat=1.18} % Compiler be bugging
        %%%%%%% End pgfplotsset setup %%%%%%%

        %%%%%%% Begin fancyhdr setup %%%%%%%
        \pagestyle{fancy}
        \lhead{<>} % Top left header
        \chead{} % Top center header
        \rhead{} % Top right header

        \lfoot{Brandon J. T. Noguera} % Bottom left footer
        \cfoot{} % Bottom center footer
        \rfoot{Page \thepage\ of \pageref*{LastPage}} % Bottom right footer
        % doing \pageref*{some_url} turns off the hyperlink capability for some_url
        %%%%%%% End fancyhdr setup %%%%%%%


        \title{<>}
        \author{Brandon Jose Tenorio Noguera}
        \date{<>}
        \begin{document}

        \maketitle
        \tableofcontents

        <>
        \end{document}
        ]],
        {
          rep(1),
          i(1, "Title"),
          i(2, "Date"),
          i(0),
        }
      ),
      {
        condition=utils.line_begin
      }
    ),

    s(
      {
        trig="ss",
        snippetType="autosnippet",
      },
      fmta(
        [[
        % begin section <>
        \section{<>}
        <>
        % end section <>
        
        <>
        ]],
        {
          rep(1),
          i(1, "Section name"),
          i(2),
          rep(1),
          i(3),
        }
      ),
      {
        condition=utils.line_begin
      }
    ),

    s(
      {
        trig="ssec",
        snippetType="autosnippet",
      },
      fmta(
        [[
        % begin subsection <>
        \subsection{<>}
        <>
        % end subsection <>

        <>
        ]],
        {
          rep(1),
          i(1, "Subsection name"),
          i(2),
          rep(1),
          i(3),
        }
      ),
      {
        condition=utils.line_begin
      }
    ),

    s(
      {
        trig="sssec",
        snippetType="autosnippet",
      },
      fmta(
        [[
        % begin subsubsection <>
        \subsubsection{<>}
        <>
        % end subsection <>

        <>
        ]],
        {
          rep(1),
          i(1, "Subsection name"),
          i(2),
          rep(1),
          i(3),
        }
      ),
      {
        condition=utils.line_begin
      }
    ),
  }
