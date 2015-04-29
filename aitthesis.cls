% aitthesis DOCUMENT STYLE -- Version 2.22 Released 21 July 1993
% aitthesis DOCUMENT STYLE -- Version 2.21 Released 5 July 1991
% aitthesis DOCUMENT STYLE -- Version 2.2 Released 20 November 1990
% aitthesis DOCUMENT STYLE -- Version 2.1 Released 20 June 1989
% Adapted from report.sty for LaTeX version 2.09
% Copyright (C) 1985 by Leslie Lamport
%
% Change History:
%   1)  fixed roman numeral problem in list of tables 28 Feb 1989 --- RLO
%   2)  eliminated extra spacing at top of References section 3 May 1989 --- RLO
%   3)  Fixed problem with two line chapter titles in table of contents
%	where the second line did not indent properly. This problem
%	only appeared  with versions of latex after the 4 Aug 88 release.
%       -p cantrell june 20, 1989
%   4)  Caption text set to be \def\captionspace{\baselineskip=18pt}. 
%       --Ken 4-20-90
%   5)  In \listoffigures(\listoftables) the space between figure(table) line is
%       doublespaced, however, the space inside figure(table) line is \tocspace.
%       --Ken 5-28-90
%   6)  The numbers of 'TABLE OF CONTENTS', 'LIST OF FIGURES', and 'LIST OF 
%       TABLES' in tableofcontents, listoffigures, and listoftables can be 
%       switched to be lined up to right hand side of the box. The default is
%       lined up to the left hand side of the box, the command for switching to 
%       be lined up to the right hand side of the box is \tocnumflushright. 
%       The box of the number may be too samll, 
%       the user can set the width of the box by setting \fignumbox to the 
%       number the user thinks that is right (the default is 4em).
%       --Todd and Ken. 6-5-90
%    7) newcommand \longcaption{sentence 1}{rest of caption}
%       only 'sentence 1' will be written to the lof/lot as appropriate.
%       'sentence 1' and 'rest of caption' will be written together to the
%       figure/table caption.
%       --Todd 
%    8) Multiline Fig/Tab captions shown as following
%       
%       Fig. ##.  Long caption ....
%                 Start of second line ...
%                 Statr of Third line ...
%                 etc.
%       --Todd
%   9)  Put more sapce for Chapter headings before start of text.
%       --Todd
%  10)  The first paragraph indented for section and subsection.
%       --Todd
%  11)  Improve to set the title on the abstract page
%       --Todd
%  12)  Include doublespace.sty from Jean-Francois Lamy, and make the single 
%       space in tabbing and tabular environment possible. It is simply write
%       as following.
%       \begin{sspace} 
%        \begin{tabbing}(or \begin{tabular})
%         \foo
%         \foo
%        \end{tabular}(or \end{tabular}
%       \end{sspace}
%       For normal text just type \singlespace to switch to single spaced 
%       contents, if it does not work, then try use \sspace environment.
%       --Ken 7-16-90 
%  13)  Blueline emulating. If you want the blueline emulating alive, just
%       type \blueline, and then there will generate a frame similar to blue
%       line in every page.  
%       --Ken 7-24-90
%  14)  verbatimfiles, this macro is adopted from Chris Rowley. It can include
%       code that the thesis either in the text or in the appendix. 
%       \verbatimfile{<filename>}    for verbatim inclusion of a file
%       \verbatimlisting[n]{<filename>} for verbatim inclusion
%                                       with line numbers every nth line
%       --Ken 7-24-90
%  15)  Originally when \ref chapter, section, or subsection, the \label
%       always generate 'chapter.', 'section.' and 'subsection.'. In this
%       version, the '.' is gone.
%       --Ken 7-24-90 
%  16)  Table of Contents would violate the blue line at the bottom
%	of the page if certain letters were used on the lower most
%	line such as 'g' or 'q'.  Removed some of the space between
%	lines of the table of contents to compress vertically the
%	text.  This was accomplished by changing the
%       \vspace*{-1em} to \vspace*{-2em}.
%	--John Hermann 4-22-93
%  17)	Reduced the length of the line used by footnotes to separate
%	the footnote from the text.  This was done so that the 10
%	character length requirement for the first footnote was
%	satisfied as specified by the thesis manual.
%	--John Hermann (jkh) 3-29-93
%  18)  The \parindent variable was changed from 20pt to 25pt in the
%       \verbatimlisting function.
%	--John Hermann 4-22-93
%  19)  The signature(approval) page has been modified based on
%	the OGS Thesis Manual version July 1992. This modification is
%	made in the eethetitle.sty file.
%	--Wen-Lin Hsieh 7-21-1993
%  20)  REFERENCES, APPENDEX, and VITA are flushed left to be aligned
%       with the CHAPTER column in the Table of Contents.
%       --Wen-Lin Hsieh 8-19-1993
%  21)  Add \@removefromreset to prevent figure and table counter
%     from been reset by New chapters.  -- Wen-Lin Hsieh 12-8-1994
%  22)  Add \DeclareOption......
%           \ProcessOptions....
%         \LoadClass.....      to make aitthesis a "class" file
%     -- Wen-Lin Hsieh   12-8-1994

%\typeout{Document Style 'report'.  Released 23 September 1985}
%\typeout{Document Style 'aitthesis'.  Ver. 2.1 Released 20 June 1989}
%\typeout{Document Style 'aitthesis'.  Ver. 2.2 Released 20 November 1990}
%\typeout{Document Style 'aitthesis'.  Ver. 2.21 Released 5 July 1991}
%\typeout{Document Style 'aitthesis'.  Ver. 2.3 Released 21 July 1993}
%\typeout{Document Class 'aitthesis'.  Ver. 2.5, Fall 1996}

% ---------- identification ----------
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{aitthesis}[2006/04/25 Asian Institute of Technology Thesis Class]
% ---------- initial code ----------
\newcommand{\pt@size}{}	% \@ptsize declared in report.cls so using \pt@size
% ---------- declaration of options ----------
\DeclareOption{draft}{\setlength{\overfullrule}{5pt}%
 \PassOptionsToClass{\CurrentOption}{report}}
\DeclareOption{final}{\setlength{\overfullrule}{0pt}%
 \PassOptionsToClass{\CurrentOption}{report}}
\DeclareOption{twoside}{\@twosidetrue	\@mparswitchtrue%
 \PassOptionsToClass{\CurrentOption}{report}}
%  Only letter size paper acceptable
\DeclareOption{legalpaper}{%
 \ClassWarningNoLine{aitthesis}{'legalpaper' option not acceptable (defaulting to 'a4paper')}%
 \PassOptionsToClass{a4paper}{report}}
\DeclareOption{executivepaper}{%
 \ClassWarningNoLine{aitthesis}{'executivepaper' option not acceptable (defaulting to 'a4paper')}%
 \PassOptionsToClass{a4paper}{report}}
\DeclareOption{letterpaper}{%
 \ClassWarningNoLine{aitthesis}{'letterpaper' option not acceptable (defaulting to 'a4paper')}%
 \PassOptionsToClass{a4paper}{report}}
