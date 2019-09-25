%------------------------------------------------------------------------------
% Custom Poster Class for PHARM
%
% by Kyle Daruwalla (daruwalla@wisc.edu)
%
% Rev 0 as of 2017-02-15
%------------------------------------------------------------------------------

%\def\fileversion{0.0}
%\def\filedate{2017-02-13}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pharmposter}

\RequirePackage{ifthen}
\RequirePackage{xintexpr}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{a0size}
\RequirePackage{xcolor}
\RequirePackage{multicol}

% Define UW colors
\definecolor{badgerred}{cmyk}{0.03, 1, 0.66, 0.12}

% Define lengths
\newlength{\pharmposter@paperheight}
\newlength{\pharmposter@paperwidth}
\newlength{\pharmposter@headerheight}
\newcommand{\pharmposter@scale}{1.0}
\newcommand{\pharmposter@fontscale}{1.0}
\newif\if@frames
\@framesfalse
\newif\if@portrait
\newcommand{\pharmposter@setpapersize}[3]{
	\setlength{\pharmposter@paperwidth}{#1}
	\setlength{\pharmposter@paperheight}{#2}
    \setlength{\pharmposter@headerheight}{#3}
}
\newcommand{\pharmposter@scaling}[2]{
    \renewcommand{\pharmposter@scale}{#1}
    \renewcommand{\pharmposter@fontscale}{#2}
}

% Declare options
\DeclareOption{frames}{\@framestrue}
\DeclareOption{portrait}{\@portraittrue}
\DeclareOption{landscape}{\@portraitfalse}
\DeclareOption{ArchC}{\pharmposter@setpapersize{18in}{24in}{2in}
                      \pharmposter@scaling{0.7}{0.4}}
\DeclareOption{ArchD}{\pharmposter@setpapersize{24in}{36in}{3.5in}
                      \pharmposter@scaling{0.85}{0.7}}
\DeclareOption{ArchE}{\pharmposter@setpapersize{36in}{48in}{6in}}
\ExecuteOptions{landscape,ArchE}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Error in renewing lengths with tcolorbox
\RequirePackage[most]{tcolorbox}

% Set page size
\newlength{\pharmposter@topheight}
\setlength{\pharmposter@topheight}{0.3in}
\addtolength{\pharmposter@topheight}{\pharmposter@headerheight}
\if@portrait
    \usepackage[
    	paperwidth=\pharmposter@paperwidth,
    	paperheight=\pharmposter@paperheight,
    	headheight=\pharmposter@headerheight,
        top=\pharmposter@topheight,
    	bottom={\pharmposter@scale 1in},
    	lmargin={\pharmposter@scale 1in},
    	rmargin={\pharmposter@scale 1in},
    ]{geometry}
\else
    \usepackage[
    	paperwidth=\pharmposter@paperwidth,
    	paperheight=\pharmposter@paperheight,
    	headheight=\pharmposter@headerheight,
    	bottom={\pharmposter@scale 1in},
    	lmargin={\pharmposter@scale 1in},
    	rmargin={\pharmposter@scale 1in},
        landscape,
    ]{geometry}
\fi
\setlength{\columnsep}{\pharmposter@scale 1in}
\setlength{\headsep}{\pharmposter@scale 1in}

% Define font sizes
\renewcommand{\tiny}{\fontsize{\xintthefloatexpr 12 * \pharmposter@fontscale\relax}{\xintthefloatexpr 14 * \pharmposter@fontscale\relax}\selectfont}
\renewcommand{\scriptsize}{\fontsize{\xintthefloatexpr 14.4 * \pharmposter@fontscale\relax}{\xintthefloatexpr 18 * \pharmposter@fontscale\relax}\selectfont}
\renewcommand{\footnotesize}{\fontsize{\xintthefloatexpr 17.28 * \pharmposter@fontscale\relax}{\xintthefloatexpr 22 * \pharmposter@fontscale\relax}\selectfont}
\renewcommand{\small}{\fontsize{\xintthefloatexpr 20.74 * \pharmposter@fontscale\relax}{\xintthefloatexpr 25 * \pharmposter@fontscale\relax}\selectfont}
\renewcommand{\normalsize}{\fontsize{\xintthefloatexpr 24.88 * \pharmposter@fontscale\relax}{\xintthefloatexpr 30 * \pharmposter@fontscale\relax}\selectfont}
\renewcommand{\large}{\fontsize{\xintthefloatexpr 29.86 * \pharmposter@fontscale\relax}{\xintthefloatexpr 37 * \pharmposter@fontscale\relax}\selectfont}
\renewcommand{\Large}{\fontsize{\xintthefloatexpr 35.83 * \pharmposter@fontscale\relax}{\xintthefloatexpr 45 * \pharmposter@fontscale\relax}\selectfont}
\renewcommand{\LARGE}{\fontsize{\xintthefloatexpr 43 * \pharmposter@fontscale\relax}{\xintthefloatexpr 54 * \pharmposter@fontscale\relax}\selectfont}
\renewcommand{\huge}{\fontsize{\xintthefloatexpr 51.6 * \pharmposter@fontscale\relax}{\xintthefloatexpr 64 * \pharmposter@fontscale\relax}\selectfont}
\renewcommand{\Huge}{\fontsize{\xintthefloatexpr 61.92 * \pharmposter@fontscale\relax}{\xintthefloatexpr 77 * \pharmposter@fontscale\relax}\selectfont}
\newcommand{\veryHuge}{\fontsize{\xintthefloatexpr 74.3 * \pharmposter@fontscale\relax}{\xintthefloatexpr 93 * \pharmposter@fontscale\relax}\selectfont}
\newcommand{\VeryHuge}{\fontsize{\xintthefloatexpr 89.16 * \pharmposter@fontscale\relax}{\xintthefloatexpr 112 * \pharmposter@fontscale\relax}\selectfont}
\newcommand{\VERYHuge}{\fontsize{\xintthefloatexpr 107 * \pharmposter@fontscale\relax}{\xintthefloatexpr 134 * \pharmposter@fontscale\relax}\selectfont}

% Set header and footer
\pagestyle{fancy}
\renewcommand{\headrule}{\color{badgerred}%
  \makebox[0pt][l]{%
    \rule[-0.1\baselineskip]{\linewidth}{\pharmposter@scale 5pt}}%
    \rule[-0.5\baselineskip]{\linewidth}{\pharmposter@scale 5pt}%
}
\lhead{\raisebox{-0.6\height}{\includegraphics[height=0.7\pharmposter@headerheight]{red-flush-UWlogo.pdf}}}
\chead{\raisebox{-0.5\height}{
	\parbox{0.6\textwidth} {
		{\begin{center} \sffamily \bfseries \VeryHuge \@title \end{center}}
}}}
\rhead{\raisebox{-0.5\height}{
	\parbox{0.25\textwidth} {
		{\begin{flushright} \sffamily \Huge \@author \end{flushright}}
	}
	\hspace{0.01\textwidth}
}}
\lfoot{}\cfoot{}\rfoot{}

% Create section boxes
\if@frames
	\newenvironment{sectionbox}[1]
	{\begin{tcolorbox}[breakable,colback=white,colframe=badgerred,boxrule={\pharmposter@scale 1mm},titlerule={\pharmposter@scale 4mm},toptitle={\pharmposter@scale 1mm},borderline horizontal={\pharmposter@scale 1mm}{0pt}{badgerred},title={\LARGE #1}]}
	{\end{tcolorbox} \vspace{0.25in} \vfill}
\else
	\newenvironment{sectionbox}[1]
	{\begin{tcolorbox}[empty,breakable,colback=white,titlerule={\pharmposter@scale 4mm},toptitle={\pharmposter@scale 1mm},borderline horizontal={\pharmposter@scale 1mm}{0pt}{badgerred},coltitle=badgerred,toptitle={\pharmposter@scale 5mm},title={\LARGE #1}]}
	{\end{tcolorbox} \vspace{0.25in} \vfill}
\fi

\AtBeginDocument{
	\Large
	\sffamily
	\if@portrait
		\begin{multicols}{2}
	\else
		\begin{multicols}{3}
    \fi
}

\AtEndDocument{
	\end{multicols}
}

\endinput
