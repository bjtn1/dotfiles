local u = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="bnt",
        desc="Begin notebook template",
        snippetType="autosnippet"
      },
      fmta(
        [[
        %------------------------------------------------------------------------Begin preamble------------------------------------------------------------------------
        \documentclass[12pt]{article}
        % Uncomment these two lines if you want to use Times New Roman (needs XeLaTeX)
        % \usepackage{fontspec}
        % \setmainfont{Times New Roman}

        \usepackage{amsmath} % For math
        \usepackage{amssymb} % For more math
        \usepackage{fancyhdr} % For fancy headers and footers
        \usepackage{fancyvrb} % For writing blocks of code verbatim (like LaTeX code)
        \usepackage{geometry} % For manipulating margins and meta doc stuff
        \usepackage{graphicx} % Required for inserting images
        \usepackage{hyperref} % For linking stuff
        \usepackage{cleveref} % Better cross refencing % Must be loaded after hyperref
        \usepackage{lastpage} % For doing "Page n of |n|"
        \usepackage{minted} % For color coding code sections
        \usepackage{pgfplots} % For adding plots and graphs
        \usepackage[indent=00pt]{parskip} % Get rid of beginning indents on paragraphs and set spacing between paragraphs
        \usepackage{siunitx} % For adding siunits inside math zones
        \usepackage[most]{tcolorbox} % For inserting color boxes
        \usepackage{tikz}
        \usepackage{titling} % For vertically centering title, author, and date
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
        \renewcommand{\footrulewidth}{0.4pt} % default is 0pt
        \lhead{<>} % Top left header
        \chead{} % Top center header
        \rhead{} % Top right header

        \lfoot{Brandon J. T. Noguera} % Bottom left footer
        \cfoot{} % Bottom center footer
        \rfoot{Page \thepage\ of \pageref*{LastPage}} % Bottom right footer
        % doing \pageref*{some_url} turns off the hyperlink capability for some_url
        %%%%%%% End fancyhdr setup %%%%%%%

        %%%%%%% Begin titlingpage setup %%%%%%%
        \renewcommand\maketitlehooka{\null\mbox{}\vfill}
        \renewcommand\maketitlehookd{\vfill\null}
        %%%%%% End titlingpage setup %%%%%%%
        %------------------------------------------------------------------------End preamble------------------------------------------------------------------------

        \title{\textbf{<>}}
        \author{Brandon Jose Tenorio Noguera}
        \date{<>}
        \begin{document}

        \begin{titlingpage}
        \maketitle
        \end{titlingpage}

        \tableofcontents
        \newpage

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
        condition=u.line_begin
      }
    ),

    s(
      {
        trig="bht",
        desc="Begin homework template",
        snippetType="autosnippet"
      },
      fmta(
        [[
        %------------------------------------------------------------------------Begin preamble------------------------------------------------------------------------
        \documentclass[12pt]{article}
        % Uncomment these two lines if you want to use Times New Roman (needs XeLaTeX)
        % \usepackage{fontspec}
        % \setmainfont{Times New Roman}

        \usepackage{amsmath} % For math
        \usepackage{amssymb} % For more math
        \usepackage{fancyhdr} % For fancy headers and footers
        \usepackage{fancyvrb} % For writing blocks of code verbatim (like LaTeX code)
        \usepackage{geometry} % For manipulating margins and meta doc stuff
        \usepackage{graphicx} % Required for inserting images
        \usepackage{hyperref} % For linking stuff
        \usepackage{cleveref} % Better cross refencing % Must be loaded after hyperref
        \usepackage{lastpage} % For doing "Page n of |n|"
        \usepackage{minted} % For color coding code sections
        \usepackage{pgfplots} % For adding plots and graphs
        \usepackage[indent=00pt]{parskip} % Get rid of beginning indents on paragraphs and set spacing between paragraphs
        \usepackage{siunitx} % For adding siunits inside math zones
        \usepackage[most]{tcolorbox} % For inserting color boxes
        \usepackage{tikz}
        \usepackage{titling} % For vertically centering title, author, and date
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
        \renewcommand{\footrulewidth}{0.4pt} % default is 0pt
        \lhead{<>} % Top left header
        \chead{} % Top center header
        \rhead{} % Top right header

        \lfoot{Brandon J. T. Noguera} % Bottom left footer
        \cfoot{} % Bottom center footer
        \rfoot{Page \thepage\ of \pageref*{LastPage}} % Bottom right footer
        % doing \pageref*{some_url} turns off the hyperlink capability for some_url
        %%%%%%% End fancyhdr setup %%%%%%%

        %%%%%%% Begin titlingpage setup %%%%%%%
        \renewcommand\maketitlehooka{\null\mbox{}\vfill}
        \renewcommand\maketitlehookd{\vfill\null}
        %%%%%% End titlingpage setup %%%%%%%
        %------------------------------------------------------------------------End preamble------------------------------------------------------------------------

        \title{\textbf{<>}}
        \author{Brandon Jose Tenorio Noguera}
        \date{<>}
        \begin{document}

        \begin{titlingpage}
        \maketitle
        \end{titlingpage}

        \newpage
        \tableofcontents
        \newpage

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
        condition=u.line_begin
      }
    ),

    s(
      {
        trig="bs",
        desc="Begin <sub>section",
        regTrig=true,
        wordTrig=false,
        snippetType="autosnippet",
      },
      fmta(
        [[
        \<>section{<>}\label{<>}
        <>
        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
        }
      ),
      {
        condition=u.line_begin
      }
    ),

    s(
      {
        trig="brt",
        desc="Begin resume template",
        snippetType="autosnippet",
      },
      fmta(
        [[
        %-------------------------
        % Resume in Latex
        % Author : Jake Gutierrez
        % Based off of: https://github.com/sb2nov/resume
        % License : MIT
        %------------------------

        \documentclass[letterpaper,12pt]{article}

        \usepackage{latexsym}
        \usepackage[empty]{fullpage}
        \usepackage{titlesec}
        \usepackage{marvosym}
        \usepackage[usenames,dvipsnames]{color}
        \usepackage{verbatim}
        \usepackage{enumitem}
        \usepackage[hidelinks]{hyperref}
        \usepackage{fancyhdr}
        \usepackage[english]{babel}
        \usepackage{tabularx}
        \input{glyphtounicode}


        %----------FONT OPTIONS----------
        % sans-serif
        % \usepackage[sfdefault]{FiraSans}
        % \usepackage[sfdefault]{roboto}
        % \usepackage[sfdefault]{noto-sans}
        % \usepackage[default]{sourcesanspro}

        % serif
        % \usepackage{CormorantGaramond}
        % \usepackage{charter}
        % \usepackage{times}

        % times new roman
        % Uncomment these two lines if you want to use Times New Roman (needs XeLaTeX)
        % \usepackage{fontspec}
        % \setmainfont{Times New Roman}


        \pagestyle{fancy}
        \fancyhf{} % clear all header and footer fields
        \fancyfoot{}
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0pt}

        % Adjust margins
        \addtolength{\oddsidemargin}{-0.5in}
        \addtolength{\evensidemargin}{-0.5in}
        \addtolength{\textwidth}{1in}
        \addtolength{\topmargin}{-.5in}
        \addtolength{\textheight}{1.0in}

        \urlstyle{same}

        \raggedbottom
        \raggedright
        \setlength{\tabcolsep}{0in}

        % Sections formatting
        \titleformat{\section}{
          \vspace{-4pt}\scshape\raggedright\large
        }{}{0em}{}[\color{black}\titlerule \vspace{-5pt}]

        % Ensure that generate pdf is machine readable/ATS parsable
        \pdfgentounicode=1

        %-------------------------
        % Custom commands
        \newcommand{\resumeItem}[1]{
          \item\small{
            {#1 \vspace{-2pt}}
          }
        }

        \newcommand{\resumeSubheading}[4]{
          \vspace{-2pt}\item
            \begin{tabular*}{0.97\textwidth}[t]{l@{\extracolsep{\fill}}r}
              \textbf{#1} & #2 \\
              \textit{\small#3} & \textit{\small #4} \\
            \end{tabular*}\vspace{-7pt}
        }

        \newcommand{\resumeSubSubheading}[2]{
            \item
            \begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
              \textit{\small#1} & \textit{\small #2} \\
            \end{tabular*}\vspace{-7pt}
        }

        \newcommand{\resumeProjectHeading}[2]{
            \item
            \begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
              \small#1 & #2 \\
            \end{tabular*}\vspace{-7pt}
        }

        \newcommand{\resumeSubItem}[1]{\resumeItem{#1}\vspace{-4pt}}

        \renewcommand\labelitemii{$\vcenter{\hbox{\tiny$\bullet$}}$}

        \newcommand{\resumeSubHeadingListStart}{\begin{itemize}[leftmargin=0.15in, label={}]}
        \newcommand{\resumeSubHeadingListEnd}{\end{itemize}}
        \newcommand{\resumeItemListStart}{\begin{itemize}}
        \newcommand{\resumeItemListEnd}{\end{itemize}\vspace{-5pt}}

        %-------------------------------------------
        %%%%%%  RESUME STARTS HERE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%


        \begin{document}

        %----------HEADING----------
        % \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
        %   \textbf{\href{http://sourabhbajaj.com/}{\Large Sourabh Bajaj}} & Email : \href{mailto:sourabh@sourabhbajaj.com}{sourabh@sourabhbajaj.com}\\
        %   \href{http://sourabhbajaj.com/}{http://www.sourabhbajaj.com} & Mobile : +1-123-456-7890 \\
        % \end{tabular*}

        \begin{center}
            \textbf{\Huge \scshape Jake Ryan} \\ \vspace{1pt}
            \small 123-456-7890 $|$ \href{mailto:x@x.com}{\underline{jake@su.edu}} $|$ 
            \href{https://linkedin.com/in/...}{\underline{linkedin.com/in/jake}} $|$
            \href{https://github.com/...}{\underline{github.com/jake}}
        \end{center}


        %-----------EDUCATION-----------
        \section{Education}
          \resumeSubHeadingListStart
            \resumeSubheading
              {Southwestern University}{Georgetown, TX}
              {Bachelor of Arts in Computer Science, Minor in Business}{Aug. 2018 -- May 2021}
            \resumeSubheading
              {Blinn College}{Bryan, TX}
              {Associate's in Liberal Arts}{Aug. 2014 -- May 2018}
          \resumeSubHeadingListEnd


        %-----------EXPERIENCE-----------
        \section{Experience}
          \resumeSubHeadingListStart

            \resumeSubheading
              {Undergraduate Research Assistant}{June 2020 -- Present}
              {Texas A\&M University}{College Station, TX}
              \resumeItemListStart
                \resumeItem{Developed a REST API using FastAPI and PostgreSQL to store data from learning management systems}
                \resumeItem{Developed a full-stack web application using Flask, React, PostgreSQL and Docker to analyze GitHub data}
                \resumeItem{Explored ways to visualize GitHub collaboration in a classroom setting}
              \resumeItemListEnd
              
        % -----------Multiple Positions Heading-----------
        %    \resumeSubSubheading
        %     {Software Engineer I}{Oct 2014 - Sep 2016}
        %     \resumeItemListStart
        %        \resumeItem{Apache Beam}
        %          {Apache Beam is a unified model for defining both batch and streaming data-parallel processing pipelines}
        %     \resumeItemListEnd
        %    \resumeSubHeadingListEnd
        %-------------------------------------------

            \resumeSubheading
              {Information Technology Support Specialist}{Sep. 2018 -- Present}
              {Southwestern University}{Georgetown, TX}
              \resumeItemListStart
                \resumeItem{Communicate with managers to set up campus computers used on campus}
                \resumeItem{Assess and troubleshoot computer problems brought by students, faculty and staff}
                \resumeItem{Maintain upkeep of computers, classroom equipment, and 200 printers across campus}
            \resumeItemListEnd

            \resumeSubheading
              {Artificial Intelligence Research Assistant}{May 2019 -- July 2019}
              {Southwestern University}{Georgetown, TX}
              \resumeItemListStart
                \resumeItem{Explored methods to generate video game dungeons based off of \emph{The Legend of Zelda}}
                \resumeItem{Developed a game in Java to test the generated dungeons}
                \resumeItem{Contributed 50K+ lines of code to an established codebase via Git}
                \resumeItem{Conducted  a human subject study to determine which video game dungeon generation technique is enjoyable}
                \resumeItem{Wrote an 8-page paper and gave multiple presentations on-campus}
                \resumeItem{Presented virtually to the World Conference on Computational Intelligence}
              \resumeItemListEnd

          \resumeSubHeadingListEnd


        %-----------PROJECTS-----------
        \section{Projects}
            \resumeSubHeadingListStart
              \resumeProjectHeading
                  {\textbf{Gitlytics} $|$ \emph{Python, Flask, React, PostgreSQL, Docker}}{June 2020 -- Present}
                  \resumeItemListStart
                    \resumeItem{Developed a full-stack web application using with Flask serving a REST API with React as the frontend}
                    \resumeItem{Implemented GitHub OAuth to get data from user’s repositories}
                    \resumeItem{Visualized GitHub data to show collaboration}
                    \resumeItem{Used Celery and Redis for asynchronous tasks}
                  \resumeItemListEnd
              \resumeProjectHeading
                  {\textbf{Simple Paintball} $|$ \emph{Spigot API, Java, Maven, TravisCI, Git}}{May 2018 -- May 2020}
                  \resumeItemListStart
                    \resumeItem{Developed a Minecraft server plugin to entertain kids during free time for a previous job}
                    \resumeItem{Published plugin to websites gaining 2K+ downloads and an average 4.5/5-star review}
                    \resumeItem{Implemented continuous delivery using TravisCI to build the plugin upon new a release}
                    \resumeItem{Collaborated with Minecraft server administrators to suggest features and get feedback about the plugin}
                  \resumeItemListEnd
            \resumeSubHeadingListEnd



        %
        %-----------PROGRAMMING SKILLS-----------
        \section{Technical Skills}
         \begin{itemize}[leftmargin=0.15in, label={}]
            \small{\item{
             \textbf{Languages}{: Java, Python, C/C++, SQL (Postgres), JavaScript, HTML/CSS, R} \\
             \textbf{Frameworks}{: React, Node.js, Flask, JUnit, WordPress, Material-UI, FastAPI} \\
             \textbf{Developer Tools}{: Git, Docker, TravisCI, Google Cloud Platform, VS Code, Visual Studio, PyCharm, IntelliJ, Eclipse} \\
             \textbf{Libraries}{: pandas, NumPy, Matplotlib}
            }}
         \end{itemize}


        %-------------------------------------------
        \end{document}
        <>
        ]],
        {
          i(0),
        }
      ),
      {
        condition=u.line_begin
      }
    )

  }
