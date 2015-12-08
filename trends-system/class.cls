%\obeycr makes embedded carriage returns act like line terminators

\ProvidesClass{class}[2015/08/22 Document class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%%%%%%%%%%%
% Margins %
%%%%%%%%%%%

\RequirePackage[left=2.1cm,top=2.0cm,right=2.1cm,bottom=2.0cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{494949}
\definecolor{blue_under}{HTML}{7088A0}
%\definecolor{blue_under}{HTML}{15B372}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{var_color}{HTML}{66D9EF}
\definecolor{equal_color}{HTML}{F92672}
\definecolor{my_green}{HTML}{70A078}



\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{black}
\colorlet{headercolor}{black}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[]{Helvetica Neue}
\newfontfamily\italicfont[]{Helvetica Neue Italic}
\newfontfamily\thinfont[]{Helvetica Neue UltraLight}
\newfontfamily\thickfont[]{Helvetica Neue Bold}
\newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
\newfontfamily\codefont[]{Helvetica Neue}

% Better compatibilty for LuaTex
\defaultfontfeatures{Mapping=tex-text}
% Determine the main font of the document
% \setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica}


%\setmainfont[
%  Ligatures=TeX,
%  BoldFont={Helvetica Neue Bold},
%  ItalicFont={Helvetica Neue Italic},
%]{times}


%\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

%\newcommand{
%
%}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3.5cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{%\color{blue_under}
      \thickfont #2}
    };
    \node [anchor=north] (subtitle) at (name.south) {%
      \fontsize{18pt}{30pt}\color{header}%
      \thinfont #3%
    };
    \node [anchor=center] at (subtitle.east) {
      \fontsize{20pt}{24pt}%\color{blue_under}%
      %\thickfont ]%
    };
    \node [anchor=center] at (subtitle.west) {
      \fontsize{20pt}{24pt}%\color{blue_under}%
      %\thickfont [%
    };
  \end{tikzpicture}
  \vspace{2.0cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
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
        purple\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\newcommand{\sectionCode}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\codefont\color{var_color} var%
    \hspace{.5\parskip}{\fontsize{16pt}{1em}\headingfont\color{headercolor} #1}%}%
    \hspace{.5\parskip}\LARGE\codefont\color{equal_color} =%
  }
  \par\vspace{\parskip}
}


\newcommand{\sectionAold}[1]{
  \par\vspace{0.1\parskip}
  {%
  \headingfont\color{blue_under}\huge{[}%
  \LARGE{#1}%
    \huge{]}%
  }
  \par\vspace{\parskip}
}

\newcommand{\sectionA}[1]{
  \par\vspace{0.1\parskip}
  {%
  \headingfont\color{blue_under}%
  \LARGE{#1}%
  }
  \par\vspace{\parskip}
}




\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{12.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{2.5\parsep}%
  }\\}



\newcommand{\entryA}[2]{%
  \parbox[t]{13.98cm}{%
    \textbf{#1}\\%
    #2\vspace{2.5\parsep}%
  }\\}

\newcommand{\entryB}[3]{%
  \parbox[t]{13.98cm}{%
    \textbf{#1}\hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #2}\\%
    #3\vspace{2.5\parsep}%
  }\\}


\newcommand{\footer}[1]{%
  \vfill\hfill\scriptsize\textit{#1}
}



%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{2.6}(1.5, 4.33)
  %\begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

\newenvironment{verticalRule}{
  \begin{textblock}{2.6}(2.1, 4.0) % {width}(left, top)
  \begin{flushright}
  \textcolor{lightgray}{\rule{0.5pt}{630pt}} %{width}{height}
}{
  \end{flushright}
  \end{textblock}
}

\newenvironment{verticalRule2}{
  \begin{textblock}{2.6}(2.1, 1.8) % {width}(left, top)
  \begin{flushright}
  \textcolor{lightgray}{\rule{0.5pt}{320pt}} %{width}{height}
}{
  \end{flushright}
  \end{textblock}
}




\newenvironment{horizontalRule}{
  \vspace{-3\parskip}\hspace{-2.9\parskip}\textcolor{lightgray}{\rule{440pt}{0.5pt}}
  \vspace{1.5\parskip}
}



%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \ifblank{#3}{}{#3\space}#1%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}




