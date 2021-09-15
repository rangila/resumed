\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rangila_cv}[resumed class]


\RequirePackage{geometry}
%\RequirePackage{titlesec}
\RequirePackage[nobottomtitles*,explicit]{titlesec}
\RequirePackage[usenames, dvipsnames]{color}
\RequirePackage{tikz}

%\reversemarginpar

\newcommand{\leftruler}{0.3\textwidth}

\geometry{
  a4paper,
  %total={210mm,257mm},
  total={180mm,257mm},
  left=20mm,
  top=20mm,
}

% \titleformat{\section}
% {\Large\scshape\raggedright} 
% {}{0em}
% {}
% [\titlerule]                    

\titleformat{\section}[block]
{\Large\bfseries}
{}
{0pt}
{
  \hspace{-5em}% Move into margin
  \tikz[overlay]
  \shade[left color=blue!40, right color=white] (0,-1ex) rectangle (\dimexpr\textwidth/2 + 5em \relax,1em);
  \makebox[3em][l]{}#1
}% Set number + title


\titleformat{\subsection}[block]
{}
{}
{-5em}
{
  \hspace{0em}% Move into margin
  $\tikz[overlay] \shade[left color=white, right color=black!20] (\dimexpr\textwidth/2 + 5em \relax,-1ex) rectangle (\dimexpr\textwidth+8em \relax,1em);% Set background shaded rectangle
  \makebox[1em][l]{}#1
}

% \color{blue}                
% \colorbox{SeaGreen}{
\newcommand{\doublepar}[2]{
  \fbox{
    #1
    #2
  }
}

\newcommand{\name}[2]{
  \centerline{
    % \hfill{}\Huge{#1}
    \color[gray]{0.6} \hfill\fontsize{38}{40}\bfseries\upshape #1
    \color[gray]{0.4} #2
    }
%  \hrulefill{}

}
\newcommand{\contact}[2]{
  \centerline{
    \hfill \texttt{#1} {\large\textperiodcentered} \texttt{#2}
  }
}
\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[3]{%
  \subsection[#1]{\textbf{#3} \hfill \textbf{#1} \\\\ \texttt{#2} }%
}
\newcommand{\datedshortsection}[2]{%
  \subsection[#1]{\textbf{#1} \hfill \textbf{#2} }%
}
