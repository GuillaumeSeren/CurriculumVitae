% --------------------------------------------------
% @author Guillaume Seren
% source  https://github.com/GuillaumeSeren/CurriculumVitae
% file    GuillaumeSeren-cv.cls
% Licence GPLv3
%
% Class file for latex cv
% --------------------------------------------------
\ProvidesClass{GuillaumeSeren-cv}[2015/06/10 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Colors
\RequirePackage{xcolor}

\definecolor{white}{HTML}{FFFFFF}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{66CC00} %{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{FF00FF}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
    \colorlet{green}{gray}
    \colorlet{orange}{gray}
    \colorlet{purple}{gray}
    \colorlet{brown}{gray}
    \colorlet{red}{gray}
    \colorlet{blue}{gray}
    \colorlet{fillheader}{gray}
    \colorlet{header}{white}
\else
    \colorlet{fillheader}{gray}
    \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

% Fonts
%%% modified by Karol Kozioł for ShareLaTex use
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont
[BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf,
Path = fonts/]{texgyreheros-regular.otf}
\newfontfamily\thinfont[Path = fonts/]{Lato-Light.ttf}
% or for thiner version
%\newfontfamily\thinfont[]{Lato-Hairline.ttf}
\newfontfamily\headingfont[Path = fonts/]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf,
Path = fonts/]{texgyreheros-regular.otf}

\setmathfont[Path = fonts/]{texgyreheros-regular.otf}

% Header
\RequirePackage{tikz}

\newcommand{\rolefont}{\fontsize{14pt}{24pt} %
            \selectfont\thinfont\color{white}}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}

% Structure
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

% List environment
\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}
  {\begin{tabular*}{\textwidth}{@{}p{2cm}l}
  }
  {\end{tabular*}}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.85cm}{%
     \textbf{#2}\hfill{%
     \footnotesize\addfontfeature{Color=lightgray}#3}\\
     \footnotesize#4\vspace{\parsep}%
  }\vspace{5pt}\\}
  
\newcommand{\entryMod}[5]{%
  #1&\parbox[t]{11.85cm}{%
     \large\textbf{#2}\hfill{%
     \footnotesize\addfontfeature{Color=lightgray}#3}\vspace{1pt}\\
     \small\emph{#4}\vspace{5pt}\\
     \footnotesize\addfontfeature{Color=gray}#5\vspace{\parsep}%
  }\vspace{5pt}\\}
  
\newcommand{\entryBul}[5]
  {#1&\parbox[t]{11.85cm}{
        \large\textbf{#2}\hfill{%
        \footnotesize\addfontfeature{Color=lightgray}#3}\vspace{1pt}\\
        \small\emph{#4}\vspace{1pt}
        \footnotesize\addfontfeature{Color=gray}#5\vspace{\parsep}%
        }\vspace{5pt}\\}
  
\newcommand{\entryAlt}[3]{%
  #1&\parbox[t]{11.85cm}{%
    \large\textbf{#2}\hfill%
    {\footnotesize\addfontfeature{Color=lightgray}#3}
  }\vspace{5pt}\\} 
  
\newcommand{\entryFULL}[5]
  {#1&\parbox[t]{16.5cm}{
        \large\textbf{#2}\hfill{%
        \footnotesize\addfontfeature{Color=lightgray}#3}\vspace{1pt}\\
        \small\emph{#4}\vspace{1pt}
        \footnotesize\addfontfeature{Color=gray}#5\vspace{\parsep}%
        }\vspace{5pt}\\}

% Side block
\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newenvironment{aside}{%
    \let\oldsection\section
    \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
    \begin{textblock}{4.5}(15.85, 4.33)
        \begin{flushleft}
        \obeycr
}{%
        \restorecr
        \end{flushleft}
    \end{textblock}
  \let\section\oldsection
}

\newenvironment{aside2}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{4.5}(15.85, 1.4)
  \begin{flushleft}
  \obeycr
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
  \let\section\oldsection
}

% Other tweaks
\RequirePackage[left=1.25cm,top=2cm,right=6.5cm,bottom=1.25cm,nohead,nofoot]{geometry}
\definecolor{lblue}{HTML}{0000EE}
\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=lblue,
    citecolor=lblue,
    filecolor=lblue,
    urlcolor = lblue}

% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
