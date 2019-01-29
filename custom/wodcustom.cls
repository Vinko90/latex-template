\ProvidesClass{custom/wodcustom}
\LoadClass{report}

\RequirePackage[top=2.54cm, bottom=3.04cm, left=2.74cm, right=2.75cm]{geometry}
\RequirePackage{parskip}
\RequirePackage{titlesec}
\RequirePackage[titles]{tocloft}
\RequirePackage[english]{babel}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{lastpage}
\RequirePackage[pagewise,modulo]{lineno}
\RequirePackage{datetime}
\RequirePackage{xifthen}
\RequirePackage{float}
\RequirePackage{tikz}
\RequirePackage{color, colortbl}
\RequirePackage[T1]{fontenc}
\RequirePackage{helvet}
\RequirePackage{pdflscape}
\RequirePackage{enumitem}
\RequirePackage{amssymb}
\RequirePackage{MnSymbol}
\RequirePackage{listings}
\RequirePackage{ifthen}
\RequirePackage{soul}
\RequirePackage{marvosym}
\RequirePackage{marginnote}
\RequirePackage{hanging}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{etoolbox}
\RequirePackage{longtable}
\RequirePackage{xparse}
\RequirePackage{tabularx}
\RequirePackage{environ}
\RequirePackage[normalem]{ulem}
\RequirePackage{microtype}
\RequirePackage{pdfcomment}

%---------
% LANGUAGE
\selectlanguage{english}
%---------

%---------
% TITLE PAGE
\fancypagestyle{titlepage}{%
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\renewcommand{\headheight}{82.5pt}

	\fancyhead[L]{%
		\begin{picture}(0,0)
			\put(0,0){\includegraphics[width=5.7cm]{custom/openlogo.jpg}}
		\end{picture}}
	\fancyhead[R]{}
	\fancyfoot[L]{}
	\fancyfoot[C]{%
		\begin{tikzpicture}[remember picture,overlay]
			\node[right] at (-7.865,4.11) {\LARGE\bf{Confidential}};
			%\node[left] at (7.94,3.62) {\fontsize{6pt}{6pt}\selectfont Template Release};
			%\node[left] at (7.94,3.37) {\fontsize{6pt}{6pt}\selectfont Template Date};
			\draw[color=color_titlepage_green,line width=0.055cm] (-7.79,2.99) -- (7.82, 2.99);
			\node[right] at (-7.865,2.48) {\bfseries{\textcolor{color_titlepage_green}{Company Name}}};
			\node[left] at (7.94,2.48) {\bfseries{\textcolor{color_titlepage_green}{website}}};
			\node[right] at (-7.865,1.95) {\footnotesize{PO Box 00000}};
			\node[right] at (-7.865,1.63) {\footnotesize{NL - 0000 AA Eindhoven}};
			\node[right] at (-1.38,1.95) {\footnotesize{Address 1}};
			\node[right] at (-1.38,1.63) {\footnotesize{NL - 0000 AA CITY}};
			\node[left] at (7.94,1.95) {\footnotesize{T. +31 00 00 00 000}};
			\node[left] at (7.94,1.63) {\footnotesize{F. +31 00 00 00 000}};
		\end{tikzpicture}%
	}
	\fancyfoot[R]{}
}

\renewcommand*\maketitle{
\thispagestyle{titlepage}
	% Disable linelumbers
	\begin{nolinenumbers}
	
	\vspace*{5.8cm}
	
	\begin{flushleft}
		\LARGE\bf{\thedocumenttype \\
		\vspace{0.7cm}
		of \thedocumenttitle \\
		\vspace{0.7cm}
		\theproductowner}
	\end{flushleft}
	
	\begin{tikzpicture}[remember picture,overlay]%
		\draw[fill=color_titlepage_gray,draw=none] (-2.74,-5.42) -- (-0.34, -5.42) -- (0.05, -5.87) -- (0.44, -5.42) -- (18.26,-5.42) -- (18.26, -8.09) -- (-2.74,-8.09);%
		\node[right] at (-0.12, -6.92) {
			\begin{tabular}{@{}ll@{}}% Use @{} to remove the column separation space on the left (and possibly on the right)
				Reference: & \mbox{\thedocumentbasename}\\
				Reference~date: & \mbox{\thereleasedate}\\
				Author(s): & \mbox{\theauthor}\\
				Status: & \mbox{\thedocumentstatus}\\
			\end{tabular}
		};
	\end{tikzpicture}%

	\end{nolinenumbers}
	\newpage
}
%---------

%---------
% HEADER
\fancypagestyle{plain}{%
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\fancyhead[L]{%
		\begin{picture}(0,0)
			\put(0,-14.3){\includegraphics[width=4.46cm]{custom/openlogo.jpg}}
		\end{picture}%
		\begin{tikzpicture}[remember picture,overlay]
			\node[right] at (13.35,-0.26) {\bfseries{Confidential}};
		\end{tikzpicture}%
	}
	\fancyhead[C]{}
	\fancyhead[R]{}
	\fancyfoot[L]{}
	\fancyfoot[C]{%
		\begin{tikzpicture}[remember picture,overlay]%
			\draw[color=color_titlepage_green,line width=0.05cm] (-7.79,0.5) -- (7.82,0.5);%
			\node[right] at (-7.865,-0.02) {\thedocumenttypeabbreviation \  \thedocumenttitle};%
			\node[right] at (-7.865,-0.42) {\jobname};%
			\node[left] at (7.87,0.03) {\thereleasedate};%
			\node[left] at (7.87,-0.44) {Page \thepage \ of \pageref{LastPage}};%
		\end{tikzpicture}%
	}
	\fancyfoot[R]{}
}
\pagestyle{plain} % Redefined plain style for all pages
%---------