\DeclareOption{a5paper}{%
 \ClassWarningNoLine{aitthesis}{'a5paper' option not acceptable (defaulting to 'a4paper')}%
 \PassOptionsToClass{a4paper}{report}}
\DeclareOption{b5paper}{%
 \ClassWarningNoLine{aitthesis}{'b5paper' option not acceptable (defaulting to 'a4paper')}%
 \PassOptionsToClass{a4paper}{report}}
%  In aitthesis of only 12pt is available.
\DeclareOption{12pt}{\renewcommand{\pt@size}{12}%
 \PassOptionsToClass{\CurrentOption}{report}}
\DeclareOption{10pt}{%
 \ClassWarningNoLine{aitthesis}{'10pt' option not supported (defaulting to 12pt)}%
 \PassOptionsToClass{10pt}{report}}
\DeclareOption{11pt}{%
 \ClassWarningNoLine{aitthesis}{'11pt' option not supported (defaulting to 12pt)}%
 \PassOptionsToClass{11pt}{report}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
% ---------- execution of options ----------
\ExecuteOptions{12pt,final}
\ProcessOptions
% ---------- package loading ----------
\LoadClass{report}

% The relational style files are eethe12.sty and eethetitle.sty.
\InputIfFileExists{aitfont\pt@size.sty}{}{%
 \ClassError{aitthesis}{aitfont\pt@size.sty file required.}}

%%%\InputIfFileExists{eethe\pt@size.sty}{}{%
%%% \ClassError{aitthesis}{eethe\pt@size.sty file required.}}
 
%%%%%  Remove figure and table counter reset by new chapters,
%%%%%  12/8/1994

\def\@removefromreset#1#2{{%
 \def\rmv@ctr{#1}%
 \def\rmv@lst{}%
 \let\@elt\relax
 \expandafter\expandafter\expandafter\rem@res\csname 
cl@#2\endcsname\@nil\@nil
 \global\expandafter\let\csname cl@#2\endcsname\rmv@lst
}}

\def\rem@res#1#2{%
 \def\@tmp{#2}%
 \ifx\@tmp\@nnil
 \else
   \ifx\@tmp\rmv@ctr
   \else
     \edef\rmv@lst{\rmv@lst\@elt{\@tmp}}%
   \fi
   \expandafter\rem@res
 \fi
}

%\@removefromreset{figure}{chapter}  % Toggle this to run general figure numbering 
%\@removefromreset{table}{chapter}

%    ****************************************
%    *                LISTS                 *
%    ****************************************
%

% ENUMERATE
%  Enumeration is done with four counters: enumi, enumii, enumiii
%  and enumiv, where enumN controls the numbering of the Nth level
%  enumeration.  The label is generated by the commands \labelenumi
%  ... \labelenumiv.  The expansion of \p@enumN\theenumN defines the
%  output of a \ref command.

\renewcommand{\labelenumi}{\arabic{enumi}.}
\renewcommand{\theenumi}{\arabic{enumi}}

\renewcommand{\labelenumii}{(\alph{enumii})}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\p@enumii}{\theenumi}

\renewcommand{\labelenumiii}{\roman{enumiii}.}
\renewcommand{\theenumiii}{\roman{enumiii}}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}

\renewcommand{\labelenumiv}{\Alph{enumiv}.}
\renewcommand{\theenumiv}{\Alph{enumiv}}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}

% ITEMIZE
% Itemization is controlled by four commands: \labelitemi, \labelitemii,
% \labelitemiii, and \labelitemiv, which define the labels of the various
% itemization levels.

\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{\bf --}
\renewcommand{\labelitemiii}{$\ast$}
\renewcommand{\labelitemiv}{$\cdot$}


