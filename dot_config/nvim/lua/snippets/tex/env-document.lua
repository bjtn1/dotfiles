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
        \usepackage[utf8]{inputenc}
        \usepackage{amsmath} % For math
        \usepackage{geometry} % For manipulating margins and meta doc stuff
        \usepackage{graphicx} % Required for inserting images
        \usepackage[indent=00pt]{parskip} % Get rid of beginning indents on paragraphs and set spacing between paragraphs
        \usepackage{minted} % For color coding code sections
        \usepackage{witharrows} % For cool arrows for pointing at stuff
        \usepackage{pgfplots} % For adding plots and graphs

        \title{<>}
        \author{Brandon Jose Tenorio Noguera}
        \date{<>}

        \begin{document}

        \maketitle

        % begin section <>
        \section{<>}
        
        <>
        % end section <>
        
        <>
        \end{document}
        ]],
        {
          i(1, "Title"),
          i(2, "Date"),
          rep(3),
          i(3, "Section name"),
          i(4),
          rep(3),
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
