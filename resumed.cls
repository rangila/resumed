\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resumed}[2021/09/20 resumed class]


\RequirePackage{geometry}
\RequirePackage[nobottomtitles*,explicit]{titlesec}
\RequirePackage[usenames, dvipsnames]{color}
\RequirePackage{tikz}
\RequirePackage{tabularx}
\RequirePackage{sourcesanspro}

\RequirePackage{accsupp}
\RequirePackage[fixed]{fontawesome5}

\RequirePackage{xcolor}
\RequirePackage{etoolbox}

\definecolor{SlateGrey}{HTML}{2E2E2E}
\definecolor{LightGrey}{HTML}{666666}
\definecolor{DarkPastelRed}{HTML}{450808}
\definecolor{PastelRed}{HTML}{8F0D0D}
\definecolor{GoldenEarth}{HTML}{E7D192}
\colorlet{name}{black}
\colorlet{tagline}{PastelRed}
\colorlet{heading}{DarkPastelRed}
\colorlet{headingrule}{GoldenEarth}
\colorlet{subheading}{PastelRed}
\colorlet{accent}{PastelRed}
\colorlet{emphasis}{SlateGrey}
\colorlet{body}{black!80!white}

\newcommand{\itemmarker}{{\small\textbullet}}
\newcommand{\ratingmarker}{\faCircle}

\renewcommand{\familydefault}{\sfdefault}

\RequirePackage{tikz}
\usetikzlibrary{arrows}
\RequirePackage[skins]{tcolorbox}
\RequirePackage[inline]{enumitem}
\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip,after=\vspace{0.25\baselineskip}}
\setlist[itemize]{label=\itemmarker}
\RequirePackage{graphicx}
\RequirePackage{trimclip}
\RequirePackage{dashrule}
\RequirePackage{multirow,tabularx}
\RequirePackage{changepage}

\setlength{\parindent}{0pt}
\newcommand{\divider}{\textcolor{body!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}

\geometry{
  a4paper,
  %total={210mm,257mm},
  total={160mm,257mm},
  left=20mm,
  top=20mm,
  columnsep=1.2cm
}

\titleformat{\section}[block]
{\Large\bfseries}
{}
{0pt}
{
  \hspace{-5em}% Move into margin
  \tikz[overlay]
  \shade[left color=GoldenEarth!100, right color=white] (0,-1ex) rectangle (\dimexpr\textwidth/2 + 5em \relax,1em);
  \makebox[3em][l]{}#1
}


\titleformat{\subsection}[block]
{}
{}
{-5em}
{
  \tikz[overlay] \shade[left color=white, right color=black!20] (\dimexpr\textwidth/2 + 5em \relax,-2em) rectangle (\dimexpr\textwidth+8em \relax,1em);
  #1
}

\titleformat{\subsubsection}[block]
{}
{}
{0em}
{
  #1
}

\newcommand{\name}[2]{
    \centerline{
        \color[gray]{0.6} \hfill\fontsize{25}{40}\bfseries\upshape #1
            \color[gray]{0.4} #2
    }
}

\newcommand{\contact}[2]{
    \centerline{
        \hfill \texttt{#1} {\large\textperiodcentered} \texttt{#2}
    }
}

\newcommand{\datedsection}[2]{
    \section[#1]{
        #1 \hfill #2
    }
}

\newcommand{\datedsubsection}[4]{
    \subsection[#1]{
        \textbf{#3} \hfill \textbf{#1}
        \newline
        \null\hfill #4, #2
    }
}

\newcommand{\datedshortsection}[2]{
    \subsection[#1]{
        \textbf{#1} \hfill \textbf{#2} 
    }
}

\newcommand{\CAR}[3]{
  \subsubsection[Challenge-Achivement-Results]{
    \begin{tabularx}{\textwidth}{l X}
        {\color[gray]{0.6}\bfseries Challenge} & #1 \\\\
        {\color[gray]{0.6}\bfseries Achievements} & #2 \\\\
        {\color[gray]{0.6}\bfseries Results} & #3
    \end{tabularx}
  }
}


\newcommand{\cvskill}[2]{%
  \textcolor{emphasis}{\textbf{#1}}\hfill
  \BeginAccSupp{method=plain,ActualText={#2}}
  \foreach \x in {1,...,5}{%
    \ifdimequal{\x pt - #2 pt}{0.5pt}%
    {\clipbox*{0pt -0.25ex {.5\width} {\totalheight}}{\color{accent}\ratingmarker}%
     \clipbox*{{.5\width} -0.25ex {\width} {\totalheight}}{\color{body!30}\ratingmarker}}
    {\ifdimgreater{\x bp}{#2 bp}{\color{body!30}}{\color{accent}}\ratingmarker}%
  }\EndAccSupp{}\par%
}

\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex]{#1};
}

\newcommand{\cvachievement}[3]{%
  \begin{tabularx}{\linewidth}{@{}p{2em} @{\hspace{1ex}} >{\raggedright\arraybackslash}X@{}}
  \multirow{2}{*}{\large\color{accent}#1} & \bfseries\textcolor{emphasis}{#2}\\
  & #3
  \end{tabularx}%
  \smallskip
}

\newcommand{\cvevent}[4]{%
  {\large\color{emphasis}#1\par}
  \smallskip\normalsize
  \ifstrequal{#2}{}{}{
  \textbf{\color{accent}#2}\par
  \smallskip}
  \ifstrequal{#3}{}{}{{\small\makebox[0.5\linewidth][l]{\faCalendar~#3}}}%
  \ifstrequal{#4}{}{}{{\small\makebox[0.5\linewidth][l]{\faMapMarker~#4}}}\par
  \medskip\normalsize
}

\AtBeginDocument{%
  \pagestyle{empty}
  \color{body}
  \raggedright
}
