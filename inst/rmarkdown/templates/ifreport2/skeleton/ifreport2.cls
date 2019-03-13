%% Ikerkuntza operatiboa irakasgaiaren dokumentazioa prestatzeko formatua

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ifreport2}[2019/03/13 v0.2]

\LoadClassWithOptions{article}[2005/09/16]

\RequirePackage{graphicx}
\RequirePackage{color}

% DEFINICION DE LOS TAMAÑOS DE LA HOJA

\paperheight 297mm
\paperwidth  210mm
\setlength{\pdfpagewidth}{\paperwidth}
\setlength{\pdfpageheight}{\paperheight}
\textwidth 0.81\paperwidth
\textheight 0.75\paperheight
\voffset -38mm
\hoffset -5mm
\topmargin 15mm
\oddsidemargin 0mm
\evensidemargin 0mm
\marginparwidth 30mm
\marginparsep 0mm
\headsep 25mm
\headheight 20mm
\@ifundefined{footheight}{\newdimen\footheight}{}% this is for LaTeX2e
\footheight 25mm               % Height of box containing running foot.
\@ifundefined{footsep}{\newdimen\footsep}{}% this is for LaTeX2e
\footsep 20mm               % Height of box containing running foot.

\@twosidefalse
\@mparswitchfalse


% PACKAGE OPTION DEFINITIONS

\def\@campus{CAMPUS DE GUIPUZCOA}
\def\@campusa{GIPUZKOAKO CAMPUSA}
\def\@emptylogo{} %Truco warro para que funcione el chequeo de logo vacio con el texthead

% ENCABEZADO Y PIE VACIO COMO OPCIÓN POR DEFECTO
\def\ps@ioheadfirst{
	\def\@oddhead{}%
	\def\@oddfoot{}%
	\let\evenhead\@evenfoot
	\let\@evenfoot\@oddfoot
}

\DeclareOption{gipuzkoa}{}
\DeclareOption{bizkaia}
   {\def\@campus{CAMPUS DE VIZKAYA}
    \def\@campusa{BIZKAIKO CAMPUSA}}
\DeclareOption{araba}
   {\def\@campus{CAMPUS DE ALAVA}
    \def\@campusa{ARABAKO CAMPUSA}}
\DeclareOption{eu}
   {\renewcommand\abstractname{Laburpena}
    \renewcommand\refname{Bibliografia}
    \renewcommand\figurename{Irudia}
    \renewcommand\tablename{Taula}
    \renewcommand\today{\number\year(e)ko\space\ifcase\month\or
    urtarrilak\or otsailak\or martxoak\or apirilak\or
    maiatzak\or ekainak\or uztailak\or abuztuak\or
    irailak\or urriak\or azaroak\or
    abenduak\fi~\number\day}}
\DeclareOption{es}
   {\renewcommand\abstractname{Resumen}
    \renewcommand\refname{Bibliograf\'ia}
    \renewcommand\figurename{Figura}
    \renewcommand\tablename{Tabla}
    \renewcommand\today{{\number\day} de\space\ifcase\month\or
    Enero\or Febrero\or Marzo\or Abril\or
    Mayo\or Junio\or Julio\or Agosto\or
    Septiembre\or Noviembre\or Diciembre\or
    abenduak\fi~de {\number\year}}}
\DeclareOption{en}{}
\DeclareOption{texthead}
{
	\def\saila#1{\gdef\@saila{#1}}
	\def\@saila{Konputazio Zientziak eta Adimen Artifiziala}
	
	\def\dpto#1{\gdef\@dpto{#1}}
	\def\@dpto{Ciencias de la Computaci\'on e Inteligencia Artificial}
	\def\@emptylogo{ZABORRA}
	\def\@rightlogohead{
		\fontfamily{phv}\selectfont\scriptsize
		\begin{tabular}[b]{rrr@{}}
			\@saila \\
			\textcolor[rgb]{0.3,0.3,0.3}{\@dpto} \\
		\end{tabular}
	}
	\def\@rightlogotitle{
		\fontfamily{phv}\selectfont
		\begin{tabular}[b]{rrr@{}}
			\@saila \\
			\textcolor[rgb]{0.3,0.3,0.3}{\@dpto} \\
		\end{tabular}
}}

\DeclareOption{foot}{
	\def\ps@ioheadfirst{
		\def\@oddhead{}%
		\def\@oddfoot{{\parbox{\textwidth}{\scriptsize
					\fontfamily{phv}\selectfont
					\begin{tabular}[b]{ll}
						\@name \\
						\@mail \\
						\@tel \\
					\end{tabular}
					\hfill
					\@helbidea}}}%
		\let\evenhead\@evenfoot
		\let\@evenfoot\@oddfoot}}

\ProcessOptions

% COMMAND DEFINITIONS

\def\rightlogo#1{\gdef\@rightlogo{#1}}
\def\@rightlogo{\@emptylogo}

\def\leftlogo#1{\gdef\@leftlogo{#1}}
\def\@leftlogo{EHU_Infor_English}

\def\name#1{\gdef\@name{#1}}
\def\@name{Zure name}

\def\tel#1{\gdef\@tel{#1}}
\def\@tel{Zure Telefonoa}

\def\mail#1{\gdef\@mail{#1}}
\def\@mail{zure.emaila@ehu.eus}

\def\addrs#1{\gdef\@addrs{#1}}
\def\@addrs{Paseo Manuel de Lardizabal, 1\\ 20018 Donostia (Gipuzkoa)}
\def\@helbidea{
     \begin{tabular}[b]{rrr@{}}
     \@campusa \\
     \textcolor[rgb]{0.3,0.3,0.3}{\@campus} \\
     \@addrs
    \end{tabular}
}

% DEFINICION DEL ENCABEZADO / PIE (PAGINA 2 EN ADELANTE)

\@ifundefined{saila}{
	\def\@rightlogohead{\includegraphics[height=25mm, width=40mm,keepaspectratio=true]{\@rightlogo}}
	\def\@rightlogotitle{\includegraphics[height=25mm, width=40mm,keepaspectratio=true]{\@rightlogo}}
}{}

\def\ps@iohead{
     \def\@oddhead{\parbox{\textwidth}{
\hspace{-25mm}
\begin{minipage}{1.2\textwidth}
	\raisebox{-35mm}{\includegraphics[height=35mm,keepaspectratio=true]{\@leftlogo}}
	\hfill
	\ifx\@rightlogo\empty
	\else
	\raisebox{-27mm}{\@rightlogohead}
	\fi
\end{minipage}
     }}%
     \def\@oddfoot{{\parbox{\textwidth}{\centering \thepage}}}%
     \let\evenhead\@evenfoot
     \let\@evenfoot\@oddfoot
}


%REDEFINICION DEL COMANDO maketitle PARA QUE NO SE CARGUE EL ESTILO DE LA PRIMERA PAGINA

\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{ioheadfirst}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

% CREACION DE LA PRIMERA PAGINA

\def\@maketitle{%
\enlargethispage{-10mm}
  \newpage
  \null
\vskip -50mm
\hspace{-30mm}
\begin{minipage}{1.2\textwidth}
\raisebox{-35mm}{\includegraphics[height=35mm,keepaspectratio=true]{\@leftlogo}}
\hfill
\ifx\@rightlogo\empty
\else
\raisebox{-27mm}{\@rightlogotitle}
\fi
\vskip 2mm
\end{minipage}
\vskip 20mm%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em
}

\pagestyle{iohead}

%end of file isgreport.cls
