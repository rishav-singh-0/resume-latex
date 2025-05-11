%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% my-resume.cls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% A class to do stuff.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CLASS OPTIONS

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my-resume}[2022/06/21 my-resume v0.1, my own resume/CV class.]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CLASS OPTIONS

% option to have a single sided document, i.e. the highlight bar is always left

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions*
\PassOptionsToClass{oneside}{scrartcl}
\LoadClass{scrartcl}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REQUIRED PACKAGES

% \RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\usetikzlibrary{arrows}
\RequirePackage[skins]{tcolorbox}       % somehow required for tikz to work at all
\RequirePackage{graphicx}
\graphicspath{{./asserts/}}
\RequirePackage{xcolor}
\RequirePackage{fontawesome}
\RequirePackage{academicons}
\RequirePackage{ifthen}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FILTER IRRELEVANT WARNINGS

\RequirePackage{silence}

% The page header is deliberately disabled in my-resume, so the warning by scrlayer-scrpage is invalid.
\WarningFilter{scrlayer-scrpage}{Very small head height detected!}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEFINE GEOMETRY

\newlength\highlightwidth
\newlength\headerheight
\newlength\marginleft
\newlength\marginright
\newlength\margintop
\newlength\marginbottom

% default sizes, margins, ...
\setlength\highlightwidth{8cm}
\setlength\headerheight{5cm}
\setlength\marginleft{1cm}
\setlength\marginright{\marginleft}
\setlength\margintop{1cm}
\setlength\marginbottom{1cm}

\RequirePackage[bindingoffset=0cm,nomarginpar,noheadfoot]{geometry}
\geometry{left=\marginleft,right=\marginright,top=\margintop,bottom=\marginbottom}