%---------
% ATTRIBUTE
\newcommand*\thedocumenttype{<Document Type>}
\newcommand*\documenttype[1]{\renewcommand*\thedocumenttype{#1}}

\newcommand*\thedocumenttypeabbreviation{<Document Type Abbreviation>}
\newcommand* \documenttypeabbreviation[1]{\renewcommand* \thedocumenttypeabbreviation{#1}}

\newcommand*\thedocumenttitle{<Document Title>}
\renewcommand*\title[1]{\renewcommand* \thedocumenttitle{#1}}

\newcommand*\theauthor{<Author>}
\renewcommand* \author[1]{\renewcommand* \theauthor{#1}}

\newcommand*\theproductowner{<Product owner name>}
\newcommand* \productowner[1]{\renewcommand* \theproductowner{#1}}

\newcommand*\thereleasedate{<Release date>}
\newcommand* \releasedate[1]{\renewcommand* \thereleasedate{#1}}

\newcommand*\thedocumentstatus{<Document status>}
\newcommand* \documentstatus[1]{\renewcommand* \thedocumentstatus{#1}}

\newcommand*\thedocumentbasename{\jobname}

\renewcommand{\dateseparator}{-} % Format date
\newcommand*{\woddate}{\yyyymmdddate}

\newcommand{\makedisclaimer}
{
	\textit{The contents of this document are confidential information and intellectual property of WarOfDevil. Nothing of this document may be used or duplicated or published without prior written approval of WarOfDevil.}
}
%---------

%---------
% APPENDIX
\newcommand* \wodappendix {
	\appendix
	
	\titleformat{\chapter}
	{\LARGE\bf} 				% format
	{Appendix \thechapter.}		% label
	{3pt}						% horizontal separation between label and title body
	{}							% before code
	
	%Update the figure and table naming to include appendix letter
	\renewcommand{\thefigure}{\Alph{chapter}.\arabic{figure}}
	\renewcommand{\thetable}{\Alph{chapter}.\arabic{table}}
}
%---------

%---------
% BIBLIOGRAPHY
\renewcommand\bibname{References} % Modify the Bibliography title to be called References
\makeatletter % Make sure that bib labels are left aligned
\renewcommand{\@biblabel}[1]{[#1]\hfill}
\makeatother

\makeatletter
\renewenvironment{thebibliography}[1]
     {\bibname% <-- this line was changed from \chapter*{\bibname} to \bibname
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\makeatother

\newlength{\bibrowwidth} % The width of the first argument in \wodbibrow
\setlength{\bibrowwidth}{3.5cm}

\newcommand{\wodbibrow}[2]
{% '-\labelwidth-5pt' is done to prevent 'overfull hbox'
	\begin{tabularx}{\textwidth-\labelwidth-5pt}{lX}
		\makebox[\bibrowwidth][l]{#1} & #2\\
	\end{tabularx}
}
%---------

%---------
% COLORS
\definecolor{color_fail}{rgb}{1,0,0}
\definecolor{color_measure}{rgb}{1,1,0}
\definecolor{color_new}{rgb}{0,1,1}
\definecolor{color_pass}{rgb}{0,1,0}
\definecolor{color_tbd}{rgb}{1,0,1}
\definecolor{color_titlepage_gray}{RGB}{207,207,207}
\definecolor{color_titlepage_green}{RGB}{65,170,85}
%---------

%---------
% DISTRIBUTION LIST
\newenvironment{woddistributionlist}[2]
{
	\begingroup
	\let\clearpage\relax
	\chapter*{Distribution list}
	\endgroup
	\begin{wodtabular}{l | #1}
	\wodtablehead{Name & #2}
}
{
	\end{wodtabular}
}

\newenvironment{woddistributionlist*}[2]
{
	\begin{wodtabular}{l | #1}
	\wodtablehead{Name & #2}
}
{
	\end{wodtabular}
}
%---------

%---------
% HISTORY
\newenvironment{woddocumenthistory}%
{%
	\begingroup
	\let\clearpage\relax
	\chapter*{Document history}
	\endgroup
	\wodtabularx{\textwidth}{l|l|X}
		\wodtablehead{Rel. & Date & Changes}
}
{%
	\endwodtabularx%
}%

\newenvironment{woddocumenthistoryS}
{
	\begingroup
	\let\clearpage\relax
	\chapter*{Document history}
	\endgroup
	\wodtabularx{\textwidth}{l|l|l|X}
		\wodtablehead{Rel. & Date & Status & Changes}
}
{
	\endwodtabularx%
}

\newenvironment{woddocumenthistory*}
{%
	\wodtabularx{\textwidth}{l|l|X}
		\wodtablehead{Rel. & Date & Changes}
}
{%
	\endwodtabularx%
}%

\newenvironment{woddocumenthistoryS*}%
{%
	\wodtabularx{\textwidth}{l|l|l|X}
		\wodtablehead{Rel. & Date & Status & Changes}
}
{%
	\endwodtabularx%
}%

\newcounter{woddocumenthistorycount} % Document history release counter

\newcommand{\woddocumenthistoryrow}[2] % Document history entry macro
{%
	\addtocounter{woddocumenthistorycount}{1}%
	\wodtablerow{%
		% column Release
		R\ifthenelse{\value{woddocumenthistorycount} < 10}{0}{}\arabic{woddocumenthistorycount} &%
		%
		% column Date
		#1 &%
		%
		% column Changes
		\begin{minipage}[t]{\linewidth}%
		#2%
		\smallskip%
		\end{minipage}%
	}
}

\newcommand{\woddocumenthistoryrowS}[3]
{%
	\addtocounter{woddocumenthistorycount}{1}%
	\wodtablerow{%
		% column Release
		R\ifthenelse{\value{woddocumenthistorycount} < 10}{0}{}\arabic{woddocumenthistorycount} &%
		%
		% column Date
		#1 &%
		%
		% column Status
		#2 &%
		%
		% column Changes
		\begin{minipage}[t]{\linewidth}%
		#3%
		\smallskip%
		\end{minipage}%
	}
}
%---------

%---------
% FIGURE
\usetikzlibrary{shapes,decorations,arrows,chains,positioning,calc} % Load tikz libraries

\graphicspath{{figures/}}                                   % Set graphicspath to the subdir figures/
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}} % Set figure caption style

\ExplSyntaxOn
\NewDocumentEnvironment{wodfigure}{O{!ht} O{raggedright}}
{
	\begin{figure}[#1]
	\captionsetup{format=plain, font=it, justification=#2, singlelinecheck=off, skip=6pt}
	\ifstrequal{#2}{centering}{\centering}{}
}
{
	\end{figure}
}
\ExplSyntaxOff

\newcommand*\wodincludegraphics[4][]
{
	\IfFileExists{figures/#4.tikz}{\input{figures/#4.tikz}}{\includegraphics[#1]{#4}}
	\caption{#3}
	\label{#2}
}
%---------

%---------
% FUNCTION
% Input arguments
\newcommand{\wodfunctionargin}[2]
{%
  \ifnumequal{\value{wodfunctionargincount}}{0}
    {\item[Input: ] \texttt{\detokenize\expandafter{#1}}: #2~}
    {\item[~]       \texttt{\detokenize\expandafter{#1}}: #2~}
  \stepcounter{wodfunctionargincount}
}

% Output arguments
\newcommand{\wodfunctionargout}[2]
{%
  \ifnumequal{\value{wodfunctionargoutcount}}{0}
    {\item[Output:] \texttt{\detokenize\expandafter{#1}}: #2~}
    {\item[~]       \texttt{\detokenize\expandafter{#1}}: #2~}
  \stepcounter{wodfunctionargoutcount}
}

% Return values
\newcommand{\wodfunctionreturn}[2]
{%
  \ifnumequal{\value{wodfunctionreturncount}}{0}
    {\item[Return:] \ifstrempty{#1}{#2}{\texttt{\detokenize\expandafter{#1}}: #2~}}
    {\item[~]       \ifstrempty{#1}{#2}{\texttt{\detokenize\expandafter{#1}}: #2~}}
  \stepcounter{wodfunctionreturncount}
}

% Throws
\newcommand{\wodfunctionthrow}[2]
{%
  \ifnumequal{\value{wodfunctionthrowcount}}{0}
    {\item[Throw:]  \ifstrempty{#1}{#2}{\texttt{\detokenize\expandafter{#1}}: #2~}}
    {\item[~]       \ifstrempty{#1}{#2}{\texttt{\detokenize\expandafter{#1}}: #2~}}
  \stepcounter{wodfunctionthrowcount}
}

% Run errors
\newcommand{\wodfunctionrunerror}[2]
{%
  \ifnumequal{\value{wodfunctionrunerrorcount}}{0}
    {\item[Run error:] \ifstrempty{#1}{#2}{\texttt{\detokenize\expandafter{#1}}: #2~}}
    {\item[~]          \ifstrempty{#1}{#2}{\texttt{\detokenize\expandafter{#1}}: #2~}}
  \stepcounter{wodfunctionrunerrorcount}
}

% Completes
\newcommand{\wodfunctioncomplete}[2]
{%
  \ifnumequal{\value{wodfunctioncompletecount}}{0}
    {\item[Complete:] \ifstrempty{#1}{#2}{\texttt{\detokenize\expandafter{#1}}: #2~}}
    {\item[~]         \ifstrempty{#1}{#2}{\texttt{\detokenize\expandafter{#1}}: #2~}}
  \stepcounter{wodfunctioncompletecount}
}
\newcounter{wodfunctionargincount}
\newcounter{wodfunctionargoutcount}
\newcounter{wodfunctionreturncount}
\newcounter{wodfunctionthrowcount}
\newcounter{wodfunctionrunerrorcount}
\newcounter{wodfunctioncompletecount}

\makeatletter
\lst@AddToHook{TextStyle}{\let\lst@basicstyle\normalsize}
\makeatother

\newenvironment{wodfunction}[2]
{
  \setcounter{wodfunctionargincount}{0}
  \setcounter{wodfunctionargoutcount}{0}
  \setcounter{wodfunctionreturncount}{0}
  \setcounter{wodfunctionthrowcount}{0}
  \setcounter{wodfunctionrunerrorcount}{0}
  \setcounter{wodfunctioncompletecount}{0}

  \lstinline$#1$
  \begin{description}[leftmargin=2.2cm,noitemsep,topsep=0pt,font=\normalfont,style=nextline,labelindent=0.4cm]
  \item[Descr:] #2
}
{
  \end{description}
  \vspace{1ex}
}
%---------

%---------
% FONT
\renewcommand*\familydefault{\sfdefault}
%---------

%---------
% HEADING
\setcounter{secnumdepth}{3}

\titleformat{\chapter}
	{\LARGE\bf} 	% format
	{\thechapter.}	% label
	{6pt}			% horizontal separation between label and title body
	{}				% before code
	
\titlespacing*{\chapter}
	{0pt}
	{-\topskip} % correct space above chapter
	{0pt}

\titleformat{name=\chapter, numberless}
	{\vspace{0.8cm}\Large\bf\filcenter}
	{}
	{0pt}
	{}
	[\vspace{3pt}]

\titleformat{\section}
	{\vspace{5pt}\Large\bf}
	{\thesection.}
	{3pt}
	{}

\titlespacing*{\section}
	{0pt}
	{0pt}
	{0pt}

\titleformat{\subsection}
	{\vspace{5pt}\large\bf}
	{\thesubsection.}
	{3pt}
	{}
	
\titlespacing*{\subsection}
	{0pt}
	{0pt}
	{0pt}

\titleformat{\subsubsection}
	{\vspace{5pt}\large\bf}
	{\thesubsubsection.}
	{3pt}
	{}
	
\titlespacing*{\subsubsection}
	{0pt}
	{0pt}
	{0pt}
%---------

%---------
% ISSUE
\newenvironment{wodissues}[0]
{%
	\begingroup
	\let\clearpage\relax
	\chapter*{Open issues}
	\endgroup
	\wodtabularx{\textwidth}{l|l|X|l|l}
		\wodtablehead{Issue & Section & Description & Responsible & Due Date}
}
{%
	\endwodtabularx%
}%

\newcommand{\wodissue}[5] % Document history entry macro
{
	\wodtablerow{#1 & #2 & #3 & #4 & #5}
}
%---------

%---------
% LANDSCAPE
\ExplSyntaxOn
\NewDocumentEnvironment{wodlandscape}{}
{
	\begin{landscape}
	\nolinenumbers % disable line numbers since they will be placed over the footer.
}
{
	\end{landscape} % re-enable line numbers
	\linenumbers
}
\ExplSyntaxOff
%---------

%---------
% LINENUMBER
\def\linenumberfont{\normalfont\footnotesize\sffamily}
\linenumbers

\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
    \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
    \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
    \renewenvironment{#1}%
    {\linenomath\csname old#1\endcsname}%
    {\csname oldend#1\endcsname\endlinenomath}}% 
\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
    \patchAmsMathEnvironmentForLineno{#1}%
    \patchAmsMathEnvironmentForLineno{#1*}}%
\AtBeginDocument{%
    \patchBothAmsMathEnvironmentsForLineno{equation}%
    \patchBothAmsMathEnvironmentsForLineno{align}%
    \patchBothAmsMathEnvironmentsForLineno{flalign}%
    \patchBothAmsMathEnvironmentsForLineno{alignat}%
    \patchBothAmsMathEnvironmentsForLineno{gather}%
    \patchBothAmsMathEnvironmentsForLineno{multline}%
}
%---------

%---------
% LIST
\ExplSyntaxOn
\NewDocumentEnvironment{woditemize}{}
{
	\begin{itemize}[nosep]
}
{
	\end{itemize}
}
\ExplSyntaxOff

\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{$\circ$}
\renewcommand{\labelitemiii}{$\filledsquare$}

\ExplSyntaxOn
\NewDocumentEnvironment{wodenumerate}{}
{
	\begin{enumerate}[nosep]
	\setcounter{enumi}{0}
}
{
	\end{enumerate}
}
\ExplSyntaxOff

\setenumerate[1]{label=\arabic*.}
\setenumerate[2]{label=\alph*.}
\setenumerate[3]{label=\roman*.}
\setenumerate[4]{label=\arabic*.}

\ExplSyntaxOn
\NewDocumentEnvironment{woddescription}{}
{
	\begin{description}[nosep]
}
{
	\end{description}
}
\ExplSyntaxOff
%---------

%---------
% LISTING
\definecolor{Keywords}{rgb}{0.24,0.24,1}
\definecolor{Comment}{rgb}{0,0.4,1}
\definecolor{String}{rgb}{0.01,0.42,0.03}
\definecolor{Identifier}{rgb}{0,0,0}

% Set caption style
% left aligned
\captionsetup[lstlisting]{format=plain, font=it, justification=raggedright, singlelinecheck=off, skip=6pt}
\captionsetup[lstinputlisting]{format=plain, font=it, justification=raggedright, singlelinecheck=off, skip=6pt}

% Define rendering options for specific languages edit as desired
\lstdefinestyle{bash}{%
	language=bash,						% Language definition
	linewidth=0.993\linewidth,				% Vertical border should match with tables and footer
	basewidth={0.50em, 0.50em},				% Use a somewhat compact style
	basicstyle=\ttfamily\footnotesize,			% Use a somewhat smaller font
	commentstyle=\ttfamily\color{Comment}\itshape,		% Comment text style
	keywordstyle=\ttfamily\color{Keywords},			% Keyword text style
	identifierstyle=\ttfamily\color{Identifier}\bfseries,	% Ident.  text style
	stringstyle=\ttfamily\color{String},			% String  text style
	showspaces=false,					% Don't show spaces
	showstringspaces=false,					% Don't show spaces in strings
	tabsize=2,						% 2 column tab size
	showtabs=false,						% Don't show tabs
	fontadjust=false,					% Don't use proportional fonts
	numbers=left,						% Display line numbers on the left
	numberstyle=\tiny,					% Don't make them too big
	numberblanklines=true,					% Continue numbering empty lines
	breaklines=true,					% Perform word wrapping when necessary
	frame=tb,						% Put a frame on top and bottom
	xleftmargin=20pt,					% Move line numbers inward
	framexleftmargin=5mm, 					% Create a fancy frame around listing
	frame=single
}

\lstdefinestyle{C}{%
	language=[ANSI]C,						% Language definition
	linewidth=0.993\linewidth,					% Vertical border should match with tables and footer
	basewidth={0.50em, 0.50em},					% Use a somewhat compact style
	basicstyle=\ttfamily\footnotesize,				% Use a somewhat smaller font
	commentstyle=\ttfamily\footnotesize\color{Comment}\itshape,	% Comment text style
	keywordstyle=\ttfamily\color{Keywords}\bfseries,		% Keyword text style
	identifierstyle=\ttfamily\color{Identifier},			% Ident.  text style
	stringstyle=\ttfamily\color{String},				% String  text style
	showspaces=false,						% Don't show spaces
	showstringspaces=false,						% Don't show spaces in strings
	tabsize=2,							% 2 column tab size
	showtabs=false,							% Don't show tabs
	fontadjust=false,						% Don't use proportional fonts
	numbers=left,							% Display line numbers on the left
	breaklines=true,						% Perform word wrapping when necessary
	frame=tb,							% Put a frame on top and bottom
	xleftmargin=20pt,
	framexleftmargin=5mm, 						% Create a fancy frame around listing
	frame=single,
	morekeywords=[0]{int64_t, int32_t, int16_t, int8_t},
	morekeywords=[1]{uint64_t, uint32_t, uint16_t, uint8_t},
}

\lstdefinestyle{C++}{%
	language=[ISO]C++,						% Language definition
	linewidth=0.993\linewidth,					% Vertical border should match with tables and footer
	basewidth={0.50em, 0.50em},					% Use a somewhat compact style
	basicstyle=\ttfamily\footnotesize,				% Use a somewhat smaller font
	commentstyle=\ttfamily\color{Comment}\itshape,			% Comment text style
	keywordstyle=\ttfamily\color{Keywords},				% Keyword text style
	identifierstyle=\ttfamily\color{Identifier}\bfseries,		% Ident.  text style
	stringstyle=\ttfamily\color{String},				% String  text style
	showspaces=false,						% Don't show spaces
	showstringspaces=false,						% Don't show spaces in strings
	tabsize=2,							% 2 column tab size
	showtabs=false,							% Don't show tabs
	fontadjust=false,						% Don't use proportional fonts
	numbers=left,							% Display line numbers on the left
	numberstyle=\tiny,						% Don't make them too big
	numberblanklines=true,						% Continue numbering empty lines
	breaklines=true,						% Perform word wrapping when necessary
	frame=tb,							% Put a frame on top and bottom
	xleftmargin=20pt,
	framexleftmargin=5mm, 						% Create a fancy frame around listing
	frame=single
}

\lstdefinelanguage{CSharp}{%
	sensitive=true,
	morekeywords=[1]{
		abstract, as, base, break, case, catch, checked, class, const, continue, 
		default, delegate, do, else, enum, event, explicit, extern, false, 
		finally, fixed, for, foreach, goto, if, implicit, in, interface, internal, 
		is, lock, namespace, new, null, operator, out, override, params, private, 
		protected, public, readonly, ref, return, sealed, sizeof, stackalloc, 
		static, struct, switch, this, throw, true, try, typeof, unchecked, unsafe, 
		using, var, virtual, volatile, while, bool, byte, char, decimal, double, float,
		int, lock, object, sbyte, short, string, uint, ulong, ushort, void},
	morecomment=[l]{//},
	morecomment=[s]{/*}{*/},
	morecomment=[l][keywordstyle4]{\#},
	morestring=[b]",
	morestring=[b]',
}

\lstdefinestyle{CSharp}{%
	language=CSharp,					% Language definition
	linewidth=0.993\linewidth,				% Vertical border should match with tables and footer
	basicstyle=\ttfamily\footnotesize,			% Use a somewhat smaller font
	commentstyle=\ttfamily\color[rgb]{0.133,0.545,0.133},	% Comment text style
	keywordstyle=\ttfamily\color[rgb]{1.0,0,0},		% Default keyword text style
	keywordstyle=[1]\ttfamily\color[rgb]{0,0,0.75},		% Keyword text style
	keywordstyle=[2]\ttfamily\color[rgb]{0.5,0.0,0.0},	% Text text style
	keywordstyle=[3]\ttfamily\color[rgb]{0.127,0.427,0.514},% Class text style
	keywordstyle=[4]\ttfamily\color[rgb]{0.4,0.4,0.4},	% Summary xml text style
	identifierstyle=\ttfamily,				% Ident. text style
	stringstyle=\ttfamily\color[rgb]{0.639,0.082,0.082},	% String text style
	showspaces=false,					% Don't show spaces
	showstringspaces=false,					% Don't show spaces in strings
	tabsize=2,						% 2 column tab size
	showtabs=false,						% Don't show tabs
	fontadjust=false,					% Don't use proportional fonts
	numbers=left,						% Display line numbers on the left
	numberstyle=\tiny,					% Don't make them too big
	numberblanklines=true,					% Continue numbering empty lines
	breaklines=true,					% Perform word wrapping when necessary
	frame=tb,						% Put a frame on top and bottom
	xleftmargin=20pt,					% Move line numbers inward
	framexleftmargin=5mm, 					% Create a fancy frame around listing
	frame=single,
}

\lstdefinestyle{LaTeX}{%
	language=[LaTeX]TeX,		% Language definition
	linewidth=0.993\linewidth,	% Vertical border should match with tables and footer
	basewidth={0.50em, 0.50em},				% Use a somewhat compact style
	basicstyle=\ttfamily\footnotesize,				% Use a somewhat smaller font
	commentstyle=\ttfamily\footnotesize\color{Comment}\itshape,	% Comment text style
	keywordstyle=\ttfamily\color{Keywords}\bfseries,		% Keyword text style
	identifierstyle=\ttfamily\color{Identifier},			% Ident.  text style
	stringstyle=\ttfamily\color{String},				% String  text style
	numbers=left,			% Display line numbers on the left
	numberstyle=\tiny,		% Don't make them too big
	numberblanklines=true,		% Continue numbering empty lines
	breaklines=true,		% Perform word wrapping when necessary
	frame=tb,			% Put a frame on top and bottom
	xleftmargin=20pt,		% Move line numbers inward
	framexleftmargin=5mm, 		% Create a fancy frame around listing
	frame=single,
}

\lstdefinestyle{VHDL}{%
	language=VHDL,							% Language definition
	linewidth=0.993\linewidth,					% Vertical border should match with tables and footer
	basewidth={0.50em, 0.50em},					% Use a somewhat compact style
	basicstyle=\ttfamily\footnotesize,				% Use a somewhat smaller font
	commentstyle=\ttfamily\footnotesize\color{Comment}\itshape,	% Comment text style
	keywordstyle=\ttfamily\color{Keywords}\bfseries,		% Keyword text style
	identifierstyle=\ttfamily\color{Identifier},			% Ident.  text style
	stringstyle=\ttfamily\color{String},				% String  text style
	showspaces=false,						% Don't show spaces
	showstringspaces=false,						% Don't show spaces in strings
	tabsize=2,							% 2 column tab size
	showtabs=false,							% Don't show tabs
	fontadjust=false,						% Don't use proportional fonts
	numbers=left,							% Display line numbers on the left
	numberstyle=\tiny,						% Don't make them too big
	numberblanklines=true,						% Continue numbering empty lines
	breaklines=true,						% Perform word wrapping when necessary
	xleftmargin=20pt,
	framexleftmargin=5mm, 						% Create a fancy frame around listing
	frame=single
}

\lstdefinestyle{XML}{%
	language=XML,
	linewidth=0.993\linewidth,
	basewidth={0.50em, 0.50em},
	basicstyle=\ttfamily\footnotesize,
	morestring=[b]",
	moredelim=[s][\bfseries\color{Keywords}]{<}{\ },
	moredelim=[s][\bfseries\color{Keywords}]{</}{>},
	moredelim=[l][\bfseries\color{Keywords}]{/>},
	moredelim=[l][\bfseries\color{Keywords}]{>},
	morecomment=[s]{<?}{?>},
	morecomment=[s]{<!--}{-->},
	commentstyle=\color{Comment},
	identifierstyle=\color{Identifier},
	stringstyle=\color{String},
	showspaces=false,
	showstringspaces=false,
	tabsize=2,
	showtabs=false,
	fontadjust=false,
	numbers=left,
	numberstyle=\tiny,
	numberblanklines=true,
	breaklines=true,
	xleftmargin=20pt,
	framexleftmargin=5mm,
	frame=single
}

\lstdefinestyle{MAKE}{%
	language=make,						% Language definition
	linewidth=0.993\linewidth,				% Vertical border should match with tables and footer
	basewidth={0.50em, 0.50em},				% Use a somewhat compact style
	basicstyle=\ttfamily\footnotesize,			% Use a somewhat smaller font
	commentstyle=\ttfamily\color{Comment}\itshape,		% Comment text style
	keywordstyle=\ttfamily\color{Keywords},			% Keyword text style
	identifierstyle=\ttfamily\color{Identifier}\bfseries,	% Ident.  text style
	stringstyle=\ttfamily\color{String},			% String  text style
	showspaces=false,					% Don't show spaces
	showstringspaces=false,					% Don't show spaces in strings
	tabsize=2,						% 2 column tab size
	showtabs=false,						% Don't show tabs
	fontadjust=false,					% Don't use proportional fonts
	numbers=left,						% Display line numbers on the left
	numberstyle=\tiny,					% Don't make them too big
	numberblanklines=true,					% Continue numbering empty lines
	breaklines=true,					% Perform word wrapping when necessary
	frame=tb,						% Put a frame on top and bottom
	xleftmargin=20pt,					% Move line numbers inward
	framexleftmargin=5mm, 					% Create a fancy frame around listing
	frame=single
}

\lstdefinestyle{SQL}{%
	language=SQL,					% Language definition
	linewidth=0.993\linewidth,				% Vertical border should match with tables and footer
	basicstyle=\ttfamily\footnotesize,			% Use a somewhat smaller font
	commentstyle=\ttfamily\color[rgb]{0,0.5,0},	% Comment text style
	keywordstyle=\ttfamily\color[rgb]{0,0,0.75},		% Default keyword text style
	identifierstyle=\ttfamily,				% Ident. text style
	stringstyle=\ttfamily\color[rgb]{0.75,0,0},	% String text style
	showspaces=false,					% Don't show spaces
	showstringspaces=false,					% Don't show spaces in strings
	tabsize=4,						% 2 column tab size
	showtabs=false,						% Don't show tabs
	fontadjust=false,					% Don't use proportional fonts
	numbers=left,						% Display line numbers on the left
	numberstyle=\tiny,					% Don't make them too big
	numberblanklines=true,					% Continue numbering empty lines
	breaklines=true,					% Perform word wrapping when necessary
	frame=tb,						% Put a frame on top and bottom
	xleftmargin=20pt,					% Move line numbers inward
	framexleftmargin=5mm, 					% Create a fancy frame around listing
	frame=single,
}

\lstdefinestyle{Python}{%
    language=Python,
    linewidth=0.993\linewidth,              % Vertical border should match with tables and footer
    basewidth={0.50em, 0.50em},             % Use a somewhat compact style
    basicstyle=\ttfamily\footnotesize,          % Use a somewhat smaller font
    commentstyle=\ttfamily\color{Comment}\itshape,      % Comment text style
    keywordstyle=\ttfamily\color{Keywords},         % Keyword text style
    identifierstyle=\ttfamily\color{Identifier}\bfseries,   % Ident.  text style
    stringstyle=\ttfamily\color{String},            % String  text style
    showspaces=false,                   % Don't show spaces
    showstringspaces=false,                 % Don't show spaces in strings
    tabsize=4,                      % 4 column tab size
    showtabs=false,                     % Don't show tabs
    fontadjust=false,                   % Don't use proportional fonts
    numbers=left,                       % Display line numbers on the left
    numberstyle=\tiny,                  % Don't make them too big
    numberblanklines=true,                  % Continue numbering empty lines
    breaklines=true,                    % Perform word wrapping when necessary
    frame=tb,                       % Put a frame on top and bottom
    xleftmargin=20pt,                   % Move line numbers inward
    framexleftmargin=5mm,                   % Create a fancy frame around listing
    frame=single
    otherkeywords={self},             % Add keywords here
}
%---------

%---------
% LONG TABLE
\newenvironment{wodlongtable}[4]
{
	\begingroup
	\ifequalstr{#4}{centering}
		{\centering}
		{\setlength{\LTleft}{0pt}} %set left space to zero for longtable, otherwise longtable will be centered.
	
	\setlength{\tabcolsep}{4pt}%
	\fontsize{8pt}{8pt}\selectfont%
	\renewcommand*{\arraystretch}{1.4}%
	\begin{longtable}[b]{!{\wodoutline} #1 !{\wodoutline}}
	\ifequalstr{centering}{#4}
		{\captionsetup{format=plain, font=it, justification=centering, singlelinecheck=off, skip=6pt}}
		{\captionsetup{format=plain, font=it, justification=raggedright, singlelinecheck=off, skip=6pt}}
	\caption{#3}\label{#2}\\
	\specialrule{1.5pt}{0pt}{0pt}
}
{
	\specialrule{1.1pt}{0pt}{0pt} %1.5pt - 0.4pt (\wodtablerow) = 1.1pt
	\end{longtable}
	\endgroup
}
%---------

%---------
% MARKING
\newcommand{\wodhighlight}[2]%
{
	\texorpdfstring
		{\protect\sethlcolor{#1}\hl{#2}\protect\sethlcolor{white}}
		{#2}
}

\newcommand{\FAIL}[1]{\wodhighlight{color_fail}{#1}}
\newcommand{\NEW}[1]{\wodhighlight{color_new}{#1}}
\newcommand{\MEASURE}[1]{\wodhighlight{color_measure}{#1}}
\newcommand{\PASS}[1]{\wodhighlight{color_pass}{#1}}
\newcommand{\TBD}[1]{\wodhighlight{color_tbd}{#1}}
\newcommand{\TODO}[1]{\wodhighlight{color_tbd}{#1}}
%---------

%---------
% REFERENCE
\hypersetup{colorlinks, allcolors=black, linkcolor=black, citecolor=black, filecolor=blue, urlcolor=blue, bookmarksnumbered}

\RequirePackage[capitalise, noabbrev]{cleveref}
\RequirePackage{xifthen}

\newcommand{\figref}[1]{\cref{#1}}	
\newcommand{\tblref}[1]{\cref{#1}}
\newcommand{\secref}[1]{\cref{#1}}

\newcommand{\wodurl}[2][]%
{\ifthenelse{\isempty{#1}}%
	{\href{#2}{\wodunderline{#2}}}%
	{\href{#2}{\wodunderline{#1}}}%
}%
%---------

%---------
% TABLE
\ExplSyntaxOn
\NewDocumentEnvironment{wodtable}{O{!ht} O{raggedright}mm} % define wodtable environment
{
	\table[#1]
	\captionsetup{format=plain, font=it, justification=#2, singlelinecheck=off, skip=6pt}
	\ifstrequal{#2}{centering}{\centering}{}
	\caption{#4}
	\label{#3}
}
{
	\endtable
}
\ExplSyntaxOff

\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}

\newcommand{\wodoutline}{\vrule width 1.5pt} % Thick vrule macro

\newcommand{\wodtoprule}{\specialrule{1.5pt}{0pt}{0pt}} % Rule macros
\newcommand{\wodmidrule}{\specialrule{0.4pt}{0pt}{0pt}}
\newcommand{\wodbottomrule}{\specialrule{1.1pt}{0pt}{0pt}} %1.5pt - 0.4pt (\wodtablerow) = 1.1pt

\newcommand{\wodtablehead}[1] % Table header macro
{%
	#1\tabularnewline%
	\wodtoprule%
}

\newcommand{\wodtablerow}[1] % Table row macro
{%
	#1\tabularnewline%
	\wodmidrule%
}

\newcommand{\wodtablerowspan}[3] % Table row macro that spans all columns in the table.
{
	\multicolumn{#1}{!{\wodoutline}#2!{\wodoutline}}{#3}\tabularnewline
	\wodmidrule
}

\newcommand{\wodmulticolumn}[3] % Table row macro that spans selected columns in the table.
{
	\multicolumn{#1}{#2|}{#3}
}

\newcommand{\wodmulticolumnright}[3] % Table row macro that spans selected columns in the table.
{
	\multicolumn{#1}{#2!{\wodoutline}}{#3}
}

\newcommand{\wodmulticolumnleft}[3] % Table row macro that spans selected columns in the table.
{
	\multicolumn{#1}{!{\wodoutline}#2|}{#3}
}

\newcommand{\wodmulticolumnboth}[3] % Table row macro that spans selected columns in the table.
{
    \multicolumn{#1}{!{\wodoutline}#2!{\wodoutline}}{#3}
}
%---------

%---------
% TABULAR
\newenvironment{wodtabular}[1]
{%
	\begingroup%
	\setlength{\tabcolsep}{4pt}%
	\fontsize{8pt}{8pt}\selectfont%
	\renewcommand*{\arraystretch}{1.4}%
	\begin{tabular}{!{\wodoutline} #1 !{\wodoutline}}%
	\wodtoprule%
}
{%
	\wodbottomrule%
	\end{tabular}%
	\endgroup%
}
%---------

%---------
% TABULARX
\NewEnviron{wodtabularx}[2]{%
 \begingroup%
 \setlength{\tabcolsep}{4pt}%
 \fontsize{8pt}{8pt}\selectfont%
 \renewcommand*{\arraystretch}{1.4}%
 \tabularx{#1}{!{\wodoutline} #2 !{\wodoutline}}%
 \wodtoprule%
 \BODY%
 \wodbottomrule%
}[\endtabularx\endgroup]
%---------

%---------
% TEXT
\makeatletter
\newcommand*{\wodoverline}[1]{$\overline{\hbox{#1}}\m@th$}
\makeatother

\makeatletter
\newcommand*{\wodunderline}[1]{\uline{#1}}
\makeatother

\newcommand{\wodst}[1]{\texorpdfstring{\st{#1}}{#1}}

\newcommand{\wodstrikethrough}[1]{\wodst{#1}}
%---------

%---------
% TEXT LABEL
\makeatletter%
\newcommand*{\wodtextlabel}[2]{%
  \protected@write \@auxout{}{\string\newlabel{#1}{{#2}{\thepage}{#2}{#1}{}}}%
  #2\Hy@raisedlink{\hypertarget{#1}{}}%
}%
\newcommand*{\wodsilenttextlabel}[2]{%
  \protected@write \@auxout{}{\string\newlabel{#1}{{#2}{\thepage}{#2}{#1}{}}}%
  \Hy@raisedlink{\hypertarget{#1}{}}%
}%
\makeatother%
%---------

%---------
% TOC
\newcommand\wodtableofcontents
{%
	\begingroup
		\titleformat{name=\chapter, numberless}
		{\vspace{0.45cm}\Large\bf\filcenter}
		{}
		{0pt}
		{}
		[\vspace{3pt}]
		\tableofcontents
	\endgroup
	\newpage
}

\newcommand{\wodlistoffigures}
{%
	\begingroup
		\titleformat{name=\chapter, numberless}
		{\vspace{0.52cm}\Large\bf\filcenter}
		{}
		{0pt}
		{}
		[\vspace{3pt}]
		\let\clearpage\relax
		\listoffigures
	\endgroup
}

\newcommand{\wodlistoftables}
{%
	\begingroup
	\let\clearpage\relax
	\listoftables
	\endgroup
}

\renewcommand{\cftfigfont}{\sc}
\renewcommand{\cfttabfont}{\sc}
\renewcommand{\cftchapfont}{\sc\bfseries}
\renewcommand{\cftsecfont}{\sc}
\renewcommand{\cftsubsecfont}{\sc\itshape}

\setlength\cftfignumwidth{3em}
\setlength\cfttabnumwidth{3em}
\setlength\cftsecnumwidth{3em}
\setlength\cftsubsecnumwidth{3em}
\setlength\cftsubsubsecnumwidth{3em}

\cftsetindents{chapter}{0em}{1.5em}
\cftsetindents{section}{1.5em}{3em}
\cftsetindents{subsection}{4.5em}{3em}

\renewcommand{\cftfigdotsep}{1.0}
\renewcommand{\cfttabdotsep}{1.0}
\renewcommand{\cftchapdotsep}{1.0}
\renewcommand{\cftsecdotsep}{1.0}
\renewcommand{\cftsubsecdotsep}{1.0}
\renewcommand{\cftsubsubsecdotsep}{1.0}
\renewcommand{\cftfigleader}{\cftdotfill{\cftfigdotsep}}
\renewcommand{\cfttableader}{\cftdotfill{\cfttabdotsep}}
%---------

%---------
% TOOL
\makeatletter
\newcommand{\ifequalstr}[2]{%
  \ifnum\wodfstrcmp{#1}{#2}=\z@
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi}
\makeatother
%---------
