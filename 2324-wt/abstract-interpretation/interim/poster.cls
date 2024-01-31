\ProvidesClass{poster}[The intermediate fair has never looked better]

\LoadClass[oneside]{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{kvoptions}
\DeclareDefaultOption{\PassOptionsToPackage{\CurrentOption}{smile}}
\ProcessKeyvalOptions*

\newlength\poster@textmargin
\newlength\poster@headermargin
\poster@textmargin2cm
\poster@headermargin3cm


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage[tikz]{smile}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins}
\RequirePackage[a3paper, vmargin=\z@, hmargin=\poster@textmargin, includefoot]{geometry}
\RequirePackage[skip=0.5\baselineskip, indent=\z@]{parskip}
\RequirePackage[tracking, expansion, babel]{microtype}

\RequirePackage{etoolbox}
\patchcmd\paragraph{3.25ex \@plus1ex \@minus.2ex}{\the\parskip plus 1ex minus .5ex}
{}{\ClassWarning{poster}{Patching paragraph did not work}}

\RequirePackage{calc}

\RequirePackage[grid]{multicol}
\def\columnseprulecolor{\color{accent}}
\columnseprule\smile@linewidth
\columnsep3em

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage[default]{FiraSans}
\setmonofont{FiraCode}[
	Path=./fonts/,
	Extension=.ttf,
	BoldFont={*-Bold},
	UprightFont={*-Regular},
	Contextuals=Alternate
]
\RequirePackage{unicode-math}
\setmathfont{FiraMath-Regular}[
	Path=./fonts/,
	Extension=.otf
]

\linespread{1.15}
\smile@linewidth2.2px

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\ensureinfocommand{title}
\ensureinfocommand{subtitle}
\ensureinfocommand{author}
\ensureinfocommand{date}
\ensureinfocommand{uni}
\ensureinfocommand{institute}
\ensureinfocommand{location}
\ensureinfocommand{logo}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newsavebox\poster@titletextb
\newlength\poster@titleheight
\tikzset{
	pipelinestep/.style={lw,rnd,shape=signal,signal from=west,signal pointer angle=130,minimum width=3cm,minimum height=2cm,draw=black,fill=lightgray!50!white},
	logo/.style={signal,signal to=nowhere,signal pointer angle=110,signal from=south,lw,rnd,draw=accent,fill=accent!70!white!20}
}
\renewcommand\maketitle{%
	\begingroup\hspace{-\poster@textmargin}\hspace\poster@headermargin%
	\savebox\poster@titletextb{\begin{minipage}[c]{\dimexpr\paperwidth-2\poster@headermargin\relax}%
		\vspace*{.5\poster@textmargin}%
		\microtypesetup{tracking=false}% OMFG No tracking on the title sir
		\fontsize{30pt}{30pt}\textsc{\textbf{\@title}}\\[1ex]%
		\fontsize{20pt}{20pt}\selectfont\@subtitle\\%
		\textcolor{accent}{\hrule height \smile@linewidth width 2cm\relax}\leavevmode\\[1ex]%
		\large\@author\par%
	\end{minipage}}\usebox\poster@titletextb\setlength{\poster@titleheight}{\ht\poster@titletextb + \dp\poster@titletextb}%
	\begin{tikzpicture}[overlay, remember picture]
		\node[node on layer=foreground,anchor=north east,minimum width=.75\poster@titleheight,minimum height=\poster@titleheight,outer sep=\z@,shift={(-\poster@headermargin,\smile@rounding)},logo] at (current page.north east) {\@logo};
	\end{tikzpicture}\vspace{1cm}
	\endgroup%
}
\renewcommand\@thefoot{%
	\begingroup%
	\hspace{-\poster@textmargin}%
	\fboxsep\z@%
	\fboxrule\z@%
	\fcolorbox{accent}{accent!10}{%
		\begin{minipage}[b]{\paperwidth}%
			\textcolor{accent}{\hrule height \smile@linewidth\relax}
			\vspace*{0.9ex}%
			\hspace\poster@headermargin%
			\@date\hfill\@institute\hfill\@uni%
			\hspace\poster@headermargin%
			\vspace*{0.9ex}%
		\end{minipage}
	}
	\endgroup%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{titlesec}
\titleformat\section{\centering\bfseries\Large}{\thesection}{1em}{}[{\color{accent}\titlerule[\smile@linewidth]}]
\titleformat\subsection{\bfseries\large}{\thesubsection}{1em}{}
\titleformat\paragraph[runin]{\bfseries\color{accent}}{\theparagraph}{1em}{}


\RequirePackage[inline]{enumitem}
\setlist[enumerate]{itemsep=-0.5\parskip, label=(\arabic*)}
\setlist[itemize]{label=\textcolor{accent}{\fullcirc}, itemsep=-0.5\parskip}
\setlist[description]{style=sameline, labelsep=0.5em, itemsep=\dimexpr-\itemsep-\parsep, font=\color{accent}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newtcolorbox{mybox}[3]{boxrule=\smile@linewidth, IfBlankTF={#2}{toprule=2mm}{title=#2},colback=#1!5!white,colframe=#1,left=1em,
lefttitle=4mm, arc=\smile@rounding, enhanced, segmentation engine=path,
segmentation style={solid, shorten >=1em,shorten <=1em, line width=\smile@linewidth}, #3}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage[grid]{multicol}
\def\columnseprulecolor{\color{accent}}
\columnseprule\smile@linewidth
\columnsep3em

\let\oldemph\emph
\def\emph#1{{\color{accent!40!black}\oldemph{#1}}}

\pagestyle{empty}