% minipage has an annoying af indent that must be removed
\setlength{\parindent}{0pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLORS

\RequirePackage{xcolor}

% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{mediumgray}{HTML}{444444}
\definecolor{gray}{HTML}{5D5D5D}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\definecolor{awesome-darkgray}{HTML}{576d7b}
\definecolor{awesome-lightgray}{HTML}{e5e9ec}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLORED BARS

\RequirePackage{xpatch}
\RequirePackage{scrlayer-scrpage}

% declare new page style using layers
\DeclareNewPageStyleByLayers{headerhighlightmain}{%
  highlightbar,
  header.bg
}
\DeclareNewPageStyleByLayers{highlightmain}{%
  highlightbar
}
\DeclareNewPageStyleByLayers{headermain}{%
  header.bg
}

% define the layer for the highlight bar on odd pages
\DeclareNewLayer[
  background,
  width=\highlightwidth,
  contents={\color{highlightbarcolor}\rule{\layerwidth}{\layerheight}}
]{highlightbar}

% define the layer for the header
\DeclareNewLayer[
  background,
  topmargin,
  addheight=\headerheight,
  contents={\color{headerbarcolor}\rule{\layerwidth}{\layerheight}}
]{header.bg}

% % add the layers to page style plain
\ForEachLayerOfPageStyle*{headerhighlightmain}{%
  \AddLayersToPageStyle{plain.scrheadings}{#1}%
}

% remove anything that might be there (page number) from header and footer
\lehead[]{}
\cehead[]{}
\rehead[]{}
\lohead[]{}
\cohead[]{}
\rohead[]{}
\lefoot[]{}
\cefoot[]{}
\refoot[]{}
\lofoot[]{}
\cofoot[]{}
\rofoot[]{}

% convenience functions to enable/disable header or highlightbar
% TBD

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEADER
% variables for name, tag line and photo setup
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\newcommand{\photo}[3][]{\def\@photo{#2}\def\@photodiameter{#3}\def\@photoformat{#1}}

% try to align the top of the written out name with the top of the photo
% it is impossible to get the actual height of a line to determine the offset between line top and charachter top
% therefore use a bad workaround by setting the line height to 1.5 times the character height
\newlength{\@namefontheight}
\newlength{\@namelineheight}
\settoheight{\@namefontheight}{\Huge\bfseries\MakeUppercase{A}}
\setlength\@namelineheight{1.5\@namefontheight}

% assemble the header
\newcommand{\makeheader}{% header bar is a minipage
    \begin{minipage}[t][\headerheight]{\textwidth}%
        \vspace{-1em}
        % \vspace{\dimexpr \@namefontheight-\@namelineheight}                     % align top of name and photo
        % create two minipages for header text and photo if photo is given
        \ifdef{\@photodiameter}{
            \begin{minipage}[t]{\dimexpr \textwidth-\@photodiameter}        % to top align name and photo add [t] here
                \vspace{0cm}%
            }{}
            % print the header text
                \begin{minipage}[t][2em]{\linewidth}
                {\Huge\bfseries\color{headerfontcolor}\MakeUppercase{\@name}\par}
                \end{minipage}%
                \vfill%
                \begin{minipage}[b][\dimexpr \headerheight-2em-\marginbottom]{0.98\linewidth}%
                    {\large\bfseries\color{headerfontcolor}\raggedright\@tagline\par}
                \end{minipage}%
        % finish the minipages for text and photo if photo is given
        \ifdef{\@photodiameter}{%
            \end{minipage}\hfil%
            \begin{minipage}[t]{\@photodiameter}                                % to top align name and photo add [t] here
                \vspace{0cm}
    			% format as square or round
    			\ifthenelse{\equal{\@photoformat}{square}}{%
    			    \includegraphics[width=\linewidth]{\@photo}%
    			}{%
    			    \tikz\path[fill overzoom image={\@photo}]circle[radius=0.52\linewidth];
    			}
    		\end{minipage}%
            }{}
	\end{minipage}%
}

\newcommand{\emptyheader}{%
    \vspace*{\dimexpr \headerheight+0.5em}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BODY

% contact info

\newcommand{\infofield}[2]{\mbox{\makebox[5mm]{\textcolor{accent}{\normalsize #1}}\hspace{0.5em}#2}\vspace{0.2em}\newline}
\newcommand{\email}[1]{\infofield{\faEnvelope}{\href{mailto:#1}{#1}}}
\newcommand{\address}[1]{\infofield{\faAt}{#1}}
\newcommand{\location}[1]{\infofield{\faMapMarker}{#1}}
\newcommand{\phone}[1]{\infofield{\faPhone}{#1}}
\newcommand{\homepage}[2]{\infofield{\faHome}{\href{#2}{#1}}}
\newcommand{\linkedin}[2]{\infofield{\faLinkedin}{\href{#2}{#1}}}
\newcommand{\github}[2]{\infofield{\faGithub}{\href{#2}{#1}}}
\newcommand{\website}[2]{\infofield{\faUser}{\href{#2}{#1}}}
\newcommand{\orcid}[2]{\infofield{\aiOrcid}{\href{#2}{#1}}}
\newcommand{\ads}[2]{\infofield{\aiADS}{\href{#2}{#1}}}

% highlight bar
\newcommand{\highlightbar}[1]{%
    \def\@highlightbar{%
        \begin{minipage}[t]{\dimexpr \highlightwidth-\marginleft-\marginright}%
            #1%
        \end{minipage}%
    }
}

% main bar
\newcommand{\mainbar}[1]{%
    \def\@mainbar{%
        \begin{minipage}[t]{\dimexpr \textwidth-\highlightwidth}%
            #1%
        \end{minipage}%
    }
}

% make body with highlight bar and main bar
\newcommand{\makebody}{%
    \@highlightbar
    \hspace{\dimexpr \marginleft+\marginright}%
    \@mainbar
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECTIONS, SUBSECTIONS, AND MORE

% redefine section in caps, bold and with rule below
\renewcommand{\section}[2][]{%
    \bigskip%
    % \ifstrequal{#1}{}{}{\marginpar{\vspace*{\dimexpr 1pt-\baselineskip}\raggedright\input{#1}}}%
    \ifstrequal{#1}{}{}{\makebox[5mm][c]{#1}\hspace{0.5em}}
    {\color{heading}\Large\bfseries\MakeUppercase{#2}}\\[-1ex]%
    {\color{heading}\rule{\linewidth}{1.0pt}\par}\smallskip
}

% redefine subsection as bold
\renewcommand{\subsection}[1]{%
  \smallskip%
  {\color{emphasis}\large\bfseries{#1}\par}\medskip
}

% format job/school list
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set length of date/place column versus position column in fraction of linewidth before linewidth gets redefined in minipages
\newlength{\jobdateplacelength}
\newlength{\jobpositionlength}
\setlength{\jobdateplacelength}{0.25\linewidth}
\setlength{\jobpositionlength}{0.75\linewidth}
\newcommand{\job}[5]{%
    \begin{minipage}[t]{\jobpositionlength}% minipage for position
        \large #1 
        \vspace{0.2em}
        \par \footnotesize #4 % Subtitle or additional text
    \end{minipage}%
    \begin{minipage}[t]{\jobdateplacelength}% minipage for left column with date/place
        \raggedleft
        \footnotesize
        \textbf{#2}     % Duration (bold for emphasis)
        \par #3         % Other info (e.g., location)
    \end{minipage}%
    \ifstrequal{#5}{}{}{\par \vspace{0.1em} \footnotesize #5}
    \par\normalsize
    \vspace{0.5em}
}

% format project list
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set length of date/place column versus position column in fraction of linewidth before linewidth gets redefined in minipages
\def \ifempty#1{\def\temp{#1} \ifx\temp\empty }
\newcommand{\project}[5]{%
    \begin{minipage}[t]{\jobpositionlength}% minipage for position
        {\large #1}
        \vspace{0.2em}
        \par \footnotesize #4 %
    \end{minipage}%
    \begin{minipage}[t]{\jobdateplacelength}% minipage for left column with date/place
        \footnotesize
        \ifempty{#2}
        \else
            \raggedleft
            \footnotesize \textbf{#2} % Duration (bold for emphasis)
        \fi
        \par
        \ifempty{#3}
        \else
            \par \href{#3}{link}
        \fi
    \end{minipage}%
    \ifstrequal{#5}{}{}{\par \vspace{0.1em} \footnotesize #5}
    \par\normalsize
    \vspace{0.5em}
}


% skill
\newcommand{\skill}[1]{%
    \textcolor{emphasis}{\textbf{#1}}\par%
}

% sectioning of skills
\newcommand{\skillsection}[1]{%
    \textit{\color{accent}#1}\par
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dis: job discription

\newcommand{\dis}[1]{%
    \begin{minipage}[t]{3mm}%
        \makebox[3mm][c]{\par -}
    \end{minipage}%
    \hspace{0.5em}% Space between the marker and text
    \begin{minipage}[t]{\dimexpr \textwidth-0.5em-3mm}%
        { #1\par}
    \end{minipage}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lists

\RequirePackage{enumitem}
\setlist[itemize]{noitemsep, topsep=0pt, leftmargin=1em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FINAL FORMATTING


\pagestyle{headerhighlightmain}
\RequirePackage{hyperref}


%%%%%%%%%% THE END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