% VERSE
%   The verse environment is defined by making clever use of the
%   list environment's parameters.  The user types \\ to end a line.
%   This is implemented by \let'in \\ equal \@centercr.
%
\def\verse{\let\\=\@centercr
  \list{}{\itemsep\z@ \itemindent -1.5em\listparindent \itemindent
          \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist

% QUOTATION
%   Fills lines
%   Indents paragraph
%
\def\quotation{\list{}{\listparindent 1.5em
    \itemindent\listparindent
    \rightmargin\leftmargin\parsep 0pt plus 1pt}\item[]}
\let\endquotation=\endlist

% QUOTE -- same as quotation except no paragraph indentation,
%
\def\quote{\list{}{\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist

% DESCRIPTION
%
%  To change the formatting of the label, you must redefine
%  \descriptionlabel.

\def\descriptionlabel#1{\hspace\labelsep \bf #1}
\def\description{\list{}{\labelwidth\z@ \itemindent-\leftmargin
       \let\makelabel\descriptionlabel}}

\let\enddescription\endlist

\newdimen\descriptionmargin
\descriptionmargin=3em


%    ****************************************
%    *         OTHER ENVIRONMENTS           *
%    ****************************************
%
%
% THEOREM
% \@begintheorem ... \@endtheorem are the commands executed at the
% beginning and end of a (user-defined) theorem-like environment.
% Except \@opargbegintheorem is executed when an optional argument is
% given.  Cf. LATEX.TEX.
%
% \def\@begintheorem#1#2{\it \trivlist \item[\hskip \labelsep{\bf #1\ #2}]}
% \def\@opargbegintheorem#1#2#3{\it \trivlist
%       \item[\hskip \labelsep{\bf #1\ #2\ (#3)}]}
% \def\@endtheorem{\endtrivlist}


% TITLEPAGE
%  In the normal environments, the titlepage environment does nothing but
%  start and end a page, and inhibit page numbers.  It also resets the
%  page number to zero.  In two-column style, it still makes a one-column
%  page.
\def\titlepage{
     \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
     \else \newpage \fi \thispagestyle{empty}\c@page\z@}

\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

% ARRAY AND TABULAR
%

\setlength{\arraycolsep}{5pt}     % Half the space between columns in an array environment.
\setlength{\tabcolsep}{6pt}       % Half the space between columns in a tabular environment.
\setlength{\arrayrulewidth}{.4pt} % Width of rules in array and tabular environment.
\setlength{\doublerulesep}{2pt}   % Space between adjacent rules in array or tabular env.

% TABBING
%
\tabbingsep \labelsep   % Space used by the \' command.  (See LaTeX manual.)

% MINIPAGE
%  \@minipagerestore is called upon entry to a minipage environment to
%  set up things that are to be handled differently inside a minipage
%  environment. In the current styles, it does nothing.
%
% \skip\@mpfootins : plays same role for footnotes in a minipage as
%                    \skip\footins does for ordinary footnotes

\skip\@mpfootins = \skip\footins

% FRAMEBOX
%
\setlength{\fboxsep}{3pt}    % Space left between box and text by \fbox and \framebox.
\setlength{\fboxrule}{.4pt}  % Width of rules in box made by \fbox and \framebox.


%    ****************************************
%    *        CHAPTERS AND SECTIONS         *
%    ****************************************
%
% DEFINE COUNTERS:
%
% \newcounter{NEWCTR}[OLDCTR] : Defines NEWCTR to be a counter, which is
%                               reset to zero when counter OLDCTR is stepped.
%                               Counter OLDCTR must already be defined.

%\newcounter{part}
%\newcounter {chapter}
%\newcounter {section}[chapter]
%\newcounter {subsection}[section]
%\newcounter {subsubsection}[subsection]
%\newcounter {paragraph}[subsubsection]
%\newcounter {subparagraph}[paragraph]
%
% thesis mod
\newcounter {appendix}
\newcounter {sucount}		% counter for supplemental sources
%
% For any counter CTR, \theCTR is a macro that defines the printed version
% of counter CTR.  It is defined in terms of the following macros:
%
%  \arabic{COUNTER} : The value of COUNTER printed as an arabic numeral.
%  \roman{COUNTER}  : Its value printed as a lower-case roman numberal.
%  \Roman{COUNTER}  : Its value printed as an upper-case roman numberal.
%  \alph{COUNTER}   : Value of COUNTER printed as a lower-case letter:
%                         1 = a, 2 = b, etc.
%  \Alph{COUNTER}   : Value of COUNTER printed as an upper-case letter:
%                           1 = A, 2 = B, etc.
%

%\def\thepart          {\Roman{part}}
%\def\thechapter       {\arabic{chapter}}
%\def\thesection       {\thechapter.\arabic{section}}
%\def\thesubsection    {\thesection.\arabic{subsection}}
%\def\thesubsubsection {\thesubsection.\arabic{subsubsection}}
%\def\theparagraph     {\thesubsubsection.\arabic{paragraph}}
%\def\thesubparagraph  {\theparagraph.\arabic{subparagraph}}
%
% old aitthesis mod
%\def\thepart          {\Roman{part}.}
%\def\thechapter       {\Roman{chapter}}
%\def\thesection       {\Alph{section}.}
%\def\thesubsection    {\arabic{subsection}.}
%\def\thesubsubsection {\alph{subsubsection}.}
%\def\theparagraph     {\null}
%\def\thesubparagraph  {\null}
%\def\theappendix      {\Alph{appendix}}
%
% thesis mod
%\renewcommand{\thepart}          {\Roman{part}.}
%\renewcommand{\thechapter}       {\arabic{chapter}}
%\renewcommand{\thesection}       {\arabic{section}}
%\renewcommand{\thesubsection}    {\arabic{subsection}}
%\renewcommand{\thesubsubsection} {\arabic{subsubsection}}
\renewcommand{\theparagraph}     {\null}
\renewcommand{\thesubparagraph}  {\null}
\renewcommand{\theappendix}      {\Alph{appendix}}

%
% when ref section(subsection and subsubsection) there is no '.' generated after
% section number any more.   Ken 6-29-90
%
\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth
     \def\@svsec{}\else 
     \refstepcounter{#1}\edef\@svsec{\csname the#1\endcsname\hskip 1em }\fi
     \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@ 
        \begingroup #6\relax
          \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}
        \endgroup
       \csname #1mark\endcsname{#7}\addcontentsline
         {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                      \protect\numberline{\csname the#1\endcsname}\fi
                    #7}\else
        \def\@svsechd{#6\hskip #3\@svsec #8\csname #1mark\endcsname
                      {#7}\addcontentsline
                           {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                             \protect\numberline{\csname the#1\endcsname}\fi
                       #7}}\fi
     \@xsect{#5}}

% \@chapapp is initially defined to be 'Chapter'.  The \appendix
% command redefines it to be 'Appendix'.
%
\def\@chapapp{\large{Chapter}}



%    ****************************************
%    *         TABLE OF CONTENTS, ETC.      *
%    ****************************************
%
% A \subsection command writes a
%       \contentsline{subsection}{TITLE}{PAGE}
% command on the .toc file, where TITLE contains the contents of the
% entry and PAGE is the page number.  If subsections are being numbered,
% then TITLE will be of the form
%       \numberline{NUM}{HEADING}
% where NUM is the number produced by \thesubsection.  Other sectioning
% commands work similarly.
%
% A \caption command in a 'figure' environment writes
%    \contentsline{figure}{\numberline{NUM}{CAPTION}}{PAGE}
% on the .lof file, where NUM is the number produced by \thefigure and
% CAPTION is the figure caption.  It works similarly for a 'table' environment.
%
% The command \contentsline{NAME} expands to \l@NAME.  So, to specify
% the table of contents, we must define \l@chapter, \l@section,
% \l@subsection, ... ; to specify the list of figures, we must define
% \l@figure; and so on.  Most of these can be defined with the
% \@dottedtocline command, which works as follows.
%
% \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE}
%    LEVEL    : An entry is produced only if LEVEL < or = value of
%               'tocdepth' counter.  Note, \chapter is level 0, \section
%               is level 1, etc.
%    INDENT   : The indentation from the outer left margin of the start of
%               the contents line.
%    NUMWIDTH : The width of a box in which the section number is to go,
%               if TITLE includes a \numberline command.
%
% This command uses the following three parameters, which are set
% with a \def (so em's can be used to make them depend upon the font).
%   \@pnumwidth : The width of a box in which the page number is put.
%   \@tocrmarg  : The right margin for multiple line entries.  One
%                 wants \@tocrmarg > or = \@pnumwidth
%   \@dotsep    : Separation between dots, in mu units.  Should be \def'd to
%                 a number like 2 or 1.7

\def\@pnumwidth{1.5em}
\def\@tocrmarg{4.5em}
\def\@dotsep{250}   % Decrease the number in parentheses to make dots appears. 
\setcounter{tocdepth}{1}  % Depth of Table of Contents


% TABLEOFCONTENTS
%  In report style, \tableofcontents, figures, etc. are always
%  set in single-column style.  @restonecol

\newdimen\toddhack
\newdimen\twoem \twoem 0em
\newdimen\zeroem \zeroem 0em
\newdimen\fignumbox \fignumbox 4em

\def\tocnumflushright{
\twoem 2em
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   The justification of the chapter heads is on the left side instead of
%   the right
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   The macro below controls how the box is formed.  
%\def\numberline#1{\hbox to\@tempdima{#1\hfil}}
\def\numberline##1{\hbox to\@tempdima{\hfil##1\hskip 2ex\hskip \toddhack}}

%
%   these control the spacing from the left margin
%   #1 is the indentation level at which an entry is produced in the toc file
%   #2 is the total indentation from the left margin
%   #3 is the width of the box containing the chapter/section number
%

\def\l@section{\@dottedtocline{1}{4em}{2.0em}}
\def\l@subsection{\@dottedtocline{2}{6em}{2.0em}}
\def\l@subsubsection{\@dottedtocline{3}{8.0em}{2.0em}}
\def\l@paragraph{\@dottedtocline{4}{6em}{2.0em}}
\def\l@subparagraph{\@dottedtocline{5}{8em}{2.0em}}

\def\l@chapter##1##2{\pagebreak[3]
\vskip 0.75em plus 1pt %%%%%% 1 em seems too large, 
                       %%%%%% change to 0.75em; by Ken 7-8-91
{\leftskip 0em\relax \rightskip \@tocrmarg \parfillskip -\rightskip
\parindent 0em\relax\@afterindenttrue
\interlinepenalty\@M
\leavevmode
\@tempdima 4em \toddhack 1em \relax
\advance\leftskip \@tempdima \hbox{}\hskip -\leftskip
%\uppercase{ ##1}\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern
 ##1\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern
\@dotsep mu$} \hfill \nobreak \hbox to\@pnumwidth{\hfil\rm ##2}\par}

\vskip 0.5em plus 1pt\toddhack 0em}} %%% change 1 em to 0.5em; by Ken 7-8-91.

\def\tableofcontents{
\newpage
   \let \tempp \topskip
   \topskip 1em
%  \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
% thesis mod
\tocspace
%
%  \chapter*{TABLE OF CONTENTS\markright{CONTENTS}}
% thesis mod
  \chapter*{\vspace*{-1em}\large Table of Contents\markright{Chapter}} % change -1em to -2em ; by jkh(16) 4-22-1993
  {\vskip 1em \hspace{3pt} \bf Chapter\hfill \bf Title \hfill \hfill \hfill \hfill \hfill\hfill \hfill\hfill \hfill \hfill \hfill \hfill \bf Page\\}
  \thispagestyle{plain}
%
  \@starttoc{toc}
%  \if@restonecol\twocolumn\fi}
% thesis mod
  %\textsc{\doublespace}  
  \topskip \tempp}
%
%\def\l@part#1#2{\addpenalty{-\@highpenalty}
%   \addvspace{2.25em plus 1pt}  % space above part line
%   \begingroup
%   \@tempdima 3em         % width of box holding part number, used by
%     \parindent \z@ \rightskip \@pnumwidth             %% \numberline
%     \parfillskip -\@pnumwidth
%     {\large \bf          % set line in \large boldface
%     \leavevmode          % TeX command to enter horizontal mode.
%     #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
%     \nobreak             % Never break after part entry
%   \endgroup}
%
% thesis mod
\def\l@part#1#2{\pagebreak[3]
  \vskip 0.75em plus 1pt  % space above chapter line
                          %% change 1 em to 0.75em; by Ken 7-8-91.
   \@tempdima 1.5em       % width of box holding chapter number
   \begingroup
     \parindent \z@ \rightskip \@pnumwidth
     \parfillskip -\@pnumwidth
     \leavevmode          % TeX command to enter horizontal mode.
     #1\dotfill \hbox to\@pnumwidth{\hss #2}\par
   \endgroup}

\def\l@chapter#1#2{\pagebreak[3]
   \vskip 0.75em plus 1pt   % space above chapter line
                            %% change 1 em to 0.75em; by Ken 7-8-91.
%   \@tempdima 1.55em       % width of box holding chapter number
% thesis mod
%	this section is adapted from def of \@dottedtocline
% change hangindent in next line to 
%  leftskip 6-20-89 to work with later latex changes

    % Kan's chanage \leftskip 2em to \leftskip 2.3em
    {\leftskip 2.3em\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent 2em\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima 4em\relax       % width of box holding chapter number
% change 6-20-89
    \advance\leftskip \@tempdima \hbox{}\hskip -\leftskip
% end 6-20-89
   %  \uppercase{#1}\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern 
     #1\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern 
       \@dotsep mu$}\hfill \nobreak \hbox to\@pnumwidth{\hfil\rm #2}\par}
    \vskip 0.5em plus 1pt}  % space below chapter line
                            %% change 1 em to 0.5em; by Ken 7-8-91.
%
%   \begingroup
%     \parindent \z@ \rightskip \@pnumwidth
%     \parfillskip -\@pnumwidth
%     \bf                  % Boldface.
%     \leavevmode          % TeX command to enter horizontal mode.
%     #1\hfil \hbox to\@pnumwidth{\hss #2}\par
%
%
%   \endgroup}

%\def\l@section{\@dottedtocline{1}{1.55em}{2.3em}}
%\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
%\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
%\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
%\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
%
% thesis mod
\def\l@section{\@dottedtocline{1}{6.35em}{2em}}
\def\l@subsection{\@dottedtocline{2}{8.35em}{2.8em}}
\def\l@subsubsection{\@dottedtocline{3}{11em}{3.5em}}
\def\l@paragraph{\@dottedtocline{4}{13em}{3em}}
\def\l@subparagraph{\@dottedtocline{5}{14em}{1.5em}}
%
%LIST OF FIGURES
%
%\def\listoffigures{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
%  \fi\chapter*{LIST OF FIGURES\markboth
%   {LIST OF FIGURES}{LIST OF FIGURES}}\@STARTTOC{lof}\if@restonecol\twocolumn
%  \fi}
%
% thesis mod
\def\listoffigures{\tocspace   % \tocspace for \listoffigures, Ken 5-28-90
   \let \tempp \topskip
   \topskip 1em
   \chapter*{\large List of Figures\markright{Figure}}
    {\vskip 1em \hspace{5pt} \bf Figure\hfill\hspace{9pt}\bf Title \hfill \hfill \hfill \hfill \hfill\hfill \hfill\hfill \hfill \hfill \hfill \hfill \bf Page\\}
   \thispagestyle{plain}
     \toddhack \twoem
    \@starttoc{lof}\if@restonecol\twocolumn
     \toddhack \zeroem
   \fi\topskip \tempp} %\doublespace}
%
%\def\l@figure{\@dottedtocline{1}{0em}{5em}}
%%%%
%%%%
%%%% Inside the figure line is \tocspaced (16pt)
%%%% Between the figureline is 1.0em
%%%% Revised by Ken, 5-28-90
%%%% 
%%%%
   %\begin
\def\l@figure#1#2{\pagebreak[3]
   \vskip .1em plus 1pt  % space above figure line
     {\leftskip 1.5em\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent 1.5em\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode               
     \@tempdima 5em\relax       % width of box holding figure number
                                       % \fignumbox default to 4em
     \advance\leftskip \@tempdima \hbox{}\hskip -\leftskip
       #1\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern 
       \@dotsep mu$}\hfill \nobreak \hbox to\@pnumwidth{\hfil #2}\par}
   \vskip .01em plus 0.1pt}  % space below figure line
    %\end

% LIST OF TABLES
%
%\def\listoftables{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
%  \fi\chapter*{LIST OF TABLES\markboth
%   {LIST OF TABLES}{LIST OF TABLES}}\@starttoc{lot}\if@restonecol\twocolumn
%  \fi}
% thesis mod
\def\listoftables{\tocspace
   \let \tempp \topskip
   \topskip 1em
   \chapter*{\vspace*{-1em}\large List of Tables\markright{Table}}
  {\vskip 1em \hspace{8pt} \bf Table\hfill\hspace{11pt}\bf Title \hfill \hfill \hfill \hfill \hfill\hfill \hfill\hfill \hfill \hfill \hfill \hfill \bf Page\\}
   \thispagestyle{plain}
     \toddhack \twoem
    \@starttoc{lot}\if@restonecol\twocolumn
     \toddhack \zeroem
   \fi\topskip \tempp}% \doublespace}
%
\let\l@table\l@figure



%    ****************************************
%    *             BIBLIOGRAPHY             *
%    ****************************************
%
%
%  \def\newblock{\hskip .11em plus .33em minus -.07em} --
%      Defines the `closed' format, where the blocks (major units of
%      information) of an entry run together.
%
%  \sloppy  -- Used because it's rather hard to do line breaks in
%      bibliographies,
%
%  \sfcode`\.=1000\relax --
%      Causes a `.' (period) not toproduce an end-of-sentence space.

\def\thebibliography#1{
%\addcontentsline{toc}{section}{\null\hspace{-2em}REFERENCES} % 8-19-1993

\addcontentsline{toc}{chapter}{ \hskip 4em References} % 8-19-1993

%							     % 4em -> -2em 
% Modification to eliminate extra space 5-3-89   --- RLO
%\chapter*{REFERENCES\markboth{REFERENCES}{REFERENCES}}\list
\vskip .2truein
\centerline{\bf REFERENCES(Draft)}
\bigskip
\list    % ******* LOST FOR SOME REASON, BUT RECOVERED  RIGHT NOW ****** 
%
  {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumi}}
    \def\newblock{\hskip .11em plus .33em minus -.07em}
    \sloppy
    \sfcode`\.=1000\relax}

\let\endthebibliography=\endlist

% \def\@biblabel#1{[#1]\hfill}  % Produces the label for a \bibitem[...]
                                % command.
% \def\@cite#1{[#1]}            % Produces the output of the \cite command.



%    ****************************************
%    *              THE INDEX               *
%    ****************************************
%
% THE THEINDEX ENVIRONMENT
% Produces double column format, with each paragraph a separate entry.
% The user commands \item, \subitem and \subsubitem are used to
% produce the entries, and \indexspace adds an extra vertical space
% that's the right size to put above the first entry with a new letter
% of the alphabet.

\newif\if@restonecol

\def\theindex{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
\columnseprule \z@
\columnsep 35pt\twocolumn[\@makeschapterhead{Index}]
    \markboth{INDEX}{INDEX}\thispagestyle{myheadings}\parindent\z@
    \parskip\z@ plus .3pt\relax\let\item\@idxitem}

\def\@idxitem{\par\hangindent 40pt}

\def\subitem{\par\hangindent 40pt \hspace*{20pt}}

\def\subsubitem{\par\hangindent 40pt \hspace*{30pt}}

\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}

\def\indexspace{\par \vskip 10pt plus 5pt minus 3pt\relax}


%    ****************************************
%    *             FOOTNOTES                *
%    ****************************************
%
% \footnoterule is a macro to draw the rule separating the footnotes from
% the text.  It should take zero vertical space, so it needs a negative
% skip to compensate for any positive space taken by the rule.  (See
% PLAIN.TEX.)

%  Paper format footnote separating line on first page of body must be 10 chars.
%  Therefore, changed the hrule below from .4 to .125
%  John Hermann (jkh(17)) March 27, 1993
\def\footnoterule{\kern-1\p@
  \hrule width .4\columnwidth
  \kern .6\p@}                 % The \hrule has default height of .4pt .

% \newcounter{footnote}
\@addtoreset{footnote}{chapter}  % Numbers footnotes within chapters

%   \@makefntext{NOTE} :
%        Must produce the actual footnote, using \@thefnmark as the mark
%        of the footnote and NOTE as the text.  It is called when effectively
%        inside a \parbox of width \columnwidth (i.e., with \hsize =
%        \columnwidth).
%
%        The following macro indents all lines of the footnote by 10pt, and
%        indents the first line of a new paragraph by 1em.  To change these
%        dimensions, just substitute the desired value for '10pt' [in both
%        places] or '1em'.  The mark is flushright against the footnote.
%          \long\def\@makefntext#1{\@setpar{\@@par\@tempdima \hsize
%             \advance\@tempdima-10pt\parshape \@ne 10pt \@tempdima}\par
%             \parindent 1em\noindent \hbox to \z@{\hss$^{\@thefnmark}$}#1}
%
%        A simpler macro is used, in which the footnote text is
%        set like an ordinary text paragraph, with no indentation except
%        on the first line of a paragraph, and the first line of the
%        footnote.  Thus, all the macro must do is set \parindent
%        to the appropriate value for succeeding paragraphs and put the
%        proper indentation before mark.

\long\def\@makefntext#1{\parindent 1em\noindent
            \hbox to 1.5em{\hss$^{\@thefnmark}$}#1}
%
% thesis mod
%\long\def\@makefntext#1{\@setpar{\@@par\@tempdima \hsize
 % \advance\@tempdima-10pt\parshape \@ne 10pt \@tempdima}\par
 % \parindent 1em\noindent \hbox to z@{\hss$^{\@thefnmark}$}#1}
%
% \@makefnmark : A macro to generate the footnote marker that goes
%    in the text.  Default used.
%



%    ****************************************
%    *         FIGURES AND TABLES           *
%    ****************************************
%
% Float placement parameters.  See LaTeX manual for their definition.
%
\setcounter{topnumber}{2}
\renewcommand{\topfraction}{.7}
\setcounter{bottomnumber}{1}
\renewcommand{\bottomfraction}{.3}
\setcounter{totalnumber}{3}
\renewcommand{\textfraction}{.2}
\renewcommand{\floatpagefraction}{.5}
\setcounter{dbltopnumber}{2}
\renewcommand{\dbltopfraction}{.7}
\renewcommand{\dblfloatpagefraction}{.5}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Long Captions --  this is a slightly modified \caption to allow just
%                     the first sentence on a very long caption to be
%                     written on the lof/lot
%
%   \longcaption{sentence 1}{rest of caption}
%
%   only 'sentence 1' will be written to the lof/lot as appropriate.
%   'sentence 1' and 'rest of caption' will be written together to the
%   figure/table caption. --Todd
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%  \@dblarg{CMD}{ARG}  : \@dblarg{CMD}{ARG} expands to CMD[ARG]{ARG}.  Use
%                        \@dblarg\CS when \CS takes arguments [ARG1]{ARG2}, 
%                        where default is ARG1 = ARG2.
%
% \def\caption{\refstepcounter\@captype \@dblarg{\@caption\@captype}}


\def\longcaption{\refstepcounter\@captype \@longcaption\@captype}

\long\def\@longcaption#1#2#3{\par\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\protect\numberline{\csname 
  the#1\endcsname}{\ignorespaces #2}}\begingroup
    \@parboxrestore
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #2 #3}\par
  \endgroup}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Multiline Fig. captions --  calculated the width of "Fig. ##. "
%   and use that to indent the caption so all lines will allign under the
%   first letter of the caption rather than against the right margin.
%
%   Fig. ##.  Long caption ....
%             Start of second line....
%             third line ...  etc.
%   --Todd
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \@makecaption{NUMBER}{TEXT} : Macro to make a figure or table caption.
%      NUMBER : Figure or table number--e.g., 'Figure 3.2'
%      TEXT   : The caption text.
%  Macro should be called inside a \parbox of right width, with \normalsize.

\def\captionspace{\baselineskip=14pt} %%%%%%%%%%%%%%%%% 4-24-90
                                      %% \captionspace is added by Ken 4-20-90
\long\def\@makecaption#1#2{       
   \vskip 10pt 
   \setbox\@tempboxa\hbox{#1 #2}  %  
   \ifdim \wd\@tempboxa >\hsize   %  IF longer than one line:
      \captionspace               %   THEN measure the width of "Fig. ##. "
      \setbox\@tempboxa\hbox{#1}  %       we'll indent the entire TEXT portion
      \hangindent=\wd\@tempboxa   %       of the caption by this amount.
      \hangafter=0                %       The Fig. num. is typeset as a negative
                                  %       width hbox to cancel the \hangindent
                                  %       on the first line. This the only way
                                  %       I could line things up without
                                  %       messing with tex glue.
      \setbox\@tempboxa\hbox{\llap{#1 }#2}
      \unhbox\@tempboxa\par        %       set TEXT as an ordinary paragraph
      %\doublespace                % 
     \else                        %  ELSE  center.
       \hbox to\hsize{\hfil\box\@tempboxa\hfil}
   \fi}

% To define a float of type TYPE (e.g., TYPE = figure), the document style
% must define the following.
%
%  \fps@TYPE   : The default placement specifier for floats of type TYPE.
%
%  \ftype@TYPE : The type number for floats of type TYPE.  Each TYPE has
%                associated a unique positive TYPE NUMBER, which is a power
%                of two.  E.g.,  might have type number 1, tables type
%                number 2, programs type number 4, etc.
%
%  \ext@TYPE   : The file extension indicating the file on which the
%                contents list for float type TYPE is stored.  For example,
%                \ext@figure = 'lof'.
%
%  \fnum@TYPE  : A macro to generate the figure number for a caption.
%                For example, \fnum@TYPE == Figure \thefigure.
%
%  The actual float-making environment commands--e.g., the commands
%  \figure and \endfigure--are defined in terms of the macros \@float
%  and \end@float, which are described below.
%
%  \@float{TYPE}[PLACEMENT] : Macro to begin a float environment for a
%     single-column float of type TYPE with PLACEMENT as the placement
%     specifier.  The default value of PLACEMENT is defined by \fps@TYPE.
%     The environment is ended by \end@float.
%     E.g., \figure == \@float{figure}, \endfigure == \end@float.


% FIGURE

%\newcounter{figure}
%\@addtoreset{figure}{chapter}
%\def\thefigure{\@arabic\c@figure}
%
% thesis mod
%\renewcommand{\thefigure}{\@arabic\c@figure}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\small \textbf{Figure \thefigure :}}
\def\figure{\@float{figure}}
\let\endfigure\end@float
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}

% TABLE
%
%\newcounter{table}
%\@addtoreset{table}{chapter} 
%\def\thetable{\@arabic\c@table}
% thesis mod
%
%\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\small \textbf{Table \thetable :}}
\def\table{\@float{table}}
\let\endtable\end@float
\@namedef{table*}{\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}


%    ****************************************
%    *         TITLE AND ABSTRACT           *
%    ****************************************
%
%
% Uses same title and abstract format as the article style's
% titlepage option.

\InputIfFileExists{aittitle.sty}{}{%
 \ClassError{aitthesis}{aittitle.sty file required.}}
%%%\InputIfFileExists{eethetitle.sty}{}{%
%%% \ClassError{aitthesis}{eethetitle.sty file required.}}

%    ****************************************
%    *            PAGE STYLES               *
%    ****************************************
%
% The page style 'foo' is defined by defining the command \ps@foo.  This
% command should make only local definitions.  There should be no stray
% spaces in the definition, since they could lead to mysterious extra
% spaces in the output.
%
% The \ps@... command defines the macros \@oddhead, \@oddfoot,
% \@evenhead, and \@evenfoot to define the running heads and
% feet---e.g., \@oddhead is the macro to produce the contents of the
% heading box for odd-numbered pages.  It is called inside an \hbox of
% width \textwidth.
%
% To make headings determined by the sectioning commands, the page style
% defines the commands \chaptermark, \sectionmark, ... , where
% \chaptermark{TEXT} is called by \chapter to set a mark, and so on.
% The \...mark commands and the \...head macros are defined with the
% help of the following macros.  (All the \...mark commands should be
% initialized to no-ops.)
%
% MARKING CONVENTIONS:
% LaTeX extends TeX's \mark facility by producing two kinds of marks
% a 'left' and a 'right' mark, using the following commands:
%     \markboth{LEFT}{RIGHT} : Adds both marks.
%     \markright{RIGHT}      : Adds a 'right' mark.
%     \leftmark  : Used in the \@oddhead, \@oddfoot, \@evenhead or \@evenfoot
%                  macro, gets the current 'left'  mark.  Works like TeX's
%                  \botmark command.
%     \rightmark : Used in the \@oddhead, \@oddfoot, \@evenhead or \@evenfoot
%                  macro, gets the current 'right'  mark.  Works like TeX's
%                  \firstmark command.
% The marking commands work reasonably well for right marks 'numbered
% within' left marks--e.g., the left mark is changed by a \chapter command and
% the right mark is changed by a \section command.  However, it does
% produce somewhat anomalous results if two \bothmark's occur on the same page.
%

\mark{{}{}}   % Initializes TeX's marks

% \def\ps@empty{\def\@oddhead{}
%   \def\@oddfoot{}
%   \def\@evenhead{}\def\@evenfoot{}}
%
% \def\ps@plain{\def\@oddhead{}
%   \def\@oddfoot{\rm\hfil\thepage\hfil}
%   \def\@evenhead{}
%   \let\@evenfoot\@oddfoot}

% Definition of 'headings' page style
%  Note the use of ##1 for parameter of \def\chaptermark inside the
%  \def\ps@headings.
%

\def\@headmk{\vbox to 36pt{\hbox to \hsize{\hfil \rm\thepage} %Ken 11-16-90
                    \vskip 37pt 
		    \hbox to \hsize{\rightmark \hfil Page}}}
\if@twoside         % If two-sided printing.
\def\ps@headings{\def\@oddfoot{}\def\@evenfoot{}%       No feet.
%\def\@evenhead{\rm \thepage\hfil \sl \leftmark}%        Left heading.
%\def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}% Right heading.
\def\@evenhead{\vbox to 36pt{\hbox to \hsize{\rm\thepage \hfil} % Ken 11-16-90
                    \vskip 37pt 
		    \hbox to \hsize{\leftmark\hfil Page}}}
\def\@oddhead{\@headmk} %%%%%%%%%%%% Ken 11-16-90
\def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
      \@chapapp\ \thechapter. \ \fi ##1}}{}}%
\def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
   \thesection. \ \fi ##1}}}}
\else               % If one-sided printing.
\def\ps@headings{\def\@oddfoot{}\def\@evenfoot{}%     No feet.
%\def\@oddhead{\hbox {}\sl \rightmark \hfil \rm\thepage}% Heading.
%
% thesis mod
\def\@oddhead{\@headmk} %%%%%%%%%%%% Ken 11-16-90
%\def\@oddhead{\vbox to 36pt{\hbox to \hsize{\hfil \rm\thepage}
%                   \vskip 12pt
% For page number moving to between top edge and blue line the \vskip should
% be changed from 12 pt to 37pt. ******* K. C. 12-4-89 
%                    \vskip 37pt 
%		    \hbox to \hsize{\rightmark \hfil Page}}}
%
\def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
  \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi

% Definition of 'myheadings' page style.
%
% thesis mod - change necessary for headings on continued pages of toc, etc.
%
%\def\ps@myheadings{\def\@oddhead{\hbox{}\sl\rightmark \hfil \rm\thepage}%
\def\ps@myheadings{\def\@oddhead{\vbox to \headheight{\hbox to \hsize{\hfil 
				 \rm\thepage}\vfill}}
\def\@oddfoot{}\def\@evenhead{\rm \thepage\hfil\null\hbox {}}
%\sl\leftmark\hbox {}}%
\def\@evenfoot{}\def\sectionmark##1{}\def\subsectionmark##1{}}



%    ****************************************
%    *            MISCELLANEOUS             *
%    ****************************************
%
% DATE
%
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

% EQUATION and EQNARRAY -- put here because it must follow \chapter definition
% thesis mod
%
% \newcounter{equation}
%
\@addtoreset{equation}{chapter}   % Makes \chapter reset 'equation' counter.

\@addtoreset{equation}{appendix}   % Makes \appendix reset 'equation' counter.
				   % Wen-Lin Hsieh, 3/28/1995

\def\theequation{Equation \arabic{chapter}.\arabic{equation}}



% \jot = 3pt      % Extra space added between lines of an eqnarray environment

% The macro \@eqnnum defines how equation numbers are to appear in equations.
%
 \def\@eqnnum{\theequation}
%


%    ****************************************
%    *           INITIALIZATION             *
%    ****************************************
%
% Default initializations

% thesis mod
%\ps@plain                   % 'plain' page style
\ps@myheadings		    % default is `myheadings' page style
%
\pagenumbering{arabic}      % Arabic page numbers 
\onecolumn                  % Single-column.
\if@twoside\else\raggedbottom\fi % Ragged bottom unless twoside option.

%    ***************************************
%    *     SINGLESPACE ANd DOUBLESPACE	   *
%    ***************************************     


%-------------------------------------------------------------------------------
%
% LaTeX Document style option "doublespace"
% -- usage:  \documentstyle[...,doublespace,...]{...}
%
% This style option produces a double-spaced document by redefining
% the LaTeX parameter \baselinestretch to 2.
%
% It also fixes a number of problems with standard LaTeX, as follows:
%
% 1. A new environment "singlespace" is provided, within which single
%    spacing will apply.
%    JFL - changed so that it works in regular text and so that vertical
%    space is before and after is correctly computed
% 2. Double spacing is turned off within footnotes and floats (figures
%    and tables).
% 3. Proper double spacing happens below tabular environments and in other
%    places where LaTeX uses a strut.
% 4. Slightly more space is inserted before footnotes.
% 5. JFL - fixes spacing before and after displayed math
%
% Note: This version sets a baselinestretch of 2. If this is too much,
%    put  \setstretch{1.7}  (or some appropriate value) before the
%    \begin{document} command. To print the document with single spacing
%    again, without removing "singlespace" environments, just put a
%    \setstretch{1} at the top of the document.
%
% PLEASE REPORT ANY BUGS
%
% Modified by: Jean-Francois Lamy
%                          lamy@ai.toronto.edu
%                          lamy@utai.uucp
%
% Author: Stephen Page  -- sdpage@prg.oxford.ac.uk
%                          sdpage%prg.oxford.ac.uk@cs.ucl.ac.uk
%
% Release date: 6 July 1986 - September 3, 1986
%
% Known bugs:
%    . It might be nice if spacing before the footnote rule (\footins)
%      were provided in a tidier way.
%    . Increasing struts may possibly cause some other obscure part of
%      formatting to fall over.
%    . \begin{singlespace}\begin{quote} produces the wrong spacing before
%      the quote (extra glue is inserted).
%    . shouldn't @setsize stretch parskip as well?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---Set up double spacing

%\def\baselinestretch{1}


%---New command "\setstretch" (slightly more mnemonic... and easier to type)

\def\setstretch#1{\renewcommand{\baselinestretch}{#1}}

%---Stretch the baseline BEFORE calculating the strut size. This improves
%   spacing below tabular environments etc., probably...
%   Comments are welcomed.

\def\@setsize#1#2#3#4{\@nomath#1%
   \let\@currsize#1\baselineskip
   #2\baselineskip\baselinestretch\baselineskip
   \parskip\baselinestretch\parskip
   \setbox\strutbox\hbox{\vrule height.7\baselineskip
      depth.3\baselineskip width\z@}%
   \normalbaselineskip\baselineskip#3#4}


%---Increase the space between last line of text and footnote rule.
%   This is a very untidy way to do it!

\skip\footins 25pt plus4pt minus4pt


%---Reset baselinestretch within footnotes and floats. Originally stolen
%   from Stanford thesis style.

\def\@xfloat#1[#2]{\ifhmode \@bsphack\@floatpenalty -\@Mii\else
   \@floatpenalty-\@Miii\fi\def\@captype{#1}\ifinner
      \@parmoderr\@floatpenalty\z@
    \else\@next\@currbox\@freelist{\@tempcnta\csname ftype@#1\endcsname
       \multiply\@tempcnta\@xxxii\advance\@tempcnta\sixt@@n
       \@tfor \@tempa :=#2\do
                        {\if\@tempa h\advance\@tempcnta \@ne\fi
                         \if\@tempa t\advance\@tempcnta \tw@\fi
                         \if\@tempa b\advance\@tempcnta 4\relax\fi
                         \if\@tempa p\advance\@tempcnta 8\relax\fi
         }\global\count\@currbox\@tempcnta}\@fltovf\fi
    \global\setbox\@currbox\vbox\bgroup 
    \def\baselinestretch{1}\small\normalsize
    \boxmaxdepth\z@
    \hsize\columnwidth \@parboxrestore}
\long\def\@footnotetext#1{\insert\footins{\def\baselinestretch{1}\footnotesize
    \interlinepenalty\interfootnotelinepenalty 
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

% Stolen from MIT.
%
% A single spaced quote (say) is done by surrounding singlespace with quote.
%
\def\sspace{%
\vskip\parskip%
\vskip\baselineskip%
\def\baselinestretch{0.65}%
\ifx\@currsize\normalsize\@normalsize\else\@currsize\fi%
\vskip-\parskip%
\vskip-\baselineskip%
}

\def\endsspace{\par}

%  spacing, doublespace and onehalfspace all are meant to INCREASE the
%  spacing (i.e. calling onehalfspace from within doublespace will not
%  produce a graceful transition between spacings)
%
\def\spacing#1{\par%
 \def\baselinestretch{#1}%
 \ifx\@currsize\normalsize\@normalsize\else\@currsize\fi}

\def\endspacing{\par%
 \vskip \parskip%
 \vskip \baselineskip%
 \endgroup%
 \vskip -\parskip%
 \vskip -\baselineskip%
 \begingroup}

\def\onehalfspace{\spacing{1.5}}
\let\endonehalfspace=\endspacing

\def\dspace{\spacing{2}}
\let\dspace=\endspacing

% Fix up spacing before and after displayed math
% (arraystretch seems to do a fine job for inside LaTeX displayed math,
% since array and eqnarray seem to be affected as expected)
% Changing \baselinestretch and doing a font change also works if done here,
% but then you have to change @setsize to remove the call to @nomath)
%
\everydisplay{
   \abovedisplayskip \baselinestretch\abovedisplayskip%
   \belowdisplayskip \abovedisplayskip%
   \abovedisplayshortskip \baselinestretch\abovedisplayshortskip%
   \belowdisplayshortskip  \baselinestretch\belowdisplayshortskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          verbatimfiles, adopted from Chris Rowley           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- This LaTeX style-file defines two user-callable macros:
% ---     \verbatimfile{<filename>}    for verbatim inclusion of a file
% ---     \verbatimlisting[n]{<filename>} for verbatim inclusion
%                                         with line numbers every nth line
%
% --- The macros are based on those distributed with Sunil Podar's
% --- `EPIC.STY' macro package, attributed to Tim Morgan,
% --- modified to keep internal macros internal by Adrian F. Clark,
% --- alien@uk.ac.essex.ese
% --- ---and further latexification by Chris Rowley,
% --- ca_rowley@uk.ac.open.acs.vax.
% --- optional argument for numbering multiples of [N] by H. Schulzrinne
%     hgschulz@cs.umass.edu
%
% --- Note that the precise layout of line breaks in this file is important!
%

\def\verbatimfile#1{\begingroup
                    \@verbatim\frenchspacing \@vobeyspaces
                    \input#1 \endgroup
}

\newcounter{lineno}\newcounter{Lineno}
\def\verbatimlisting{\@ifnextchar[{\@verbatimlisting}{\@verbatimlisting[5]}}
\def\@verbatimlisting[#1]#2{\setcounter{lineno}{0}\setcounter{Lineno}{0}%
  \begingroup \@verbatim \frenchspacing \@vobeyspaces \parindent=25pt %jkh(18)
  \everypar{\stepcounter{lineno}\stepcounter{Lineno}\ifnum\value{Lineno}=#1
    \setcounter{Lineno}{0}\llap{\footnotesize\it\thelineno\ \ }\fi}\input#2
  \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Blue line emulator              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Box the pages similarly to the blue line paper boxs the pages. 
% In \tableofcontents, \listoffigures, and \listoftables we set the \headheight
% to be 36pt and it is too much so we have to reduce that by setting 
% \extraspace to be 24pt. And after we finish \tableofcontents, \listoffigures,
% and listoftables, the \extraspace should be recovered to be 0pt. So the 
% \extraspace should be set to 0pt just right before \include{ch1}.
%
%
\def\blueline{
\newdimen\topdist \topdist 4pt
\newdimen\rightdist \rightdist .23in
\newdimen\marsepsize \marsepsize 8pt
\newdimen\theight \theight 8.5in
\newdimen\twidth \twidth 6.0in
\newdimen\botdist \botdist 6pt
\newdimen\extraspace \extraspace 0pt
\newdimen\extradim \extradim 0pt

\def\tableofcontents{
\newpage
\extraspace 24pt
   \let \tempp \topskip
   \topskip 1em
%  \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
% thesis mod
\tocspace
%
%  \chapter*{TABLE OF CONTENTS\markright{CONTENTS}}
% thesis mod
  \chapter*{\vspace*{-1em}Table of Contents\markright{Chapter}}
  {\vskip -1em \bf Chapter \hfill \bf Page\\}
  \thispagestyle{empty}
%
  \@starttoc{toc}
%  \if@restonecol\twocolumn\fi}
% thesis mod
  %\doublespace  
  \topskip \tempp}
%

\def\listoffigures{\singlespace   % \tocspace for \listoffigures, Ken 5-28-90
   \let \tempp \topskip
   \topskip 1em
   \chapter*{List of Figures\markright{Figure}}
   {\vskip -1em \bf Figure \hfill \bf Page\\}
   \thispagestyle{empty}
     \toddhack \twoem 
    \@starttoc{lof}\if@restonecol\twocolumn 
     \toddhack \zeroem
   \fi \topskip \tempp} %\doublespace} % the rest of the text is \doublespace
                                    % Ken 5-28-90

\def\listoftables{\tocspace
   \let \tempp \topskip
   \topskip 1em
   \chapter*{\vspace*{-1em}List of Tables\markright{Table}}
   {\vskip 1em \bf Table \hfill \bf Page\\}
   %\thispagestyle{myheadings}
	\thispagestyle{empty}
     \toddhack \twoem
    \@starttoc{lot}\if@restonecol\twocolumn
     \toddhack \zeroem
   \fi\topskip \tempp}% \doublespace}
%

\def\body{
   \pagenumbering{arabic}\setcounter{page}{1}
   \headheight 11pt
   \extraspace 0pt % recover to \headheight = 12pt
   \pagestyle{myheadings}
   \def\@thefnmark{\char32}
   \@footnotetext{\tiny The journal model is {\sl IEEE}
   {\sl Transactions on Automatic Control.}}\setcounter{footnote}{0}}

%%% LaTeX's output routine, tweaked for page boxes.

\def\@outputpage{\begingroup\catcode`\ =10 
    \extradim \extraspace
     \let\-\@dischyph \let\'\@acci \let\`\@accii \let\=\@acciii
    \if@specialpage 
     \global\@specialpagefalse\@nameuse{ps@\@specialstyle}\fi
     \if@twoside 
       \ifodd\count\z@ \let\@thehead\@oddhead \let\@thefoot\@oddfoot
            \let\@themargin\oddsidemargin
          \else \let\@thehead\@evenhead
          \let\@thefoot\@evenfoot \let\@themargin\evensidemargin
     \fi\fi
     \shipout
     \vbox{\normalsize \baselineskip\z@ \lineskip\z@ 
           \let\par\@@par %% 15 Sep 87
           \vskip \topdist \moveright \rightdist 
           \vbox{\hrule\hbox{\vrule\kern 1.03\marsepsize\vbox{\vskip\topmargin
		\setbox\@tempboxa
                   \vbox to\headheight{\vfil \hbox to\twidth
                                       {\let\label\@gobble \let\index\@gobble
                                         \@thehead}} %% 22 Feb 87
                 \dp\@tempboxa\z@
                 \box\@tempboxa
                 \vskip 0.84\headsep
                 \box\@outputbox
                 \baselineskip \footskip
                 \hbox to\textwidth{\let\label\@gobble 
                           \let\index\@gobble  %% 22 Feb 87
                           \@thefoot}\kern -\botdist \kern-\extradim}
                \kern 1.1\marsepsize\vrule} 
                \hrule}}\global\@colht\theight
           \endgroup\stepcounter{page}\let\firstmark\botmark}
\makeatother
}

%%%% figbox draws a box around its contents, which
%%%% can even contain verbatim text!
%%%\newbox\thefigbox
%%%\newenvironment{figbox}{%
%%%%   \hfuzz=10pt                         %no complaints, please
%%%    \setbox\thefigbox\hbox\bgroup
%%%    \advance\linewidth by -2\fboxsep %make outer box dimension == linewidth
%%%    \advance\linewidth by -2\fboxrule
%%%    \hss
%%%    \begin{minipage}{\linewidth}%
%%%}{%
%%%    \end{minipage}%
%%%    \hss
%%%    \egroup
%%%    \fbox{\box\thefigbox}
%%%}% figbox draws a box around its contents, which
%%%
