From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Remove old build artifacts from repo
Date: Tue, 12 Dec 2017 10:19:20 +0000
Message-ID: <20171212101920.21926-1-grant.likely@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJ2yvKEIZBNAbq9GTbJdpf1rhYZi1eIiONC8p/y3tsQ=;
        b=MHjdeGMGpuptDoiApyEHbOsm3/5WVj9fiatSfNb/d3v9S0meGNVtp9gZAo3pP++Knc
         mvf57X59iYXt10fpwEV2l9a0oHx4+1aa870e9N9lRIDKK42sbt82xjN1sWpAdrQg4x0i
         j9xZw2lBtfnI2NX5Q4crpneRf4sq+4K2v5NwHLJhMBP0Vn/HahGah5Qo1wrrsb9zYq3D
         1IZb1Ya+a1WP0qPoYhRujXwBePZzfsuS27bqabX2NhbJlShUEm9pdNj9foKGwaPootia
         DfgQ3SSdMVhW5NzzOPGW0S7WeOUcZbx45mA/bhSU3mwmj3WXzNEC8Ie6KDo9VmKcWvl0
         +OXw==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

The releases/ subdirectory contains latex build artifacts. The idea was
to use it when creating a changebar version of the document, but it is a
little difficult to manage as part of the repo. The old document is
always available in a previous git tag anyway, so the build products can
be regenerated. So, drop the releases directory entirely.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---
 Makefile                                           |    3 +-
 release/latex/Makefile                             |   78 -
 release/latex/devicetree-logo.png                  |  Bin 27987 -> 0 bytes
 release/latex/devicetree-specification.tex         | 4840 --------------------
 release/latex/fncychap.sty                         |  683 ---
 ...iz-1d3954672eca688030b49a13a35b6714d9abdcd5.pdf |  Bin 19470 -> 0 bytes
 ...iz-23a197b43ca822bb92fb1a341bdd04b0845caa29.pdf |  Bin 14813 -> 0 bytes
 ...iz-8bc6c34d442f7e613c5d327992e204083ddaf50f.pdf |  Bin 8688 -> 0 bytes
 ...iz-e69f9031183bd8d3b6636722c922fcb66d4843c4.pdf |  Bin 12918 -> 0 bytes
 release/latex/newfloat.sty                         |  737 ---
 release/latex/python.ist                           |   11 -
 release/latex/sphinx.sty                           |  641 ---
 release/latex/sphinxhowto.cls                      |  104 -
 release/latex/sphinxmanual.cls                     |  148 -
 release/latex/tabulary.sty                         |  452 --
 15 files changed, 1 insertion(+), 7696 deletions(-)
 delete mode 100644 release/latex/Makefile
 delete mode 100644 release/latex/devicetree-logo.png
 delete mode 100644 release/latex/devicetree-specification.tex
 delete mode 100644 release/latex/fncychap.sty
 delete mode 100644 release/latex/graphviz-1d3954672eca688030b49a13a35b6714d9abdcd5.pdf
 delete mode 100644 release/latex/graphviz-23a197b43ca822bb92fb1a341bdd04b0845caa29.pdf
 delete mode 100644 release/latex/graphviz-8bc6c34d442f7e613c5d327992e204083ddaf50f.pdf
 delete mode 100644 release/latex/graphviz-e69f9031183bd8d3b6636722c922fcb66d4843c4.pdf
 delete mode 100644 release/latex/newfloat.sty
 delete mode 100644 release/latex/python.ist
 delete mode 100644 release/latex/sphinx.sty
 delete mode 100644 release/latex/sphinxhowto.cls
 delete mode 100644 release/latex/sphinxmanual.cls
 delete mode 100644 release/latex/tabulary.sty

diff --git a/Makefile b/Makefile
index 8e3bd9f..d8eb85e 100644
--- a/Makefile
+++ b/Makefile
@@ -5,7 +5,6 @@
 SPHINXOPTS    =
 SPHINXBUILD   = sphinx-build
 PAPER         =
-RELEASEDIR    = release
 BUILDDIR      = build
 LATEXDIFF     = latexdiff
 
@@ -145,7 +144,7 @@ latex:
 latexdiff:
 	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
 	@echo "Generating LaTeX changebars..."
-	$(LATEXDIFF) --type=CULINECHBAR $(RELEASEDIR)/latex/devicetree-specification.tex $(BUILDDIR)/latex/devicetree-specification.tex > $(BUILDDIR)/latex/devicetree-specification-changebars.tex
+	$(LATEXDIFF) --type=CULINECHBAR $(BUILDDIR)/latex-previous/devicetree-specification.tex $(BUILDDIR)/latex/devicetree-specification.tex > $(BUILDDIR)/latex/devicetree-specification-changebars.tex
 	@echo "Running LaTeX files through pdflatex..."
 	$(MAKE) -C $(BUILDDIR)/latex all-pdf
 	@echo
diff --git a/release/latex/Makefile b/release/latex/Makefile
deleted file mode 100644
index d748006..0000000
--- a/release/latex/Makefile
+++ /dev/null
@@ -1,78 +0,0 @@
-# Makefile for Sphinx LaTeX output
-
-ALLDOCS = $(basename $(wildcard *.tex))
-ALLPDF = $(addsuffix .pdf,$(ALLDOCS))
-ALLDVI = $(addsuffix .dvi,$(ALLDOCS))
-
-# Prefix for archive names
-ARCHIVEPRREFIX =
-# Additional LaTeX options
-LATEXOPTS =
-# format: pdf or dvi
-FMT = pdf
-
-LATEX = latex
-PDFLATEX = pdflatex
-MAKEINDEX = makeindex
-
-all: $(ALLPDF)
-all-pdf: $(ALLPDF)
-all-dvi: $(ALLDVI)
-all-ps: all-dvi
-	for f in *.dvi; do dvips $$f; done
-
-all-pdf-ja:
-	for f in *.pdf *.png *.gif *.jpg *.jpeg; do extractbb $$f; done
-	for f in *.tex; do platex -kanji=utf8 $(LATEXOPTS) $$f; done
-	for f in *.tex; do platex -kanji=utf8 $(LATEXOPTS) $$f; done
-	for f in *.tex; do platex -kanji=utf8 $(LATEXOPTS) $$f; done
-	-for f in *.idx; do mendex -U -f -d "`basename $$f .idx`.dic" -s python.ist $$f; done
-	for f in *.tex; do platex -kanji=utf8 $(LATEXOPTS) $$f; done
-	for f in *.tex; do platex -kanji=utf8 $(LATEXOPTS) $$f; done
-	for f in *.dvi; do dvipdfmx $$f; done
-
-zip: all-$(FMT)
-	mkdir $(ARCHIVEPREFIX)docs-$(FMT)
-	cp $(ALLPDF) $(ARCHIVEPREFIX)docs-$(FMT)
-	zip -q -r -9 $(ARCHIVEPREFIX)docs-$(FMT).zip $(ARCHIVEPREFIX)docs-$(FMT)
-	rm -r $(ARCHIVEPREFIX)docs-$(FMT)
-
-tar: all-$(FMT)
-	mkdir $(ARCHIVEPREFIX)docs-$(FMT)
-	cp $(ALLPDF) $(ARCHIVEPREFIX)docs-$(FMT)
-	tar cf $(ARCHIVEPREFIX)docs-$(FMT).tar $(ARCHIVEPREFIX)docs-$(FMT)
-	rm -r $(ARCHIVEPREFIX)docs-$(FMT)
-
-gz: tar
-	gzip -9 < $(ARCHIVEPREFIX)docs-$(FMT).tar > $(ARCHIVEPREFIX)docs-$(FMT).tar.gz
-
-bz2: tar
-	bzip2 -9 -k $(ARCHIVEPREFIX)docs-$(FMT).tar
-
-xz: tar
-	xz -9 -k $(ARCHIVEPREFIX)docs-$(FMT).tar
-
-# The number of LaTeX runs is quite conservative, but I don't expect it
-# to get run often, so the little extra time won't hurt.
-%.dvi: %.tex
-	$(LATEX) $(LATEXOPTS) '$<'
-	$(LATEX) $(LATEXOPTS) '$<'
-	$(LATEX) $(LATEXOPTS) '$<'
-	-$(MAKEINDEX) -s python.ist '$(basename $<).idx'
-	$(LATEX) $(LATEXOPTS) '$<'
-	$(LATEX) $(LATEXOPTS) '$<'
-
-%.pdf: %.tex
-	$(PDFLATEX) $(LATEXOPTS) '$<'
-	$(PDFLATEX) $(LATEXOPTS) '$<'
-	$(PDFLATEX) $(LATEXOPTS) '$<'
-	-$(MAKEINDEX) -s python.ist '$(basename $<).idx'
-	$(PDFLATEX) $(LATEXOPTS) '$<'
-	$(PDFLATEX) $(LATEXOPTS) '$<'
-
-clean:
-	rm -f *.log *.ind *.aux *.toc *.syn *.idx *.out *.ilg *.pla *.ps *.tar *.tar.gz *.tar.bz2 *.tar.xz $(ALLPDF) $(ALLDVI)
-
-.PHONY: all all-pdf all-dvi all-ps clean zip tar gz bz2 xz
-.PHONY: all-pdf-ja
-
diff --git a/release/latex/devicetree-logo.png b/release/latex/devicetree-logo.png
deleted file mode 100644
index e00bb33a7f152660c417c250f0ae71581db01326..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 27987
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
I2e*s=4Qbt_g#Z8m

diff --git a/release/latex/devicetree-specification.tex b/release/latex/devicetree-specification.tex
deleted file mode 100644
index 0bea934..0000000
--- a/release/latex/devicetree-specification.tex
+++ /dev/null
@@ -1,4840 +0,0 @@
-% Generated by Sphinx.
-\def\sphinxdocclass{report}
-\documentclass[a4paper,10pt,oneside]{sphinxmanual}
-
-\usepackage[utf8]{inputenc}
-\ifdefined\DeclareUnicodeCharacter
-  \DeclareUnicodeCharacter{00A0}{\nobreakspace}
-\else\fi
-\usepackage{cmap}
-\usepackage[T1]{fontenc}
-\usepackage{amsmath,amssymb}
-\usepackage[english]{babel}
-\usepackage{times}
-\usepackage[Bjarne]{fncychap}
-\usepackage{longtable}
-\usepackage{sphinx}
-\usepackage{multirow}
-\usepackage{eqparbox}
-
-
-\addto\captionsenglish{\renewcommand{\figurename}{Fig. }}
-\addto\captionsenglish{\renewcommand{\tablename}{Table }}
-\SetupFloatingEnvironment{literal-block}{name=Listing }
-
-\addto\extrasenglish{\def\pageautorefname{page}}
-
-\setcounter{tocdepth}{2}
-
-
-\title{Devicetree Specification}
-\date{24 May 2016}
-\release{0.1}
-\author{devicetree.org}
-\newcommand{\sphinxlogo}{\includegraphics{devicetree-logo.png}\par}
-\renewcommand{\releasename}{Release}
-\makeindex
-
-\makeatletter
-\def\PYG@reset{\let\PYG@it=\relax \let\PYG@bf=\relax%
-    \let\PYG@ul=\relax \let\PYG@tc=\relax%
-    \let\PYG@bc=\relax \let\PYG@ff=\relax}
-\def\PYG@tok#1{\csname PYG@tok@#1\endcsname}
-\def\PYG@toks#1+{\ifx\relax#1\empty\else%
-    \PYG@tok{#1}\expandafter\PYG@toks\fi}
-\def\PYG@do#1{\PYG@bc{\PYG@tc{\PYG@ul{%
-    \PYG@it{\PYG@bf{\PYG@ff{#1}}}}}}}
-\def\PYG#1#2{\PYG@reset\PYG@toks#1+\relax+\PYG@do{#2}}
-
-\expandafter\def\csname PYG@tok@gd\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.63,0.00,0.00}{##1}}}
-\expandafter\def\csname PYG@tok@gu\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.50,0.00,0.50}{##1}}}
-\expandafter\def\csname PYG@tok@gt\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.00,0.27,0.87}{##1}}}
-\expandafter\def\csname PYG@tok@gs\endcsname{\let\PYG@bf=\textbf}
-\expandafter\def\csname PYG@tok@gr\endcsname{\def\PYG@tc##1{\textcolor[rgb]{1.00,0.00,0.00}{##1}}}
-\expandafter\def\csname PYG@tok@cm\endcsname{\let\PYG@it=\textit\def\PYG@tc##1{\textcolor[rgb]{0.25,0.50,0.56}{##1}}}
-\expandafter\def\csname PYG@tok@vg\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.73,0.38,0.84}{##1}}}
-\expandafter\def\csname PYG@tok@vi\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.73,0.38,0.84}{##1}}}
-\expandafter\def\csname PYG@tok@mh\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.13,0.50,0.31}{##1}}}
-\expandafter\def\csname PYG@tok@cs\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.25,0.50,0.56}{##1}}\def\PYG@bc##1{\setlength{\fboxsep}{0pt}\colorbox[rgb]{1.00,0.94,0.94}{\strut ##1}}}
-\expandafter\def\csname PYG@tok@ge\endcsname{\let\PYG@it=\textit}
-\expandafter\def\csname PYG@tok@vc\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.73,0.38,0.84}{##1}}}
-\expandafter\def\csname PYG@tok@il\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.13,0.50,0.31}{##1}}}
-\expandafter\def\csname PYG@tok@go\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.20,0.20,0.20}{##1}}}
-\expandafter\def\csname PYG@tok@cp\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.00,0.44,0.13}{##1}}}
-\expandafter\def\csname PYG@tok@gi\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.00,0.63,0.00}{##1}}}
-\expandafter\def\csname PYG@tok@gh\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.00,0.00,0.50}{##1}}}
-\expandafter\def\csname PYG@tok@ni\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.84,0.33,0.22}{##1}}}
-\expandafter\def\csname PYG@tok@nl\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.00,0.13,0.44}{##1}}}
-\expandafter\def\csname PYG@tok@nn\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.05,0.52,0.71}{##1}}}
-\expandafter\def\csname PYG@tok@no\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.38,0.68,0.84}{##1}}}
-\expandafter\def\csname PYG@tok@na\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.25,0.44,0.63}{##1}}}
-\expandafter\def\csname PYG@tok@nb\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.00,0.44,0.13}{##1}}}
-\expandafter\def\csname PYG@tok@nc\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.05,0.52,0.71}{##1}}}
-\expandafter\def\csname PYG@tok@nd\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.33,0.33,0.33}{##1}}}
-\expandafter\def\csname PYG@tok@ne\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.00,0.44,0.13}{##1}}}
-\expandafter\def\csname PYG@tok@nf\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.02,0.16,0.49}{##1}}}
-\expandafter\def\csname PYG@tok@si\endcsname{\let\PYG@it=\textit\def\PYG@tc##1{\textcolor[rgb]{0.44,0.63,0.82}{##1}}}
-\expandafter\def\csname PYG@tok@s2\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.25,0.44,0.63}{##1}}}
-\expandafter\def\csname PYG@tok@nt\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.02,0.16,0.45}{##1}}}
-\expandafter\def\csname PYG@tok@nv\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.73,0.38,0.84}{##1}}}
-\expandafter\def\csname PYG@tok@s1\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.25,0.44,0.63}{##1}}}
-\expandafter\def\csname PYG@tok@ch\endcsname{\let\PYG@it=\textit\def\PYG@tc##1{\textcolor[rgb]{0.25,0.50,0.56}{##1}}}
-\expandafter\def\csname PYG@tok@m\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.13,0.50,0.31}{##1}}}
-\expandafter\def\csname PYG@tok@gp\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.78,0.36,0.04}{##1}}}
-\expandafter\def\csname PYG@tok@sh\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.25,0.44,0.63}{##1}}}
-\expandafter\def\csname PYG@tok@ow\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.00,0.44,0.13}{##1}}}
-\expandafter\def\csname PYG@tok@sx\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.78,0.36,0.04}{##1}}}
-\expandafter\def\csname PYG@tok@bp\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.00,0.44,0.13}{##1}}}
-\expandafter\def\csname PYG@tok@c1\endcsname{\let\PYG@it=\textit\def\PYG@tc##1{\textcolor[rgb]{0.25,0.50,0.56}{##1}}}
-\expandafter\def\csname PYG@tok@o\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.40,0.40,0.40}{##1}}}
-\expandafter\def\csname PYG@tok@kc\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.00,0.44,0.13}{##1}}}
-\expandafter\def\csname PYG@tok@c\endcsname{\let\PYG@it=\textit\def\PYG@tc##1{\textcolor[rgb]{0.25,0.50,0.56}{##1}}}
-\expandafter\def\csname PYG@tok@mf\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.13,0.50,0.31}{##1}}}
-\expandafter\def\csname PYG@tok@err\endcsname{\def\PYG@bc##1{\setlength{\fboxsep}{0pt}\fcolorbox[rgb]{1.00,0.00,0.00}{1,1,1}{\strut ##1}}}
-\expandafter\def\csname PYG@tok@mb\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.13,0.50,0.31}{##1}}}
-\expandafter\def\csname PYG@tok@ss\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.32,0.47,0.09}{##1}}}
-\expandafter\def\csname PYG@tok@sr\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.14,0.33,0.53}{##1}}}
-\expandafter\def\csname PYG@tok@mo\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.13,0.50,0.31}{##1}}}
-\expandafter\def\csname PYG@tok@kd\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.00,0.44,0.13}{##1}}}
-\expandafter\def\csname PYG@tok@mi\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.13,0.50,0.31}{##1}}}
-\expandafter\def\csname PYG@tok@kn\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.00,0.44,0.13}{##1}}}
-\expandafter\def\csname PYG@tok@cpf\endcsname{\let\PYG@it=\textit\def\PYG@tc##1{\textcolor[rgb]{0.25,0.50,0.56}{##1}}}
-\expandafter\def\csname PYG@tok@kr\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.00,0.44,0.13}{##1}}}
-\expandafter\def\csname PYG@tok@s\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.25,0.44,0.63}{##1}}}
-\expandafter\def\csname PYG@tok@kp\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.00,0.44,0.13}{##1}}}
-\expandafter\def\csname PYG@tok@w\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.73,0.73,0.73}{##1}}}
-\expandafter\def\csname PYG@tok@kt\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.56,0.13,0.00}{##1}}}
-\expandafter\def\csname PYG@tok@sc\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.25,0.44,0.63}{##1}}}
-\expandafter\def\csname PYG@tok@sb\endcsname{\def\PYG@tc##1{\textcolor[rgb]{0.25,0.44,0.63}{##1}}}
-\expandafter\def\csname PYG@tok@k\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.00,0.44,0.13}{##1}}}
-\expandafter\def\csname PYG@tok@se\endcsname{\let\PYG@bf=\textbf\def\PYG@tc##1{\textcolor[rgb]{0.25,0.44,0.63}{##1}}}
-\expandafter\def\csname PYG@tok@sd\endcsname{\let\PYG@it=\textit\def\PYG@tc##1{\textcolor[rgb]{0.25,0.44,0.63}{##1}}}
-
-\def\PYGZbs{\char`\\}
-\def\PYGZus{\char`\_}
-\def\PYGZob{\char`\{}
-\def\PYGZcb{\char`\}}
-\def\PYGZca{\char`\^}
-\def\PYGZam{\char`\&}
-\def\PYGZlt{\char`\<}
-\def\PYGZgt{\char`\>}
-\def\PYGZsh{\char`\#}
-\def\PYGZpc{\char`\%}
-\def\PYGZdl{\char`\$}
-\def\PYGZhy{\char`\-}
-\def\PYGZsq{\char`\'}
-\def\PYGZdq{\char`\"}
-\def\PYGZti{\char`\~}
-% for compatibility with earlier versions
-\def\PYGZat{@}
-\def\PYGZlb{[}
-\def\PYGZrb{]}
-\makeatother
-
-\renewcommand\PYGZsq{\textquotesingle}
-
-\begin{document}
-
-\maketitle
-\tableofcontents
-\phantomsection\label{index::doc}
-
-
-\textbf{Copyright}
-
-\begin{DUlineblock}{0em}
-\item[] Copyright 2008,2011 Power.org, Inc.
-\item[] Copyright 2008,2011 Freescale Semiconductor, Inc.
-\item[] Copyright 2008,2011 International Business Machines Corporation.
-\item[] Copyright 2016 Linaro, Ltd.
-\item[] Copyright 2016 ARM Ltd.
-\end{DUlineblock}
-
-The Linaro and devicetree.org word marks and the Linaro and
-devicetree.org logos and related marks are trademarks and service marks
-licensed by Linaro Ltd. Implementation of certain elements of this
-document may require licenses under third party intellectual property
-rights, including without limitation, patent rights. Linaro and its
-Members are not, and shall not be held, responsible in any manner for
-identifying or failing to identify any or all such third party
-intellectual property rights.
-
-The Power Architecture and Power.org word marks and the Power and
-Power.org logos and related marks are trademarks and service marks
-licensed by Power.org. Implementation of certain elements of this
-document may require licenses under third party intellectual property
-rights, including without limitation, patent rights. Power.org and its
-Members are not, and shall not be held, responsible in any manner for
-identifying or failing to identify any or all such third party
-intellectual property rights.
-
-THIS SPECIFICATION PROVIDED ``AS IS'' AND WITHOUT ANY WARRANTY
-OF ANY KIND, INCLUDING, WITHOUT LIMITATION, ANY EXPRESS OR IMPLIED
-WARRANTY OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR A
-PARTICULAR PURPOSE. IN NO EVENT SHALL LINARO OR ANY MEMBER OF
-LINARO BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL, EXEMPLARY,
-PUNITIVE, OR CONSEQUENTIAL DAMAGES, INCLUDING, WITHOUT LIMITATION, LOST
-PROFITS, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
-
-Questions pertaining to this document, or the terms or conditions of its
-provision, should be addressed to:
-
-\begin{DUlineblock}{0em}
-\item[] Linaro, Ltd
-\item[] Harston Mill,
-\item[] Royston Road,
-\item[] Harston CB22 7GG
-\item[] Attn: Devicetree.org Board Secretary
-\end{DUlineblock}
-
-\textbf{License Information}
-
-Licensed under the Apache License, Version 2.0 (the ``License'');
-you may not use this file except in compliance with the License.
-You may obtain a copy of the License at
-
-\url{http://www.apache.org/licenses/LICENSE-2.0}
-
-Unless required by applicable law or agreed to in writing, software
-distributed under the License is distributed on an ``AS IS'' BASIS,
-WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-See the License for the specific language governing permissions and
-limitations under the License.
-\newpage
-\textbf{Acknowledgements}
-
-The devicetree.org Technical Steering Committee would like
-thank the many individuals and companies that contributed to the
-development this specification through writing, technical discussions
-and reviews.
-
-We want to thank the power.org Platform Architecture Technical Subcommittee who
-developed and published ePAPR. The text of ePAPR was used as the starting
-point for this document.
-
-Significant aspects of the Devicetree Specification are based on work done by
-the Open Firmware Working Group which developed bindings for IEEE-1275.
-We would like to acknowledge their contributions.
-
-We would also like to acknowledge the contribution of the PowerPC and ARM Linux
-communities that developed and implemented the flattened devicetree concept.
-\phantomsection\label{revhistory:revision-history}
-
-\begin{threeparttable}
-\capstart\caption{Revision History}\label{revhistory:id1}
-\begin{tabulary}{\linewidth}{| l l J |}
-\hline
-\textsf{\relax 
-Revision
-} & \textsf{\relax 
-Date
-} & \textsf{\relax 
-Description
-}\\
-\hline
-DTSpec 0.1
- & 
-2016-MAY-24
- & 
-Initial prerelease version. Imported ePAPR text
-into reStructured Text format and removed Power ISA
-specific elements.
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\chapter{Introduction}
-\label{introduction:chapter-introduction}\label{introduction:introduction}\label{introduction::doc}\label{introduction:welcome-to-devicetree-specification-s-documentation}
-
-\section{Purpose and Scope}
-\label{introduction:purpose-and-scope}
-To initialize and boot a computer system, various software components
-interact. Firmware might perform low-level initialization of the system
-hardware before passing control to software such as an operating system,
-bootloader, or hypervisor. Bootloaders and hypervisors can, in turn,
-load and transfer control to operating systems. Standard, consistent
-interfaces and conventions facilitate the interactions between these
-software components.  In this document the term boot program is used to
-generically refer to a software component that initializes the system
-state and executes another software component referred to as a \emph{client
-program}. Examples of a boot programs include: firmware, bootloaders, and
-hypervisors. Examples of a client program include: bootloaders,
-hypervisors, operating systems, and special purpose programs. A piece of
-software may be both a client program and a boot program  (e.g. a hypervisor).
-
-This specification, the Devicetree Specification (DTSpec),
-provides a complete boot program to client program
-interface definition, combined with minimum system requirements that
-facilitate the development of a wide variety of systems.
-
-This specification is targeted towards the requirements of embedded
-systems. An embedded system typically consists of system hardware, an
-operating system, and application software that are custom designed to
-perform a fixed, specific set of tasks. This is unlike general purpose
-computers, which are designed to be customized by a user with a variety
-of software and I/O devices. Other characteristics of embedded systems
-may include:
-\begin{itemize}
-\item {} 
-a fixed set of I/O devices, possibly highly customized for the
-application
-
-\item {} 
-a system board optimized for size and cost
-
-\item {} 
-limited user interface
-
-\item {} 
-resource constraints like limited memory and limited nonvolatile storage
-
-\item {} 
-real-time constraints
-
-\item {} 
-use of a wide variety of operating systems, including Linux,
-real-time operating systems, and custom or proprietary operating
-systems
-
-\end{itemize}
-
-\textbf{Organization of this Document}
-\begin{itemize}
-\item {} 
-Chapter {\hyperref[introduction:chapter\string-introduction]{\crossref{\DUrole{std,std-ref}{1}}}} introduces the architecture being
-specified by DTSpec.
-
-\item {} 
-Chapter {\hyperref[devicetree\string-basics:chapter\string-devicetree]{\crossref{\DUrole{std,std-ref}{2}}}} introduces the devicetree concept
-and describes its logical structure and standard properties.
-
-\item {} 
-Chapter {\hyperref[devicenodes:chapter\string-device\string-node\string-requirements]{\crossref{\DUrole{std,std-ref}{3}}}} specifies the
-definition of a base set of device nodes required by DTSpec-compliant
-devicetrees.
-
-\item {} 
-Chapter {\hyperref[device\string-bindings:chapter\string-device\string-bindings]{\crossref{\DUrole{std,std-ref}{4}}}} describes device bindings for
-certain classes of devices and specific device types.
-
-\item {} 
-Chapter {\hyperref[flattened\string-format:chapter\string-fdt\string-structure]{\crossref{\DUrole{std,std-ref}{5}}}} specifies the physical structure
-of devicetrees.
-
-\end{itemize}
-
-\textbf{Conventions Used in this Document}
-
-The word \emph{shall} is used to indicate mandatory requirements strictly to
-be followed in order to conform to the standard and from which no
-deviation is permitted (\emph{shall} equals \emph{is required to}).
-
-The word \emph{should} is used to indicate that among several possibilities
-one is recommended as particularly suitable, without mentioning or
-excluding others; or that a certain course of action is preferred but
-not necessarily required; or that (in the negative form) a certain
-course of action is deprecated but not prohibited (\emph{should} equals \emph{is
-recommended that}).
-
-The word \emph{may} is used to indicate a course of action permissible within
-the limits of the standard (\emph{may} equals \emph{is permitted}).
-
-Examples of devicetree constructs are frequently shown in \emph{Devicetree
-Syntax} form. See section {\hyperref[source\string-language:chapter\string-devicetree\string-source\string-format]{\crossref{\DUrole{std,std-ref}{6}}}} for
-an overview of this syntax.
-
-
-\section{Relationship to IEEE™ 1275 and ePAPR}
-\label{introduction:relationship-to-ieee-1275-and-epapr}
-DTSpec is loosely related to the IEEE 1275 Open Firmware
-standard—\emph{IEEE Standard for Boot (Initialization Configuration)
-Firmware: Core Requirements and Practices} \phantomsection\label{introduction:id1}{\hyperref[references:ieee1275]{\crossref{{[}IEEE1275{]}}}}.
-
-The original IEEE 1275 specification and its derivatives such as CHRP \phantomsection\label{introduction:id2}{\hyperref[references:chrp]{\crossref{{[}CHRP{]}}}}
-and PAPR \phantomsection\label{introduction:id3}{\hyperref[references:papr]{\crossref{{[}PAPR{]}}}} address problems of general purpose computers, such as how a
-single version of an operating system can work on several different
-computers within the same family and the problem of loading an operating
-system from user-installed I/O devices.
-
-Because of the nature of embedded systems, some of these problems faced
-by open, general purpose computers do not apply. Notable features of the
-IEEE 1275 specification that are omitted from the DTSpec include:
-\begin{itemize}
-\item {} 
-Plug-in device drivers
-
-\item {} 
-FCode
-
-\item {} 
-The programmable Open Firmware user interface based on Forth
-
-\item {} 
-FCode debugging
-
-\item {} 
-Operating system debugging
-
-\end{itemize}
-
-What is retained from IEEE-1275 are concepts from the devicetree
-architecture by which a boot program can describe and communicate system
-hardware information to client program, thus eliminating the need for
-the client program to have hard-coded descriptions of system hardware.
-
-This specification partially supersedes the ePAPR {[}EPAPR{]} specification.
-ePAPR documents how devicetree is used by the PowerISA, and covers both
-general concepts, as well as PowerISA specific bindings.
-The text of this document was derived from ePAPR, but either removes architecture specific bindings, or moves them into an appendix.
-
-
-\section{32-bit and 64-bit Support}
-\label{introduction:bit-and-64-bit-support}
-The DTSpec supports CPUs with both 32-bit and 64-bit addressing
-capabilities. Where applicable, sections of the DTSpec describe any
-requirements or considerations for 32-bit and 64-bit addressing.
-
-
-\section{Definition of Terms}
-\label{introduction:definition-of-terms}\begin{description}
-\item[{AMP\index{AMP|textbf}}] \leavevmode\phantomsection\label{introduction:term-amp}
-Asymmetric Multiprocessing. Computer available CPUs are partitioned into
-groups, each running a distinct operating system image. The CPUs
-may or not may not be identical.
-
-\item[{boot CPU\index{boot CPU|textbf}}] \leavevmode\phantomsection\label{introduction:term-boot-cpu}
-The first CPU which a boot program directs to a client program’s
-entry point.
-
-\item[{Book III-E\index{Book III-E|textbf}}] \leavevmode\phantomsection\label{introduction:term-book-iii-e}
-Embedded Environment. Section of the Power ISA defining supervisor
-instructions and related facilities used in embedded Power processor
-implementations.
-
-\item[{boot program\index{boot program|textbf}}] \leavevmode\phantomsection\label{introduction:term-boot-program}
-Used to generically refer to a software component that initializes
-the system state and executes another software component referred to
-as a client program. Examples of a boot programs include: firmware,
-bootloaders, and hypervisors.
-
-\item[{client program\index{client program|textbf}}] \leavevmode\phantomsection\label{introduction:term-client-program}
-Program that typically contains application or operating system
-software. Examples of a client program include: bootloaders,
-hypervisors, operating systems, and special purpose programs.
-
-\item[{cell\index{cell|textbf}}] \leavevmode\phantomsection\label{introduction:term-cell}
-A unit of information consisting of 32 bits.
-
-\item[{DMA\index{DMA|textbf}}] \leavevmode\phantomsection\label{introduction:term-dma}
-Direct memory access
-
-\item[{DTB\index{DTB|textbf}}] \leavevmode\phantomsection\label{introduction:term-dtb}
-Devicetree blob. Compact binary representation of the devicetree.
-
-\item[{DTC\index{DTC|textbf}}] \leavevmode\phantomsection\label{introduction:term-dtc}
-Devicetree compiler. An open source tool used to create DTB files
-from DTS files.
-
-\item[{DTS\index{DTS|textbf}}] \leavevmode\phantomsection\label{introduction:term-dts}
-Devicetree syntax. A textual representation of a devicetree
-consumed by the DTC. See Appendix A Devicetree Source Format
-(version 1).
-
-\item[{effective address\index{effective address|textbf}}] \leavevmode\phantomsection\label{introduction:term-effective-address}
-Memory address as computed by processor storage access or branch
-instruction.
-
-\item[{physical address\index{physical address|textbf}}] \leavevmode\phantomsection\label{introduction:term-physical-address}
-Address used by the processor to access external device, typically a
-memory controller.
-
-\item[{Power ISA\index{Power ISA|textbf}}] \leavevmode\phantomsection\label{introduction:term-power-isa}
-Power Instruction Set Architecture.
-
-\item[{interrupt specifier\index{interrupt specifier|textbf}}] \leavevmode\phantomsection\label{introduction:term-interrupt-specifier}
-A property value that describes an interrupt. Typically information
-that specifies an interrupt number and sensitivity and triggering
-mechanism is included.
-
-\item[{secondary CPU\index{secondary CPU|textbf}}] \leavevmode\phantomsection\label{introduction:term-secondary-cpu}
-CPUs other than the boot CPU that belong to the client program are
-considered \emph{secondary CPUs}.
-
-\item[{SMP\index{SMP|textbf}}] \leavevmode\phantomsection\label{introduction:term-smp}
-Symmetric multiprocessing. A computer architecture where two or more
-identical CPUs can share memory and IO and operate under a single operating
-system.
-
-\item[{SoC\index{SoC|textbf}}] \leavevmode\phantomsection\label{introduction:term-soc}
-System on a chip. A single computer chip integrating one or more CPU
-core as well as number of other peripherals.
-
-\item[{unit address\index{unit address|textbf}}] \leavevmode\phantomsection\label{introduction:term-unit-address}
-The part of a node name specifying the node’s address in the address
-space of the parent node.
-
-\item[{quiescent CPU\index{quiescent CPU|textbf}}] \leavevmode\phantomsection\label{introduction:term-quiescent-cpu}
-A quiescent CPU is in a state where it cannot interfere with the
-normal operation of other CPUs, nor can its state be affected by the
-normal operation of other running CPUs, except by an explicit method
-for enabling or re-enabling the quiescent CPU.
-
-\end{description}
-
-
-\chapter{The Devicetree}
-\label{devicetree-basics:chapter-devicetree}\label{devicetree-basics:the-devicetree}\label{devicetree-basics::doc}
-
-\section{Overview}
-\label{devicetree-basics:overview}
-DTSpec specifies a construct called a \emph{devicetree} to describe
-system hardware. A boot program loads a devicetree into a client
-program’s memory and passes a pointer to the devicetree to the client.
-
-This chapter describes the logical structure of the devicetree and
-specifies a base set of properties for use in describing device nodes.
-Chapter {\hyperref[devicenodes:chapter\string-device\string-node\string-requirements]{\crossref{\DUrole{std,std-ref}{3}}}} specifies certain device nodes
-required by a DTSpec compliant
-devicetree. Chapter 6 describes the DTSpec defined device bindings— the
-requirements for representing certain device types classes of devices.
-Chapter 8 describes the in-memory encoding of the devicetree.
-
-A devicetree is a tree data structure with nodes that describe the
-devices in a system. Each node has property/value pairs that describe
-the characteristics of the device being represented. Each node has
-exactly one parent except for the root node, which has no parent.
-
-An DTSpec-compliant devicetree describes device information in a system
-that cannot necessarily be dynamically detected by a client program. For
-example, the architecture of PCI enables a client to probe and detect
-attached devices, and thus devicetree nodes describing PCI devices
-might not be required. However, a device node is required to describe a
-PCI host bridge device in the system if it cannot be detected by
-probing.
-
-\textbf{Example}
-
-\hyperref[devicetree-basics:example-simple-devicetree]{Fig. \ref{devicetree-basics:example-simple-devicetree}} shows an example representation of a
-simple devicetree that is nearly
-complete enough to boot a simple operating system, with the platform
-type, CPU, and memory described. Device nodes are shown with properties
-and values shown beside the node.
-\begin{figure}[htbp]
-\centering
-\capstart
-
-\includegraphics{graphviz-e69f9031183bd8d3b6636722c922fcb66d4843c4.pdf}
-\caption{Devicetree Example}\label{devicetree-basics:example-simple-devicetree}\label{devicetree-basics:id3}\end{figure}
-
-
-\section{Devicetree Structure and Conventions}
-\label{devicetree-basics:devicetree-structure-and-conventions}
-
-\subsection{Node Names}
-\label{devicetree-basics:node-names}\label{devicetree-basics:sect-node-names}
-
-\subsubsection{Node Name Requirements}
-\label{devicetree-basics:node-name-requirements}
-Each node in the devicetree is named according to the following
-convention:
-\begin{quote}
-
-\code{node-name@unit-address}
-\end{quote}
-
-The \emph{node-name} component specifies the name of the node. It shall be 1
-to 31 characters in length and consist solely of characters from the set
-of characters in \hyperref[devicetree-basics:node-name-characters]{Table \ref{devicetree-basics:node-name-characters}}.
-
-
-\begin{threeparttable}
-\capstart\caption{Valid characters for node names}\label{devicetree-basics:node-name-characters}\label{devicetree-basics:id4}
-\begin{tabulary}{\linewidth}{| c p{8cm} |}
-\hline
-\textsf{\relax 
-Character
-} & \textsf{\relax 
-Description
-}\\
-\hline
-\code{0-9}
- & 
-digit
-\\
-\hline
-\code{a-z}
- & 
-lowercase letter
-\\
-\hline
-\code{A-Z}
- & 
-uppercase letter
-\\
-\hline
-\code{,}
- & 
-comma
-\\
-\hline
-\code{.}
- & 
-period
-\\
-\hline
-\code{\_}
- & 
-underscore
-\\
-\hline
-\code{+}
- & 
-plus sign
-\\
-\hline
-\code{-}
- & 
-dash
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-The \emph{node-name} shall start with a lower or uppercase character and
-should describe the general class of device.
-
-The \emph{unit-address} component of the name is specific to the bus type on
-which the node sits. It consists of one or more ASCII characters from
-the set of characters in \hyperref[devicetree-basics:node-name-characters]{Table \ref{devicetree-basics:node-name-characters}}. The
-unit-address must match the first
-address specified in the \emph{reg} property of the node. If the node has no
-\emph{reg} property, the \emph{@unit-address} must be omitted and the
-\emph{node-name} alone differentiates the node from other nodes at the same
-level in the tree. The binding for a particular bus may specify
-additional, more specific requirements for the format of \emph{reg} and the
-\emph{unit-address}.
-
-The root node does not have a node-name or unit-address. It is
-identified by a forward slash (/).
-\begin{figure}[htbp]
-\centering
-\capstart
-
-\includegraphics{graphviz-8bc6c34d442f7e613c5d327992e204083ddaf50f.pdf}
-\caption{Examples of Node Names}\label{devicetree-basics:example-nodenames}\label{devicetree-basics:id5}\end{figure}
-
-In \hyperref[devicetree-basics:example-nodenames]{Fig. \ref{devicetree-basics:example-nodenames}}:
-\begin{itemize}
-\item {} 
-The nodes with the name cpu are distinguished by their unit-address
-values of 0 and 1.
-
-\item {} 
-The nodes with the name Ethernet are distinguished by their
-unit-address values of FE001000 and FE002000.
-
-\end{itemize}
-
-
-\subsection{Generic Names Recommendation}
-\label{devicetree-basics:generic-names-recommendation}
-The name of a node should be somewhat generic, reflecting the function
-of the device and not its precise programming model. If appropriate, the
-name should be one of the following choices:
-\begin{itemize}\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}
-\item {} 
-atm
-
-\item {} 
-cache-controller
-
-\item {} 
-compact-flash
-
-\item {} 
-can
-
-\item {} 
-cpu
-
-\item {} 
-crypto
-
-\item {} 
-disk
-
-\item {} 
-display
-
-\item {} 
-dma-controller
-
-\item {} 
-ethernet
-
-\item {} 
-ethernet-phy
-
-\item {} 
-fdc
-
-\item {} 
-flash
-
-\item {} 
-gpio
-
-\item {} 
-i2c
-
-\item {} 
-ide
-
-\item {} 
-interrupt-controller
-
-\item {} 
-isa
-
-\item {} 
-keyboard
-
-\item {} 
-mdio
-
-\item {} 
-memory
-
-\item {} 
-memory-controller
-
-\item {} 
-mouse
-
-\item {} 
-nvram
-
-\item {} 
-parallel
-
-\item {} 
-pc-card
-
-\item {} 
-pci
-
-\item {} 
-pcie
-
-\item {} 
-rtc
-
-\item {} 
-sata
-
-\item {} 
-scsi
-
-\item {} 
-serial
-
-\item {} 
-sound
-
-\item {} 
-spi
-
-\item {} 
-timer
-
-\item {} 
-usb
-
-\item {} 
-vme
-
-\item {} 
-watchdog
-
-\end{itemize}
-
-
-\subsection{Path Names}
-\label{devicetree-basics:path-names}
-A node in the devicetree can be uniquely identified by specifying the
-full path from the root node, through all descendant nodes, to the
-desired node.
-
-The convention for specifying a device path is:
-\begin{quote}
-
-\code{/node-name-1/node-name-2/node-name-N}
-\end{quote}
-
-For example, in \hyperref[devicetree-basics:example-nodenames]{Fig. \ref{devicetree-basics:example-nodenames}}, the device path to cpu \#1 would be:
-\begin{quote}
-
-\code{/cpus/cpu@1}
-\end{quote}
-
-The path to the root node is /.
-
-A unit address may be omitted if the full path to the node is
-unambiguous.
-
-If a client program encounters an ambiguous path, its behavior is
-undefined.
-
-
-\subsection{Properties}
-\label{devicetree-basics:properties}
-Each node in the devicetree has properties that describe the
-characteristics of the node. Properties consist of a name and a value.
-
-
-\subsubsection{Property Names}
-\label{devicetree-basics:property-names}
-Property names are strings of 1 to 31 characters from the characters show in
-\hyperref[devicetree-basics:property-name-characters]{Table \ref{devicetree-basics:property-name-characters}}
-
-
-\begin{threeparttable}
-\capstart\caption{Valid characters for property names}\label{devicetree-basics:property-name-characters}\label{devicetree-basics:id6}
-\begin{tabulary}{\linewidth}{| c p{8cm} |}
-\hline
-\textsf{\relax 
-Character
-} & \textsf{\relax 
-Description
-}\\
-\hline
-\code{0-9}
- & 
-digit
-\\
-\hline
-\code{a-z}
- & 
-lowercase letter
-\\
-\hline
-\code{A-Z}
- & 
-uppercase letter
-\\
-\hline
-\code{,}
- & 
-comma
-\\
-\hline
-\code{.}
- & 
-period
-\\
-\hline
-\code{\_}
- & 
-underscore
-\\
-\hline
-\code{+}
- & 
-plus sign
-\\
-\hline
-\code{?}
- & 
-question mark
-\\
-\hline
-\code{\#}
- & 
-hash
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-Nonstandard property names should specify a unique string prefix, such
-as a stock ticker symbol, identifying the name of the company or
-organization that defined the property. Examples:
-\begin{quote}
-
-\begin{DUlineblock}{0em}
-\item[] \code{fsl,channel-fifo-len}
-\item[] \code{ibm,ppc-interrupt-server\#s}
-\item[] \code{linux,network-index}
-\end{DUlineblock}
-\end{quote}
-
-
-\subsubsection{Property Values}
-\label{devicetree-basics:sect-property-values}\label{devicetree-basics:property-values}
-A property value is an array of zero or more bytes that contain
-information associated with the property.
-
-Properties might have an empty value if conveying true-false
-information. In this case, the presence or absence of the property is
-sufficiently descriptive.
-
-\hyperref[devicetree-basics:property-values-table]{Table \ref{devicetree-basics:property-values-table}} describes the set of basic value types defined by the DTSpec.
-
-\begin{longtable}{| p{4cm} p{12cm} |}
-\caption{Property values}\label{devicetree-basics:property-values-table}\\
-\hline
-\textsf{\relax 
-Value
-} & \textsf{\relax 
-Description
-}\\
-\hline\endfirsthead
-
-\multicolumn{2}{c}%
-{{\tablecontinued{\tablename\ \thetable{} -- continued from previous page}}} \\
-\hline
-\textsf{\relax 
-Value
-} & \textsf{\relax 
-Description
-}\\
-\hline\endhead
-
-\hline \multicolumn{2}{|r|}{{\tablecontinued{Continued on next page}}} \\ \hline
-\endfoot
-
-\endlastfoot
-
-
-\code{\textless{}empty\textgreater{}}
- & 
-Value is empty. Used for conveying true-false information, when
-the presence or absence of the property itself is sufficiently
-descriptive.
-\\
-\hline
-\code{\textless{}u32\textgreater{}}
- & 
-A 32-bit integer in big-endian format. Example: the 32-bit value
-0x11223344 would be represented in memory as:
-\begin{quote}
-
-\begin{OriginalVerbatim}[commandchars=\\\{\}]
-address    11
-address+1  22
-address+2  33
-address+3  44
-\end{OriginalVerbatim}
-\end{quote}
-\\
-\hline
-\code{\textless{}u64\textgreater{}}
- & 
-Represents a 64-bit integer in big-endian format. Consists of
-two \code{\textless{}u32\textgreater{}} values where the first value contains the most
-significant bits of the integer and the second value contains
-the least significant bits.
-
-Example: the 64-bit value 0x1122334455667788 would be
-represented as two cells as: \code{\textless{}0x11223344 0x55667788\textgreater{}}.
-
-The value would be represented in memory as:
-\begin{quote}
-
-\begin{OriginalVerbatim}[commandchars=\\\{\}]
-  address  11
-address+1  22
-address+2  33
-address+3  44
-address+4  55
-address+5  66
-address+6  77
-address+7  88
-\end{OriginalVerbatim}
-\end{quote}
-\\
-\hline
-\code{\textless{}string\textgreater{}}
- & 
-Strings are printable and null-terminated. Example: the string
-``hello'' would be represented in memory as:
-\begin{quote}
-
-\begin{OriginalVerbatim}[commandchars=\\\{\}]
-  address  68  \PYGZsq{}h\PYGZsq{}
-address+1  65  \PYGZsq{}e\PYGZsq{}
-address+2  6C  \PYGZsq{}l\PYGZsq{}
-address+3  6C  \PYGZsq{}l\PYGZsq{}
-address+4  6F  \PYGZsq{}o\PYGZsq{}
-address+5  00  \PYGZsq{}\PYGZbs{}0\PYGZsq{}
-\end{OriginalVerbatim}
-\end{quote}
-\\
-\hline
-\code{\textless{}prop-encoded-array\textgreater{}}
- & 
-Format is specific to the property. See the property definition.
-\\
-\hline
-\code{\textless{}phandle\textgreater{}}
- & 
-A \code{\textless{}u32\textgreater{}} value. A \emph{phandle} value is a way to reference another
-node in the devicetree. Any node that can be referenced defines
-a phandle property with a unique \code{\textless{}u32\textgreater{}} value. That number
-is used for the value of properties with a phandle value
-type.
-\\
-\hline
-\code{\textless{}stringlist\textgreater{}}
- & 
-A list of \code{\textless{}string\textgreater{}} values concatenated together.
-
-Example: The string list ``hello'',''world'' would be represented in
-memory as:
-\begin{quote}
-
-\begin{OriginalVerbatim}[commandchars=\\\{\}]
-   address  68  \PYGZsq{}h\PYGZsq{}
- address+1  65  \PYGZsq{}e\PYGZsq{}
- address+2  6C  \PYGZsq{}l\PYGZsq{}
- address+3  6C  \PYGZsq{}l\PYGZsq{}
- address+4  6F  \PYGZsq{}o\PYGZsq{}
- address+5  00  \PYGZsq{}\PYGZbs{}0\PYGZsq{}
- address+6  77  \PYGZsq{}w\PYGZsq{}
- address+7  6f  \PYGZsq{}o\PYGZsq{}
- address+8  72  \PYGZsq{}r\PYGZsq{}
- address+9  6C  \PYGZsq{}l\PYGZsq{}
-address+10  64  \PYGZsq{}d\PYGZsq{}
-address+11  00  \PYGZsq{}\PYGZbs{}0\PYGZsq{}
-\end{OriginalVerbatim}
-\end{quote}
-\\
-\hline\end{longtable}
-
-
-
-\section{Standard Properties}
-\label{devicetree-basics:standard-properties}\label{devicetree-basics:sect-standard-properties}
-DTSpec specifies a set of standard properties for device nodes. These
-properties are described in detail in this section. Device nodes defined
-by DTSpec (see Chapter {\hyperref[devicenodes:chapter\string-device\string-node\string-requirements]{\crossref{\DUrole{std,std-ref}{3}}}}) may specify
-additional requirements or constraints regarding the use of the standard
-properties. Chapter {\hyperref[device\string-bindings:chapter\string-device\string-bindings]{\crossref{\DUrole{std,std-ref}{4}}}} describes the representation
-of specific devices may also specify additional requirements.
-
-\begin{notice}{note}{Note:}
-All examples of devicetree nodes in this document use the
-\textsc{DTS} (Devicetree Source) format for specifying nodes and properties.
-\end{notice}
-
-
-\subsection{compatible}
-\label{devicetree-basics:compatible}\label{devicetree-basics:sect-standard-properties-compatible}
-Property name: \code{compatible}
-
-Value type: \code{\textless{}stringlist\textgreater{}}
-
-Description:
-\begin{quote}
-
-The \emph{compatible} property value consists of one or more strings that
-define the specific programming model for the device. This list of
-strings should be used by a client program for device driver selection.
-The property value consists of a concatenated list of null terminated
-strings, from most specific to most general. They allow a device to
-express its compatibility with a family of similar devices, potentially
-allowing a single device driver to match against several devices.
-
-The recommended format is \code{"manufacturer,model"}, where
-\code{manufacturer} is a string describing the name of the manufacturer
-(such as a stock ticker symbol), and \code{model} specifies the model
-number.
-\end{quote}
-
-Example:
-\begin{quote}
-
-\code{compatible = "fsl,mpc8641-uart", "ns16550";}
-
-In this example, an operating system would first try to locate a device
-driver that supported fsl,mpc8641-uart. If a driver was not found, it
-would then try to locate a driver that supported the more general
-ns16550 device type.
-\end{quote}
-
-
-\subsection{model}
-\label{devicetree-basics:model}
-Property name: \code{model}
-
-Value type: \code{\textless{}stringlist\textgreater{}}
-
-Description:
-\begin{quote}
-
-The model property value is a \code{\textless{}string\textgreater{}} that specifies the manufacturer’s
-model number of the device.
-
-The recommended format is: \code{"manufacturer,model"}, where
-\code{manufacturer} is a string describing the name of the manufacturer
-(such as a stock ticker symbol), and model specifies the model number.
-\end{quote}
-
-Example:
-\begin{quote}
-
-\code{model = "fsl,MPC8349EMITX";}
-\end{quote}
-
-
-\subsection{phandle}
-\label{devicetree-basics:sect-standard-properties-phandle}\label{devicetree-basics:phandle}
-Property name: \code{phandle}
-
-Value type: \code{\textless{}u32\textgreater{}}
-
-Description:
-\begin{quote}
-
-The \emph{phandle} property specifies a numerical identifier for a node that
-is unique within the devicetree. The \emph{phandle} property value is used
-by other nodes that need to refer to the node associated with the
-property.
-\end{quote}
-
-Example:
-\begin{quote}
-
-See the following devicetree excerpt:
-
-\begin{Verbatim}[commandchars=\\\{\}]
-pic@10000000 \PYGZob{}
-   phandle = \PYGZlt{}1\PYGZgt{};
-   interrupt\PYGZhy{}controller;
-\PYGZcb{};
-\end{Verbatim}
-
-A \emph{phandle} value of 1 is defined. Another device node could reference
-the pic node with a phandle value of 1:
-
-\begin{Verbatim}[commandchars=\\\{\}]
-interrupt\PYGZhy{}parent = \PYGZlt{}1\PYGZgt{};
-\end{Verbatim}
-\end{quote}
-
-\begin{notice}{note}{Note:}
-Older versions of devicetrees may be encountered that contain a
-deprecated form of this property called \code{linux,phandle}. For
-compatibility, a client program might want to support \code{linux,phandle}
-if a \code{phandle} property is not present. The meaning and use of the two
-properties is identical.
-\end{notice}
-
-\begin{notice}{note}{Note:}
-Most devicetrees in \textsc{DTS} (see Appendix A) will not
-contain explicit phandle properties. The DTC tool automatically inserts
-the \code{phandle} properties when the DTS is compiled into the binary DTB
-format.
-\end{notice}
-
-
-\subsection{status}
-\label{devicetree-basics:status}
-Property name: \code{status}
-
-Value type: \code{\textless{}string\textgreater{}}
-
-Description:
-\begin{quote}
-
-The \code{status} property indicates the operational status of a device.
-Valid values are listed and defined in \hyperref[devicetree-basics:table-prop-status-values]{Table \ref{devicetree-basics:table-prop-status-values}}.
-\end{quote}
-
-
-\begin{threeparttable}
-\capstart\caption{Values for status property}\label{devicetree-basics:table-prop-status-values}\label{devicetree-basics:id8}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Value
-} & \textsf{\relax 
-Description
-}\\
-\hline
-\code{"okay"}
- & 
-Indicates the device is operational
-\\
-\hline
-\code{"disabled"}
- & 
-Indicates that the device is not presently operational, but it
-might become operational in the future (for example, something
-is not plugged in, or switched off).
-
-Refer to the device binding for details on what disabled means
-for a given device.
-\\
-\hline
-\code{"fail"}
- & 
-Indicates that the device is not operational. A serious error
-was detected in the device, and it is unlikely to become
-operational without repair.
-\\
-\hline
-\code{"fail-sss"}
- & 
-Indicates that the device is not operational. A serious error
-was detected in the device and it is unlikely to become
-operational without repair. The sss portion of the value is
-specific to the device and indicates the error condition
-detected.
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\subsection{\#address-cells and \#size-cells}
-\label{devicetree-basics:address-cells-and-size-cells}
-Property name: \code{\#address-cells}, \code{\#size-cells}
-
-Value type: \code{\textless{}u32\textgreater{}}
-
-Description:
-\begin{quote}
-
-The \emph{\#address-cells} and \emph{\#size-cells} properties may be used in any
-device node that has children in the devicetree hierarchy and describes
-how child device nodes should be addressed. The \emph{\#address-cells}
-property defines the number of \code{\textless{}u32\textgreater{}} cells used to encode the address
-field in a child node's \emph{reg} property. The \emph{\#size-cells} property
-defines the number of \code{\textless{}u32\textgreater{}} cells used to encode the size field in a
-child node’s \emph{reg} property.
-
-The \emph{\#address-cells} and \emph{\#size-cells} properties are not inherited from
-ancestors in the devicetree. They shall be explicitly defined.
-
-An DTSpec-compliant boot program shall supply \emph{\#address-cells} and
-\emph{\#size-cells} on all nodes that have children.
-
-If missing, a client program should assume a default value of 2 for
-\emph{\#address-cells}, and a value of 1 for \emph{\#size-cells}.
-\end{quote}
-
-Example:
-\begin{quote}
-
-See the following devicetree excerpt:
-
-\begin{Verbatim}[commandchars=\\\{\}]
-soc \PYGZob{}
-   \PYGZsh{}address\PYGZhy{}cells = \PYGZlt{}1\PYGZgt{};
-   \PYGZsh{}size\PYGZhy{}cells = \PYGZlt{}1\PYGZgt{};
-
-   serial \PYGZob{}
-      compatible = \PYGZdq{}ns16550\PYGZdq{};
-      reg = \PYGZlt{}0x4600 0x100\PYGZgt{};
-      clock\PYGZhy{}frequency = \PYGZlt{}0\PYGZgt{};
-      interrupts = \PYGZlt{}0xA 0x8\PYGZgt{};
-      interrupt\PYGZhy{}parent = \PYGZlt{}\PYGZam{}ipic\PYGZgt{};
-   \PYGZcb{};
-\PYGZcb{};
-\end{Verbatim}
-
-In this example, the \emph{\#address-cells} and \emph{\#size-cells} properties of the soc node
-are both set to 1. This setting specifies that one cell is required to
-represent an address and one cell is required to represent the size of
-nodes that are children of this node.
-
-The serial device \emph{reg} property necessarily follows this specification
-set in the parent (soc) node—the address is represented by a single cell
-(0x4600), and the size is represented by a single cell (0x100).
-\end{quote}
-
-
-\subsection{reg}
-\label{devicetree-basics:reg}
-Property name: \code{reg}
-
-Property value: \code{\textless{}prop-encoded-array\textgreater{}} encoded as an arbitraty number of (\emph{address}, \emph{length}) pairs.
-
-Description:
-\begin{quote}
-
-The \emph{reg} property describes the address of the device’s resources
-within the address space defined by its parent bus. Most commonly this
-means the offsets and lengths of memory-mapped IO register blocks, but
-may have a different meaning on some bus types. Addresses in the address
-space defined by root node are cpu real addresses.
-
-The value is a \emph{\textless{}prop-encoded-array\textgreater{}}, composed of an arbitrary number
-of pairs of address and length, \emph{\textless{}address length\textgreater{}}. The number of
-\emph{\textless{}u32\textgreater{}} cells required to specify the address and length are
-bus-specific and are specified by the \emph{\#address-cells} and \emph{\#size-cells}
-properties in the parent of the device node. If the parent node
-specifies a value of 0 for \emph{\#size-cells}, the length field in the value
-of \emph{reg} shall be omitted.
-\end{quote}
-
-Example:
-\begin{quote}
-
-Suppose a device within a system-on-a-chip had two blocks of registers, a
-32-byte block at offset 0x3000 in the SOC and a 256-byte block at offset
-0xFE00. The \emph{reg} property would be encoded as follows (assuming
-\emph{\#address-cells} and \emph{\#size-cells} values of 1):
-\begin{quote}
-
-\code{reg = \textless{}0x3000 0x20 0xFE00 0x100\textgreater{};}
-\end{quote}
-\end{quote}
-
-
-\subsection{virtual-reg}
-\label{devicetree-basics:sect-standard-properties-virtual-reg}\label{devicetree-basics:virtual-reg}
-Property name: \code{virtual-reg}
-
-Value type: \code{\textless{}u32\textgreater{}}
-
-Description:
-\begin{quote}
-
-The \emph{virtual-reg} property specifies an effective address that maps to
-the first physical address specified in the \emph{reg} property of the device
-node. This property enables boot programs to provide client programs
-with virtual-to-physical mappings that have been set up.
-\end{quote}
-
-
-\subsection{ranges}
-\label{devicetree-basics:ranges}\label{devicetree-basics:sect-standard-properties-ranges}
-Property name: \code{ranges}
-
-Value type: \code{\textless{}empty\textgreater{}} or \code{\textless{}prop-encoded-array\textgreater{}} encoded as an arbitrary number of
-(\emph{child-bus-address}, \emph{parent-bus-address}, \emph{length}) triplets.
-
-Description:
-\begin{quote}
-
-The \emph{ranges} property provides a means of defining a mapping or
-translation between the address space of the bus (the child address
-space) and the address space of the bus node’s parent (the parent
-address space).
-
-The format of the value of the \emph{ranges} property is an arbitrary number
-of triplets of (\emph{child-bus-address}, \emph{parent-bus-address}, \emph{length})
-\begin{itemize}
-\item {} 
-The \emph{child-bus-address} is a physical address within the child bus'
-address space. The number of cells to represent the address is bus
-dependent and can be determined from the \emph{\#address-cells} of this node
-(the node in which the \emph{ranges} property appears).
-
-\item {} 
-The \emph{parent-bus-address} is a physical address within the parent bus'
-address space. The number of cells to represent the parent address is
-bus dependent and can be determined from the \emph{\#address-cells} property
-of the node that defines the parent’s address space.
-
-\item {} 
-The \emph{length} specifies the size of the range in the child’s address space. The number
-of cells to represent the size can be determined from the \emph{\#size-cells}
-of this node (the node in which the \emph{ranges} property appears).
-
-\end{itemize}
-
-If the property is defined with an \code{\textless{}empty\textgreater{}} value, it specifies that the
-parent and child address space is identical, and no address translation
-is required.
-
-If the property is not present in a bus node, it is assumed that no
-mapping exists between children of the node and the parent address
-space.
-\end{quote}
-
-Address Translation Example:
-\begin{quote}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-soc \PYGZob{}
-   compatible = \PYGZdq{}simple\PYGZhy{}bus\PYGZdq{};
-   \PYGZsh{}address\PYGZhy{}cells = \PYGZlt{}1\PYGZgt{};
-   \PYGZsh{}size\PYGZhy{}cells = \PYGZlt{}1\PYGZgt{};
-   ranges = \PYGZlt{}0x0 0xe0000000 0x00100000\PYGZgt{};
-
-   serial \PYGZob{}
-      device\PYGZus{}type = \PYGZdq{}serial\PYGZdq{};
-      compatible = \PYGZdq{}ns16550\PYGZdq{};
-      reg = \PYGZlt{}0x4600 0x100\PYGZgt{};
-      clock\PYGZhy{}frequency = \PYGZlt{}0\PYGZgt{};
-      interrupts = \PYGZlt{}0xA 0x8\PYGZgt{};
-      interrupt\PYGZhy{}parent = \PYGZlt{} \PYGZam{}ipic \PYGZgt{};
-   \PYGZcb{};
-\PYGZcb{};
-\end{Verbatim}
-
-The \code{soc} node specifies a \emph{ranges} property of
-\begin{quote}
-
-\code{\textless{}0x0 0xe0000000 0x00100000\textgreater{};}
-\end{quote}
-
-This property value specifies that for an 1024KB range of address space,
-a child node addressed at physical 0x0 maps to a parent address of
-physical 0xe0000000. With this mapping, the \code{serial} device node can
-be addressed by a load or store at address 0xe0004600, an offset of
-0x4600 (specified in \emph{reg}) plus the 0xe0000000 mapping specified in
-\emph{ranges}.
-\end{quote}
-
-
-\subsection{dma-ranges}
-\label{devicetree-basics:dma-ranges}
-Property name: \code{dma-ranges}
-
-Value type: \code{\textless{}empty\textgreater{}} or \code{\textless{}prop-encoded-array\textgreater{}} encoded as an arbitrary number of
-(\emph{child-bus-address}, \emph{parent-bus-address}, \emph{length}) triplets.
-
-Description:
-\begin{quote}
-
-The \emph{dma-ranges} property is used to describe the direct memory access
-(DMA) structure of a memory-mapped bus whose devicetree parent can be
-accessed from DMA operations originating from the bus. It provides a
-means of defining a mapping or translation between the physical address
-space of the bus and the physical address space of the parent of the
-bus.
-
-The format of the value of the \emph{dma-ranges} property is an arbitrary
-number of triplets of (\emph{child-bus-address}, \emph{parent-bus-address},
-\emph{length}). Each triplet specified describes a contiguous DMA address
-range.
-\begin{itemize}
-\item {} 
-The \emph{child-bus-address} is a physical address within the child bus'
-address space. The number of cells to represent the address depends
-on the bus and can be determined from the \emph{\#address-cells} of this
-node (the node in which the \emph{dma-ranges} property appears).
-
-\item {} 
-The \emph{parent-bus-address} is a physical address within the parent bus'
-address space. The number of cells to represent the parent address is
-bus dependent and can be determined from the \emph{\#address-cells}
-property of the node that defines the parent’s address space.
-
-\item {} 
-The \emph{length} specifies the size of the range in the child’s address
-space. The number of cells to represent the size can be determined
-from the \emph{\#size-cells} of this node (the node in which the dma-ranges
-property appears).
-
-\end{itemize}
-\end{quote}
-
-
-\subsection{name (deprecated)}
-\label{devicetree-basics:name-deprecated}
-Property name: \code{name}
-
-Value type: \code{\textless{}string\textgreater{}}
-
-Description:
-\begin{quote}
-
-The \emph{name} property is a string specifying the name of the node. This
-property is deprecated, and its use is not recommended. However, it
-might be used in older non-DTSpec-compliant devicetrees. Operating
-system should determine a node’s name based on the \emph{name} component of
-the node name (see section {\hyperref[devicetree\string-basics:sect\string-node\string-names]{\crossref{\DUrole{std,std-ref}{2.2.1}}}}).
-\end{quote}
-
-
-\subsection{device\_type (deprecated)}
-\label{devicetree-basics:device-type-deprecated}
-Property name: \code{device\_type}
-
-Value type: \code{\textless{}string\textgreater{}}
-
-Description:
-\begin{quote}
-
-The \emph{device\_type} property was used in IEEE 1275 to describe the
-device’s FCode programming model. Because DTSpec does not have FCode, new
-use of the property is deprecated, and it should be included only on cpu
-and memory nodes for compatibility with IEEE 1275–derived devicetrees.
-\end{quote}
-
-
-\section{Interrupts and Interrupt Mapping}
-\label{devicetree-basics:sect-interrupts}\label{devicetree-basics:interrupts-and-interrupt-mapping}
-DTSpec adopts the interrupt tree model of representing interrupts
-specified in \emph{Open Firmware Recommended Practice: Interrupt Mapping,
-Version 0.9} \phantomsection\label{devicetree-basics:id1}{\hyperref[references:b7]{\crossref{{[}b7{]}}}}. Within the devicetree a logical interrupt tree exists
-that represents the hierarchy and routing of interrupts in the platform
-hardware. While generically referred to as an interrupt tree it is more
-technically a directed acyclic graph.
-
-The physical wiring of an interrupt source to an interrupt controller is
-represented in the devicetree with the \emph{interrupt-parent} property.
-Nodes that represent interrupt-generating devices contain an
-\emph{interrupt-parent} property which has a \emph{phandle} value that points to
-the device to which the device’s interrupts are routed, typically an
-interrupt controller. If an interrupt-generating device does not have an
-\emph{interrupt-parent} property, its interrupt parent is assumed to be its
-devicetree parent.
-
-Each interrupt generating device contains an \emph{interrupts} property with
-a value describing one or more interrupt sources for that device. Each
-source is represented with information called an \emph{interrupt specifier}.
-The format and meaning of an \emph{interrupt specifier} is interrupt domain
-specific, i.e., it is dependent on properties on the node at the root of
-its interrupt domain. The \emph{\#interrupt-cells} property is used by the
-root of an interrupt domain to define the number of \code{\textless{}u32\textgreater{}} values
-needed to encode an interrupt specifier. For example, for an Open PIC
-interrupt controller, an interrupt-specifer takes two 32-bit values and
-consists of an interrupt number and level/sense information for the
-interrupt.
-
-An interrupt domain is the context in which an interrupt specifier is
-interpreted. The root of the domain is either (1) an interrupt
-controller or (2) an interrupt nexus.
-\begin{enumerate}
-\item {} 
-An \emph{interrupt controller} is physical device and will need a driver
-to handle interrupts routed through it. It may also cascade into
-another interrupt domain. An interrupt controller is specified by the
-presence of an \emph{interrupt-controller} property on that node in the
-devicetree.
-
-\item {} 
-An \emph{interrupt nexus} defines a translation between one interrupt
-domain and another. The translation is based on both domain-specific
-and bus-specific information. This translation between domains is
-performed with the \emph{interrupt-map} property. For example, a PCI
-controller device node could be an interrupt nexus that defines a
-translation from the PCI interrupt namespace (INTA, INTB, etc.) to an
-interrupt controller with Interrupt Request (IRQ) numbers.
-
-\end{enumerate}
-
-The root of the interrupt tree is determined when traversal of the
-interrupt tree reaches an interrupt controller node without an
-\emph{interrupts} property and thus no explicit interrupt parent.
-
-See \hyperref[devicetree-basics:example-interrupt-tree]{Fig. \ref{devicetree-basics:example-interrupt-tree}} for an example of a graphical
-representation of a devicetree with interrupt parent relationships shown. It
-shows both the natural structure of the devicetree as well as where each node
-sits in the logical interrupt tree.
-\begin{figure}[htbp]
-\centering
-\capstart
-
-\includegraphics{graphviz-1d3954672eca688030b49a13a35b6714d9abdcd5.pdf}
-\caption{Example of the interrupt tree}\label{devicetree-basics:example-interrupt-tree}\label{devicetree-basics:id9}\end{figure}
-
-In the example shown in \hyperref[devicetree-basics:example-interrupt-tree]{Fig. \ref{devicetree-basics:example-interrupt-tree}}:
-\begin{itemize}
-\item {} 
-The \code{open-pic} interrupt controller is the root of the interrupt tree.
-
-\item {} 
-The interrupt tree root has three children—devices that route their
-interrupts directly to the \code{open-pic}
-\begin{itemize}
-\item {} 
-device1
-
-\item {} 
-PCI host controller
-
-\item {} 
-GPIO Controller
-
-\end{itemize}
-
-\item {} 
-Three interrupt domains exist; one rooted at the \code{open-pic} node,
-one at the \code{PCI host bridge} node, and one at the
-\code{GPIO Controller} node.
-
-\item {} 
-There are two nexus nodes; one at the \code{PCI host bridge} and one at
-the \code{GPIO controller}.
-
-\end{itemize}
-
-
-\subsection{Properties for Interrupt Generating Devices}
-\label{devicetree-basics:properties-for-interrupt-generating-devices}
-
-\subsubsection{interrupts}
-\label{devicetree-basics:interrupts}
-Property: \code{interrupts}
-
-Value type: \code{\textless{}prop-encoded-array\textgreater{}} encoded as arbitrary number of
-interrupt specifiers
-
-Description:
-\begin{quote}
-
-The \emph{interrupts} property of a device node defines the interrupt or
-interrupts that are generated by the device. The value of the
-\emph{interrupts} property consists of an arbitrary number of interrupt
-specifiers. The format of an interrupt specifier is defined by the
-binding of the interrupt domain root.
-\end{quote}
-
-Example:
-\begin{quote}
-
-A common definition of an interrupt specifier in an open PIC–compatible
-interrupt domain consists of two cells; an interrupt number and
-level/sense information. See the following example, which defines a
-single interrupt specifier, with an interrupt number of 0xA and
-level/sense encoding of 8.
-\begin{quote}
-
-\code{interrupts = \textless{}0xA 8\textgreater{};}
-\end{quote}
-\end{quote}
-
-
-\subsubsection{interrupt-parent}
-\label{devicetree-basics:interrupt-parent}
-Property: \code{interrupt-parent}
-
-Value type: \code{\textless{}phandle\textgreater{}}
-
-Description:
-\begin{quote}
-
-Because the hierarchy of the nodes in the interrupt tree might not match
-the devicetree, the \emph{interrupt-parent} property is available to make
-the definition of an interrupt parent explicit. The value is the phandle
-to the interrupt parent. If this property is missing from a device, its
-interrupt parent is assumed to be its devicetree parent.
-\end{quote}
-
-
-\subsection{Properties for Interrupt Controllers}
-\label{devicetree-basics:properties-for-interrupt-controllers}
-
-\subsubsection{\#interrupt-cells}
-\label{devicetree-basics:interrupt-cells}
-Property: \code{\#interrupt-cells}
-
-Value type: \code{\textless{}u32\textgreater{}}
-
-Description:
-\begin{quote}
-
-The \emph{\#interrupt-cells} property defines the number of cells required to
-encode an interrupt specifier for an interrupt domain.
-\end{quote}
-
-
-\subsubsection{interrupt-controller}
-\label{devicetree-basics:interrupt-controller}
-Property: \code{interrupt-controller}
-
-Value type: \code{\textless{}empty\textgreater{}}
-
-Description:
-\begin{quote}
-
-The presence of an \emph{interrupt-controller} property defines a node as an
-interrupt controller node.
-\end{quote}
-
-
-\subsection{Interrupt Nexus Properties}
-\label{devicetree-basics:interrupt-nexus-properties}
-An interrupt nexus node shall have an \emph{\#interrupt-cells} property.
-
-
-\subsubsection{interrupt-map}
-\label{devicetree-basics:interrupt-map}
-Property: \code{interrupt-map}
-
-Value type: \code{\textless{}prop-encoded-array\textgreater{}} encoded as an arbitrary number of
-interrupt mapping entries.
-
-Description:
-\begin{quote}
-
-An \emph{interrupt-map} is a property on a nexus node that bridges one
-interrupt domain with a set of parent interrupt domains and specifies
-how interrupt specifiers in the child domain are mapped to their
-respective parent domains.
-
-The interrupt map is a table where each row is a mapping entry
-consisting of five components: \emph{child unit address}, \emph{child interrupt
-specifier}, \emph{interrupt-parent}, \emph{parent unit address}, \emph{parent interrupt
-specifier}.
-\begin{description}
-\item[{child unit address}] \leavevmode
-The unit address of the child node being mapped. The number of
-32-bit cells required to specify this is described by the
-\emph{\#address-cells} property of the bus node on which the child is
-located.
-
-\item[{child interrupt specifier}] \leavevmode
-The interrupt specifier of the child node being mapped. The number
-of 32-bit cells required to specify this component is described by
-the \emph{\#interrupt-cells} property of this node—the nexus node
-containing the \emph{interrupt-map} property.
-
-\item[{interrupt-parent}] \leavevmode
-A single \emph{\textless{}phandle\textgreater{}} value that points to the interrupt parent to
-which the child domain is being mapped.
-
-\item[{parent unit address}] \leavevmode
-The unit address in the domain of the interrupt parent. The number
-of 32-bit cells required to specify this address is described by the
-\emph{\#address-cells} property of the node pointed to by the
-interrupt-parent field.
-
-\item[{parent interrupt specifier}] \leavevmode
-The interrupt specifier in the parent domain. The number of 32-bit
-cells required to specify this component is described by the
-\emph{\#interrupt-cells} property of this node—the nexus node containing
-the \emph{interrupt-map} property.
-
-\end{description}
-
-Lookups are performed on the interrupt mapping table by matching a
-unit-address/interrupt specifier pair against the child components in
-the interrupt-map. Because some fields in the unit interrupt specifier
-may not be relevant, a mask is applied before the lookup is done. This
-mask is defined in the \emph{interrupt-map-mask} property (see section
-{\hyperref[devicetree\string-basics:sect\string-interrupt\string-map\string-mask]{\crossref{\DUrole{std,std-ref}{2.4.3.2}}}}).
-
-\begin{notice}{note}{Note:}
-Both the child node and the interrupt parent node are required to
-have \emph{\#address-cells} and \emph{\#interrupt-cells} properties defined. If a
-unit address component is not required, \emph{\#address-cells} shall be
-explicitly defined to be zero.
-\end{notice}
-\end{quote}
-
-
-\subsubsection{interrupt-map-mask}
-\label{devicetree-basics:sect-interrupt-map-mask}\label{devicetree-basics:interrupt-map-mask}
-Property: \code{interrupt-map-mask}
-
-Value type: \code{\textless{}prop-encoded-array\textgreater{}} encoded as a bit mask
-
-Description:
-\begin{quote}
-
-An \emph{interrupt-map-mask} property is specified for a nexus node in the
-interrupt tree. This property specifies a mask that is applied to the
-incoming unit interrupt specifier being looked up in the table specified
-in the \emph{interrupt-map} property.
-\end{quote}
-
-
-\subsubsection{\#interrupt-cells}
-\label{devicetree-basics:id2}
-Property: \code{\#interrupt-cells}
-
-Value type: \code{\textless{}u32\textgreater{}}
-
-Description:
-\begin{quote}
-
-The \emph{\#interrupt-cells} property defines the number of cells required to
-encode an interrupt specifier for an interrupt domain.
-\end{quote}
-
-
-\subsection{Interrupt Mapping Example}
-\label{devicetree-basics:interrupt-mapping-example}
-The following shows the representation of a fragment of a devicetree with
-a PCI bus controller and a sample interrupt map for describing the
-interrupt routing for two PCI slots (IDSEL 0x11,0x12). The INTA, INTB,
-INTC, and INTD pins for slots 1 and 2 are wired to the Open PIC
-interrupt controller.
-\phantomsection\label{devicetree-basics:example-interrupt-mapping}
-\def\SphinxLiteralBlockLabel{\label{devicetree-basics:example-interrupt-mapping}}
-\begin{Verbatim}[commandchars=\\\{\}]
-soc \PYGZob{}
-   compatible = \PYGZdq{}simple\PYGZhy{}bus\PYGZdq{};
-   \PYGZsh{}address\PYGZhy{}cells = \PYGZlt{}1\PYGZgt{};
-   \PYGZsh{}size\PYGZhy{}cells = \PYGZlt{}1\PYGZgt{};
-
-   open\PYGZhy{}pic \PYGZob{}
-      clock\PYGZhy{}frequency = \PYGZlt{}0\PYGZgt{};
-      interrupt\PYGZhy{}controller;
-      \PYGZsh{}address\PYGZhy{}cells = \PYGZlt{}0\PYGZgt{};
-      \PYGZsh{}interrupt\PYGZhy{}cells = \PYGZlt{}2\PYGZgt{};
-   \PYGZcb{};
-
-   pci \PYGZob{}
-      \PYGZsh{}interrupt\PYGZhy{}cells = \PYGZlt{}1\PYGZgt{};
-      \PYGZsh{}size\PYGZhy{}cells = \PYGZlt{}2\PYGZgt{};
-      \PYGZsh{}address\PYGZhy{}cells = \PYGZlt{}3\PYGZgt{};
-      interrupt\PYGZhy{}map\PYGZhy{}mask = \PYGZlt{}0xf800 0 0 7\PYGZgt{};
-      interrupt\PYGZhy{}map = \PYGZlt{}
-         /* IDSEL 0x11 \PYGZhy{} PCI slot 1 */
-         0x8800 0 0 1 \PYGZam{}open\PYGZhy{}pic 2 1 /* INTA */
-         0x8800 0 0 2 \PYGZam{}open\PYGZhy{}pic 3 1 /* INTB */
-         0x8800 0 0 3 \PYGZam{}open\PYGZhy{}pic 4 1 /* INTC */
-         0x8800 0 0 4 \PYGZam{}open\PYGZhy{}pic 1 1 /* INTD */
-         /* IDSEL 0x12 \PYGZhy{} PCI slot 2 */
-         0x9000 0 0 1 \PYGZam{}open\PYGZhy{}pic 3 1 /* INTA */
-         0x9000 0 0 2 \PYGZam{}open\PYGZhy{}pic 4 1 /* INTB */
-         0x9000 0 0 3 \PYGZam{}open\PYGZhy{}pic 1 1 /* INTC */
-         0x9000 0 0 4 \PYGZam{}open\PYGZhy{}pic 2 1 /* INTD */
-      \PYGZgt{};
-   \PYGZcb{};
-\PYGZcb{};
-\end{Verbatim}
-\let\SphinxLiteralBlockLabel\empty
-
-One Open PIC interrupt controller is represented and is identified as an
-interrupt controller with an \emph{interrupt-controller} property.
-
-Each row in the interrupt-map table consists of five parts: a child unit
-address and interrupt specifier, which is mapped to an \emph{interrupt-parent}
-node with a specified parent unit address and interrupt specifier.
-\begin{itemize}
-\item {} 
-For example, the first row of the interrupt-map table specifies the
-mapping for INTA of slot 1. The components of that row are shown here
-
-\begin{DUlineblock}{0em}
-\item[] child unit address: \code{0x8800 0 0}
-\item[] child interrupt specifier: \code{1}
-\item[] interrupt parent: \code{\&open-pic}
-\item[] parent unit address: (empty because \code{\#address-cells = \textless{}0\textgreater{}} in the
-open-pic node)
-\item[] parent interrupt specifier: \code{2 1}
-\end{DUlineblock}
-\begin{itemize}
-\item {} 
-The child unit address is \code{\textless{}0x8800 0 0\textgreater{}}. This value is encoded
-with three 32-bit cells, which is determined by the value of the
-\emph{\#address-cells} property (value of 3) of the PCI controller. The
-three cells represent the PCI address as described by the binding for
-the PCI bus.
-\begin{itemize}
-\item {} 
-The encoding includes the bus number (0x0 \textless{}\textless{} 16), device number
-(0x11 \textless{}\textless{} 11), and function number (0x0 \textless{}\textless{} 8).
-
-\end{itemize}
-
-\item {} 
-The child interrupt specifier is \code{\textless{}1\textgreater{}}, which specifies INTA as
-described by the PCI binding. This takes one 32-bit cell as specified
-by the \emph{\#interrupt-cells} property (value of 1) of the PCI
-controller, which is the child interrupt domain.
-
-\item {} 
-The interrupt parent is specified by a phandle which points to the
-interrupt parent of the slot, the Open PIC interrupt controller.
-
-\item {} 
-The parent has no unit address because the parent interrupt domain
-(the open-pic node) has an \emph{\#address-cells} value of \code{\textless{}0\textgreater{}}.
-
-\item {} 
-The parent interrupt specifier is \code{\textless{}2 1\textgreater{}}. The number of cells to
-represent the interrupt specifier (two cells) is determined by the
-\emph{\#interrupt-cells} property on the interrupt parent, the open-pic
-node.
-\begin{itemize}
-\item {} 
-The value \code{\textless{}2 1\textgreater{}} is a value specified by the device binding for
-the Open PIC interrupt controller (see section
-{\hyperref[device\string-bindings:sect\string-bindings\string-simple\string-bus]{\crossref{\DUrole{std,std-ref}{4.5}}}}). The value \code{\textless{}2\textgreater{}} specifies the
-physical interrupt source number on the interrupt controller to
-which INTA is wired. The value \code{\textless{}1\textgreater{}} specifies the level/sense
-encoding.
-
-\end{itemize}
-
-\end{itemize}
-
-\end{itemize}
-
-In this example, the interrupt-map-mask property has a value of \code{\textless{}0xf800
-0 0 7\textgreater{}}. This mask is applied to a child unit interrupt specifier before
-performing a lookup in the interruptmap table.
-
-To perform a lookup of the open-pic interrupt source number for INTB for
-IDSEL 0x12 (slot 2), function 0x3, the following steps would be
-performed:
-\begin{itemize}
-\item {} 
-The child unit address and interrupt specifier form the value
-\code{\textless{}0x9300 0 0 2\textgreater{}}.
-\begin{itemize}
-\item {} 
-The encoding of the address includes the bus number (0x0 \textless{}\textless{} 16),
-device number (0x12 \textless{}\textless{} 11), and function number (0x3 \textless{}\textless{} 8).
-
-\item {} 
-The interrupt specifier is 2, which is the encoding for INTB as
-per the PCI binding.
-
-\end{itemize}
-
-\item {} 
-The interrupt-map-mask value \code{\textless{}0xf800 0 0 7\textgreater{}} is applied, giving a
-result of \code{\textless{}0x9000 0 0 2\textgreater{}}.
-
-\item {} 
-That result is looked up in the \emph{interrupt-map} table, which maps to
-the parent interrupt specifier \code{\textless{}4 1\textgreater{}}.
-
-\end{itemize}
-
-
-\chapter{Device Node Requirements}
-\label{devicenodes:chapter-device-node-requirements}\label{devicenodes:device-node-requirements}\label{devicenodes::doc}
-
-\section{Base Device Node Types}
-\label{devicenodes:base-device-node-types}
-The sections that follow specify the requirements for the base set of
-device nodes required in an DTSpec-compliant devicetree.
-
-All devicetrees shall have a root node and the following nodes shall be
-present at the root of all devicetrees:
-\begin{itemize}
-\item {} 
-One \code{/cpus} node
-
-\item {} 
-At least one \code{memory} node
-
-\end{itemize}
-
-
-\section{Root node}
-\label{devicenodes:root-node}
-The devicetree has a single root node of which all other device nodes
-are descendants. The full path to the root node is \code{/}.
-
-
-\begin{threeparttable}
-\capstart\caption{Root Node Properties}\label{devicenodes:id2}
-\begin{tabulary}{\linewidth}{| l c l J |}
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline
-\code{\#address-cells}
- & 
-R
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the number of \code{\textless{}u32\textgreater{}} cells to
-represent the address in the \code{reg} property in
-children of root.
-\\
-\hline
-\code{\#size-cells}
- & 
-R
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the number of \code{\textless{}u32\textgreater{}} cells to
-represent the size in the \code{reg} property in
-children of root.
-\\
-\hline
-\code{model}
- & 
-R
- & 
-\code{\textless{}string\textgreater{}}
- & 
-Specifies a string that uniquely identifies
-the model of the system board. The recommended
-format is ``manufacturer,model-number''.
-\\
-\hline
-\code{compatible}
- & 
-R
- & 
-\code{\textless{}stringlist\textgreater{}}
- & 
-Specifies a list of platform architectures
-with which this platform is compatible. This
-property can be used by operating systems in
-selecting platform specific code. The
-recommended form of the property value is:
-
-\code{"manufacturer,model"}
-
-For example:
-
-\code{compatible = "fsl,mpc8572ds"}
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-\begin{notice}{note}{Note:}
-All other standard properties (section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}}) are allowed but are optional.
-\end{notice}
-
-
-\section{\texttt{/aliases} node}
-\label{devicenodes:aliases-node}
-A devicetree may have an aliases node (\code{/aliases}) that defines one or
-more alias properties. The alias node shall be at the root of the devicetree
-and have the node name \code{/aliases}.
-
-Each property of the \code{/aliases} node defines an alias. The property name
-specifies the alias name. The property value specifies the full path to
-a node in the devicetree. For example, the property serial0 =
-\code{"/simple-bus@fe000000/serial@llc500"} defines the alias serial0.
-
-Alias names shall be a lowercase text strings of 1 to 31 characters from
-the following set of characters.
-
-
-\begin{threeparttable}
-\capstart\caption{Valid characters for alias names}\label{devicenodes:id3}
-\begin{tabulary}{\linewidth}{| c p{8cm} |}
-\hline
-\textsf{\relax 
-Character
-} & \textsf{\relax 
-Description
-}\\
-\hline
-0-9
- & 
-digit
-\\
-\hline
-a-z
- & 
-lowercase letter
-\\
-\hline
--
- & 
-dash
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-An alias value is a device path and is encoded as a string. The value
-represents the full path to a node, but the path does not need to refer
-to a leaf node.
-
-A client program may use an alias property name to refer to a full
-device path as all or part of its string value. A client program, when
-considering a string as a device path, shall detect and use the alias.
-
-\textbf{Example}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-aliases \PYGZob{}
-    serial0 = \PYGZdq{}/simple\PYGZhy{}bus@fe000000/serial@llc500\PYGZdq{};
-    ethernet0 = \PYGZdq{}/simple\PYGZhy{}bus@fe000000/ethernet@31c000\PYGZdq{};
-\PYGZcb{}
-\end{Verbatim}
-
-Given the alias serial0, a client program can look at the aliases node
-and determine the alias refers to the device path
-\code{/simple-bus@fe000000/serial@llc500}.
-
-
-\section{\texttt{/memory} node}
-\label{devicenodes:memory-node}
-A memory device node is required for all devicetrees and describes the
-physical memory layout for the system. If a system has multiple ranges
-of memory, multiple memory nodes can be created, or the ranges can be
-specified in the \emph{reg} property of a single memory node.
-
-The name component of the node name (see section {\hyperref[devicetree\string-basics:sect\string-node\string-names]{\crossref{\DUrole{std,std-ref}{2.2.1}}}})
-shall be memory.
-
-The client program may access memory not covered by any memory
-reservations (see section {\hyperref[flattened\string-format:sect\string-fdt\string-memory\string-reservation\string-block]{\crossref{\DUrole{std,std-ref}{5.3}}}})
-using any storage attributes it chooses. However, before changing the
-storage attributes used to access a real page, the client program is
-responsible for performing actions required by the architecture and
-implementation, possibly including flushing the real page from the
-caches. The boot program is responsible for ensuring that, without
-taking any action associated with a change in storage attributes, the
-client program can safely access all memory (including memory covered by
-memory reservations) as WIMG = 0b001x. That is:
-\begin{itemize}
-\item {} 
-not Write Through Required
-
-\item {} 
-not Caching Inhibited
-
-\item {} 
-Memory Coherence
-
-\item {} 
-Required either not Guarded or Guarded
-
-\end{itemize}
-
-If the VLE storage attribute is supported, with VLE=0.
-
-
-\begin{threeparttable}
-\capstart\caption{\texttt{/memory} Node Properties}\label{devicenodes:id4}
-\begin{tabulary}{\linewidth}{| l c l J |}
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline
-\code{device\_type}
- & 
-R
- & 
-\code{\textless{}string\textgreater{}}
- & 
-Value shall be ``memory''
-\\
-\hline
-\code{reg}
- & 
-R
- & 
-\code{\textless{}prop-encoded-array\textgreater{}}
- & 
-Consists of an arbitrary number of address and
-size pairs that specify the physical address
-and size of the memory ranges.
-\\
-\hline
-\code{initial-mapped-area}
- & 
-O
- & 
-\code{\textless{}prop-encoded-array\textgreater{}}
- & 
-Specifies the address and size of the Initial
-Mapped Area
-
-Is a prop-encoded-array consisting of a
-triplet of (effective address, physical
-address, size). The effective and physical
-address shall each be 64-bit (\code{\textless{}u64\textgreater{}} value),
-and the size shall be 32-bits (\code{\textless{}u32\textgreater{}} value).
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-\begin{notice}{note}{Note:}
-All other standard properties (section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}}) are allowed but are optional.
-\end{notice}
-
-\textbf{Examples}
-
-Given a 64-bit Power system with the following physical memory layout:
-\begin{itemize}
-\item {} 
-RAM: starting address 0x0, length 0x80000000 (2GB)
-
-\item {} 
-RAM: starting address 0x100000000, length 0x100000000 (4GB)
-
-\end{itemize}
-
-Memory nodes could be defined as follows, assuming \code{\#address-cells = \textless{}2\textgreater{}}
-and \code{\#size-cells = \textless{}2\textgreater{}}.
-
-\textbf{Example \#1}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-memory@0 \PYGZob{}
-    device\PYGZus{}type = \PYGZdq{}memory\PYGZdq{};
-    reg = \PYGZlt{}0x000000000 0x00000000 0x00000000 0x80000000
-           0x000000001 0x00000000 0x00000001 0x00000000\PYGZgt{};
-\PYGZcb{};
-\end{Verbatim}
-
-\textbf{Example \#2}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-memory@0 \PYGZob{}
-    device\PYGZus{}type = \PYGZdq{}memory\PYGZdq{};
-    reg = \PYGZlt{}0x000000000 0x00000000 0x00000000 0x80000000\PYGZgt{};
-\PYGZcb{};
-memory@100000000 \PYGZob{}
-    device\PYGZus{}type = \PYGZdq{}memory\PYGZdq{};
-    reg = \PYGZlt{}0x000000001 0x00000000 0x00000001 0x00000000\PYGZgt{};
-\PYGZcb{};
-\end{Verbatim}
-
-The \code{reg} property is used to define the address and size of the two
-memory ranges. The 2 GB I/O region is skipped. Note that the
-\code{\#address-cells} and \code{\#size-cells} properties of the root node specify a
-value of 2, which means that two 32-bit cells are required to define the
-address and length for the \code{reg} property of the memory node.
-
-
-\section{\texttt{/chosen} Node}
-\label{devicenodes:chosen-node}
-The \code{/chosen} node does not represent a real device in the system but
-describes parameters chosen or specified by the system firmware at run
-time. It shall be a child of the root node.
-
-
-\begin{threeparttable}
-\capstart\caption{\texttt{/chosen} Node Properties}\label{devicenodes:id5}
-\begin{tabulary}{\linewidth}{| l c l J |}
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline
-\code{bootargs}
- & 
-O
- & 
-\code{\textless{}string\textgreater{}}
- & 
-A string that specifies the boot arguments for
-the client program. The value could
-potentially be a null string if no boot
-arguments are required.
-\\
-\hline
-\code{stdout-path}
- & 
-O
- & 
-\code{\textless{}string\textgreater{}}
- & 
-A string that specifies the full path to the
-node representing the device to be used for
-boot console output. If the character '':'' is
-present in the value it terminates the path.
-The value may be an alias.
-If the stdin-path property is not specified,
-stdout-path should be assumed to define the
-input device.
-\\
-\hline
-\code{stdin-path}
- & 
-O
- & 
-\code{\textless{}string\textgreater{}}
- & 
-A string that specifies the full path to the
-node representing the device to be used for
-boot console input. If the character '':'' is
-present in the value it terminates the path.
-The value may be an alias.
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-\begin{notice}{note}{Note:}
-All other standard properties (section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}}) are allowed but are optional.
-\end{notice}
-
-\textbf{Example}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-chosen \PYGZob{}
-    bootargs = \PYGZdq{}root=/dev/nfs rw nfsroot=192.168.1.1 console=ttyS0,115200\PYGZdq{};
-\PYGZcb{};
-\end{Verbatim}
-
-Older versions of devicetrees may be encountered that contain a
-deprecated form of the stdout-path property called linux,stdout-path.
-For compatibility, a client program might want to support
-linux,stdout-path if a stdout-path property is not present. The meaning
-and use of the two properties is identical.
-
-
-\section{\texttt{/cpus} Node Properties}
-\label{devicenodes:cpus-node-properties}
-A cpus node is required for all devicetrees. It does not represent a
-real device in the system, but acts as a container for child cpu nodes
-which represent the systems CPUs.
-
-
-\begin{threeparttable}
-\capstart\caption{\texttt{/cpus} Node Properties}\label{devicenodes:id6}
-\begin{tabulary}{\linewidth}{| l c l J |}
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline
-\code{\#address-cells}
- & 
-R
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-The value specifies how many cells each
-element of the \code{reg} property array takes in
-children of this node.
-\\
-\hline
-\code{\#size-cells}
- & 
-R
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Value shall be 0. Specifies that no size is
-required in the \code{reg} property in children of
-this node.
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-\begin{notice}{note}{Note:}
-All other standard properties (section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}}) are allowed but are optional.
-\end{notice}
-
-The cpus node may contain properties that are common across CPU nodes.
-See section {\hyperref[devicenodes:sect\string-cpus\string-cpu\string-node\string-properties]{\crossref{\DUrole{std,std-ref}{3.7}}}} for details.
-
-For an example, see section {\hyperref[devicenodes:sect\string-cpu\string-node\string-example]{\crossref{\DUrole{std,std-ref}{3.8.1}}}}.
-
-
-\section{\texttt{/cpus/cpu*} Node Properties}
-\label{devicenodes:sect-cpus-cpu-node-properties}\label{devicenodes:cpus-cpu-node-properties}
-A cpu node represents a hardware execution block that is sufficiently
-independent that it is capable of running an operating system without
-interfering with other CPUs possibly running other operating systems.
-
-Hardware threads that share an MMU would generally be represented under
-one cpu node. If other more complex CPU topographies are designed, the
-binding for the CPU must describe the topography (e.g. threads that
-don’t share an MMU).
-
-CPUs and threads are numbered through a unified number-space that should
-match as closely as possible the interrupt controller’s numbering of
-CPUs/threads.
-
-Properties that have identical values across CPU nodes may be placed in
-the cpus node instead. A client program must first examine a specific
-CPU node, but if an expected property is not found then it should look
-at the parent cpus node. This results in a less verbose representation
-of properties which are identical across all CPUs.
-
-The node name for every cpu node should be \code{cpu}.
-
-
-\subsection{General Properties of \texttt{/cpus/cpu*} nodes}
-\label{devicenodes:general-properties-of-cpus-cpu-nodes}
-The following table describes the general properties of CPU nodes. Some
-of the properties described in \hyperref[devicenodes:table-cpu-node-props]{Table \ref{devicenodes:table-cpu-node-props}} are select
-standard properties with specific applicable detail.
-
-\begin{longtable}{| p{1.5cm} p{1cm} p{2.5cm} p{9.0cm} |}
-\caption{\texttt{/cpus/cpu*} Node General Properties}\label{devicenodes:table-cpu-node-props}\\
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline\endfirsthead
-
-\multicolumn{4}{c}%
-{{\tablecontinued{\tablename\ \thetable{} -- continued from previous page}}} \\
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline\endhead
-
-\hline \multicolumn{4}{|r|}{{\tablecontinued{Continued on next page}}} \\ \hline
-\endfoot
-
-\endlastfoot
-
-
-\code{device\_type}
- & 
-\begin{DUlineblock}{0em}
-\item[] R
-\end{DUlineblock}
- & 
-\begin{DUlineblock}{0em}
-\item[] \code{\textless{}string\textgreater{}}
-\end{DUlineblock}
- & 
-Value shall be \code{"cpu"}.
-\\
-\hline
-\code{reg}
- & 
-R
- & 
-array
- & 
-The value of \emph{reg} is a \code{\textless{}prop-encoded-array\textgreater{}}
-that defines a unique CPU/thread id for the
-CPU/threads represented by the CPU node.
-
-If a CPU supports more than one thread (i.e.
-multiple streams of execution) the \emph{reg}
-property is an array with 1 element per
-thread. The \emph{\#address-cells} on the \code{/cpus} node
-specifies how many cells each element of the
-array takes. Software can determine the number
-of threads by dividing the size of \emph{reg} by
-the parent node's \emph{\#address-cells}.
-
-If a CPU/thread can be the target of an
-external interrupt the \emph{reg} property value
-must be a unique CPU/thread id that is
-addressable by the interrupt controller.
-
-If a CPU/thread cannot be the target of an
-external interrupt, then \emph{reg} must be unique
-and out of bounds of the range addressed by
-the interrupt controller
-
-If a CPU/thread's PIR is modifiable, a client
-program should modify PIR to match the \emph{reg}
-property value. If PIR cannot be modified and
-the PIR value is distinct from the interrupt
-controller numberspace, the CPUs binding may
-define a binding-specific representation of
-PIR values if desired.
-\\
-\hline
-\code{clock-frequency}
- & 
-\begin{DUlineblock}{0em}
-\item[] R
-\end{DUlineblock}
- & 
-\begin{DUlineblock}{0em}
-\item[] array
-\end{DUlineblock}
- & 
-Specifies the current clock speed of the CPU
-in Hertz. The value is a \code{\textless{}prop-encoded-array\textgreater{}}
-in one of two forms:
-\begin{itemize}
-\item {} 
-A 32-bit integer consisting of one \code{\textless{}u32\textgreater{}}
-specifying the frequency.
-
-\item {} 
-A 64-bit integer represented as a \code{\textless{}u64\textgreater{}}
-specifying the frequency.
-
-\end{itemize}
-\\
-\hline
-\code{timebase-frequency}
- & 
-\begin{DUlineblock}{0em}
-\item[] R
-\end{DUlineblock}
- & 
-\begin{DUlineblock}{0em}
-\item[] array
-\end{DUlineblock}
- & 
-Specifies the current frequency at which the
-timebase and decrementer registers are updated
-(in Hertz). The value is a
-\textless{}prop-encoded-array\textgreater{} in one of two forms:
-\begin{itemize}
-\item {} 
-A 32-bit integer consisting of one \code{\textless{}u32\textgreater{}}
-specifying the frequency.
-
-\item {} 
-A 64-bit integer represented as a \code{\textless{}u64\textgreater{}}.
-
-\end{itemize}
-\\
-\hline
-\code{status}
- & 
-SD
- & 
-\code{\textless{}string\textgreater{}}
- & 
-A standard property describing the state of a
-CPU. This property shall be present for nodes
-representing CPUs in a symmetric
-multiprocessing (SMP) configuration. For a CPU
-node the meaning of the \code{"okay"} and
-\code{"disabled"} values are as follows:
-\begin{description}
-\item[{\code{"okay"} :}] \leavevmode
-The CPU is running.
-
-\item[{\code{"disabled"} :}] \leavevmode
-The CPU is in a quiescent state.
-
-\end{description}
-
-A quiescent CPU is in a state where it cannot
-interfere with the normal operation of other
-CPUs, nor can its state be affected by the
-normal operation of other running CPUs, except
-by an explicit method for enabling or
-reenabling the quiescent CPU (see the
-enable-method property).
-
-In particular, a running CPU shall be able to
-issue broadcast TLB invalidates without
-affecting a quiescent CPU.
-
-Examples: A quiescent CPU could be in a spin
-loop, held in reset, and electrically isolated
-from the system bus or in another
-implementation dependent state.
-\\
-\hline
-\code{enable-method}
- & 
-\begin{DUlineblock}{0em}
-\item[] SD
-\end{DUlineblock}
- & 
-\begin{DUlineblock}{0em}
-\item[] \code{\textless{}stringlist\textgreater{}}
-\end{DUlineblock}
- & 
-Describes the method by which a CPU in a
-disabled state is enabled. This property is
-required for CPUs with a status property with
-a value of \code{"disabled"}. The value consists of
-one or more strings that define the method to
-release this CPU. If a client program
-recognizes any of the methods, it may use it.
-The value shall be one of the following:
-\begin{description}
-\item[{\code{"spin-table"} :}] \leavevmode
-The CPU is enabled with the
-spin table method defined in the DTSpec.
-
-\item[{\code{"{[}vendor{]},{[}method{]}"} :}] \leavevmode
-Implementation dependent string that
-describes the method by which a CPU is
-released from a \code{"disabled"} state. The
-required format is: \code{"{[}vendor{]},{[}method{]}"},
-where vendor is a string describing the name of
-the manufacturer and method is a string
-describing the vendorspecific mechanism.
-
-\end{description}
-
-Example: \code{"fsl,MPC8572DS"}
-
-\begin{notice}{note}{Note:}
-Other methods may be added to later
-revisions of the DTSpec specification.
-\end{notice}
-\\
-\hline
-\code{cpu-release-addr}
- & 
-\begin{DUlineblock}{0em}
-\item[] SD
-\end{DUlineblock}
- & 
-\begin{DUlineblock}{0em}
-\item[] \code{\textless{}u64\textgreater{}}
-\end{DUlineblock}
- & 
-The cpu-release-addr property is required for
-cpu nodes that have an enable-method property
-value of \code{"spin-table"}. The value specifies the
-physical address of a spin table entry that
-releases a secondary CPU from its spin loop.
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{longtable}
-
-
-\begin{notice}{note}{Note:}
-All other standard properties (section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}}) are allowed but are optional.
-\end{notice}
-
-\begin{longtable}{| p{1.5cm} p{1cm} p{2.5cm} p{9.0cm} |}
-\caption{\texttt{/cpus/cpu*} Node Power ISA Properties}\\
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline\endfirsthead
-
-\multicolumn{4}{c}%
-{{\tablecontinued{\tablename\ \thetable{} -- continued from previous page}}} \\
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline\endhead
-
-\hline \multicolumn{4}{|r|}{{\tablecontinued{Continued on next page}}} \\ \hline
-\endfoot
-
-\endlastfoot
-
-
-\code{power-isa-version}
- & 
-\begin{DUlineblock}{0em}
-\item[] O
-\end{DUlineblock}
- & 
-\begin{DUlineblock}{0em}
-\item[] \code{\textless{}string\textgreater{}}
-\end{DUlineblock}
- & 
-A string that specifies the numerical portion
-of the Power ISA version string. For example,
-for an implementation complying with Power ISA
-Version 2.06, the value of this property would
-be \code{"2.06"}.
-\\
-\hline
-\code{power-isa-*}
- & 
-\begin{DUlineblock}{0em}
-\item[] O
-\end{DUlineblock}
- & 
-\begin{DUlineblock}{0em}
-\item[] \code{\textless{}empty\textgreater{}}
-\end{DUlineblock}
- & 
-If the \code{power-isa-version} property exists, then
-for each category from the Categories section
-of Book I of the Power ISA version indicated,
-the existence of a property named
-\code{power-isa-{[}CAT{]}}, where \code{{[}CAT{]}} is the
-abbreviated category name with all uppercase
-letters converted to lowercase, indicates that
-the category is supported by the
-implementation.
-
-For example, if the power-isa-version property
-exists and its value is \code{"2.06"} and the
-power-isa-e.hv property exists, then the
-implementation supports
-{[}Category:Embedded.Hypervisor{]} as defined in
-Power ISA Version 2.06.
-\\
-\hline
-\code{cache-op-block-size}
- & 
-\begin{DUlineblock}{0em}
-\item[] SD
-\end{DUlineblock}
- & 
-\begin{DUlineblock}{0em}
-\item[] \code{\textless{}u32\textgreater{}}
-\end{DUlineblock}
- & 
-Specifies the block size in bytes upon which
-cache block instructions operate (e.g., dcbz).
-Required if different than the L1 cache block
-size.
-\\
-\hline
-\code{reservation-granule-size}
- & 
-\begin{DUlineblock}{0em}
-\item[] SD
-\end{DUlineblock}
- & 
-\begin{DUlineblock}{0em}
-\item[] \code{\textless{}u32\textgreater{}}
-\end{DUlineblock}
- & 
-Specifies the reservation granule size
-supported by this processor in bytes.
-\\
-\hline
-\code{mmu-type}
- & 
-O
- & 
-\code{\textless{}string\textgreater{}}
- & 
-Specifies the CPU’s MMU type.
-
-Valid values are shown below:
-\begin{itemize}
-\item {} 
-\code{"mpc8xx"}
-
-\item {} 
-\code{"ppc40x"}
-
-\item {} 
-\code{"ppc440"}
-
-\item {} 
-\code{"ppc476"}
-
-\item {} 
-\code{"power-embedded"}
-
-\item {} 
-\code{"powerpc-classic"}
-
-\item {} 
-\code{"power-server-stab"}
-
-\item {} 
-\code{"power-server-slb"}
-
-\item {} 
-\code{"none"}
-
-\end{itemize}
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{longtable}
-
-
-\begin{notice}{note}{Note:}
-All other standard properties (section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}}) are allowed but are optional.
-\end{notice}
-
-Older versions of devicetree may be encountered that contain a
-bus-frequency property on CPU nodes. For compatibility, a client-program
-might want to support bus-frequency. The format of the value is
-identical to that of clock-frequency. The recommended practice is to
-represent the frequency of a bus on the bus node using a clock-frequency
-property.
-
-
-\subsection{TLB Properties}
-\label{devicenodes:tlb-properties}
-The following properties of a cpu node describe the translate look-aside
-buffer in the processor’s MMU.
-
-
-\begin{threeparttable}
-\capstart\caption{\texttt{/cpu/cpu*} Node Power ISA TLB Properties}\label{devicenodes:id9}
-\begin{tabulary}{\linewidth}{| l c l J |}
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline
-\code{tlb-split}
- & 
-SD
- & 
-\code{\textless{}empty\textgreater{}}
- & 
-If present specifies that the TLB has a split
-configuration, with separate TLBs for
-instructions and data. If absent, specifies
-that the TLB has a unified configuration.
-Required for a CPU with a TLB in a split
-configuration.
-\\
-\hline
-\code{tlb-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the number of entries in the TLB.
-Required for a CPU with a unified TLB for
-instruction and data addresses.
-\\
-\hline
-\code{tlb-sets}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the number of associativity sets in
-the TLB. Required for a CPU with a unified TLB
-for instruction and data addresses.
-\\
-\hline
-\code{d-tlb-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the number of entries in the data
-TLB. Required for a CPU with a split TLB
-configuration.
-\\
-\hline
-\code{d-tlb-sets}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the number of associativity sets in
-the data TLB. Required for a CPU with a split
-TLB configuration.
-\\
-\hline
-\code{i-tlb-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the number of entries in the
-instruction TLB. Required for a CPU with a
-split TLB configuration.
-\\
-\hline
-\code{i-tlb-sets}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the number of associativity sets in
-the instruction TLB. Required for a CPU with a
-split TLB configuration.
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-\begin{notice}{note}{Note:}
-All other standard properties (section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}}) are allowed but are optional.
-\end{notice}
-
-
-\subsection{Internal (L1) Cache Properties}
-\label{devicenodes:internal-l1-cache-properties}
-The following properties of a cpu node describe the processor’s internal
-(L1) cache.
-
-
-\begin{threeparttable}
-\capstart\caption{\texttt{/cpu/cpu*} Node Power ISA Cache Properties}\label{devicenodes:id10}
-\begin{tabulary}{\linewidth}{| l c l J |}
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline
-\code{cache-unified}
- & 
-SD
- & 
-\code{\textless{}empty\textgreater{}}
- & 
-If present, specifies the cache has a unified
-organization. If not present, specifies that
-the cache has a Harvard architecture with
-separate caches for instructions and data.
-\\
-\hline
-\code{cache-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the size in bytes of a unified
-cache. Required if the cache is unified
-(combined instructions and data).
-\\
-\hline
-\code{cache-sets}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the number of associativity sets in
-a unified cache. Required if the cache is
-unified (combined instructions and data)
-\\
-\hline
-\code{cache-block-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the block size in bytes of a unified
-cache. Required if the processor has a unified
-cache (combined instructions and data)
-\\
-\hline
-\code{cache-line-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the line size in bytes of a unified
-cache, if different than the cache block size
-Required if the processor has a unified cache
-(combined instructions and data).
-\\
-\hline
-\code{i-cache-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the size in bytes of the instruction
-cache. Required if the cpu has a separate
-cache for instructions.
-\\
-\hline
-\code{i-cache-sets}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the number of associativity sets in
-the instruction cache. Required if the cpu has
-a separate cache for instructions.
-\\
-\hline
-\code{i-cache-block-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the block size in bytes of the
-instruction cache. Required if the cpu has a
-separate cache for instructions.
-\\
-\hline
-\code{i-cache-line-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the line size in bytes of the
-instruction cache, if different than the cache
-block size. Required if the cpu has a separate
-cache for instructions.
-\\
-\hline
-\code{d-cache-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the size in bytes of the data cache.
-Required if the cpu has a separate cache for
-data.
-\\
-\hline
-\code{d-cache-sets}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the number of associativity sets in
-the data cache. Required if the cpu has a
-separate cache for data.
-\\
-\hline
-\code{d-cache-block-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the block size in bytes of the data
-cache. Required if the cpu has a separate
-cache for data.
-\\
-\hline
-\code{d-cache-line-size}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the line size in bytes of the data
-cache, if different than the cache block size.
-Required if the cpu has a separate cache for
-data.
-\\
-\hline
-\code{next-level-cache}
- & 
-SD
- & 
-\code{\textless{}phandle\textgreater{}}
- & 
-If present, indicates that another level of
-cache exists. The value is the phandle of the
-next level of cache. The phandle value type is
-fully described in section {\hyperref[devicetree\string-basics:sect\string-standard\string-properties\string-phandle]{\crossref{\DUrole{std,std-ref}{2.3.3}}}}.
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-\begin{notice}{note}{Note:}
-All other standard properties (section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}}) are allowed but are optional.
-\end{notice}
-
-Older versions of devicetrees may be encountered that contain a
-deprecated form of the next-level-cache property called \code{l2-cache}.
-For compatibility, a client-program may wish to support \code{l2-cache}
-if a next-level-cache property is not present.
-The meaning and use of the two properties is identical.
-
-
-\subsection{Example}
-\label{devicenodes:sect-cpu-node-example}\label{devicenodes:example}
-Here is an example of a \code{/cpus} node with one child cpu node:
-
-\begin{Verbatim}[commandchars=\\\{\}]
-cpus \PYGZob{}
-    \PYGZsh{}address\PYGZhy{}cells = \PYGZlt{}1\PYGZgt{};
-    \PYGZsh{}size\PYGZhy{}cells = \PYGZlt{}0\PYGZgt{};
-    cpu@0 \PYGZob{}
-        device\PYGZus{}type = \PYGZdq{}cpu\PYGZdq{};
-        reg = \PYGZlt{}0\PYGZgt{};
-        d\PYGZhy{}cache\PYGZhy{}block\PYGZhy{}size = \PYGZlt{}32\PYGZgt{}; // L1 \PYGZhy{} 32 bytes
-        i\PYGZhy{}cache\PYGZhy{}block\PYGZhy{}size = \PYGZlt{}32\PYGZgt{}; // L1 \PYGZhy{} 32 bytes
-        d\PYGZhy{}cache\PYGZhy{}size = \PYGZlt{}0x8000\PYGZgt{}; // L1, 32K
-        i\PYGZhy{}cache\PYGZhy{}size = \PYGZlt{}0x8000\PYGZgt{}; // L1, 32K
-        timebase\PYGZhy{}frequency = \PYGZlt{}82500000\PYGZgt{}; // 82.5 MHz
-        clock\PYGZhy{}frequency = \PYGZlt{}825000000\PYGZgt{}; // 825 MHz
-    \PYGZcb{};
-\PYGZcb{};
-\end{Verbatim}
-
-
-\section{Multi-level and Shared Cache Nodes (\texttt{/cpus/cpu*/l?-cache})}
-\label{devicenodes:multi-level-and-shared-cache-nodes-cpus-cpu-l-cache}
-Processors and systems may implement additional levels of cache hierarchy.
-For example, second-level (L2) or third-level (L3) caches.
-These caches can potentially be tightly integrated to the CPU or
-possibly shared between multiple CPUs.
-
-A device node with a compatible value of \code{"cache"} describes these types
-of caches.
-
-The cache node shall define a phandle property, and all cpu nodes or
-cache nodes that are associated with or share the cache each shall
-contain a next-level-cache property that specifies the phandle to the
-cache node.
-
-A cache node may be represented under a CPU node or any other
-appropriate location in the devicetree.
-
-Multiple-level and shared caches are represented with the properties in
-Table 3-9. The L1 cache properties are described in Table 3-8.
-
-
-\begin{threeparttable}
-\capstart\caption{\texttt{/cpu/cpu*/l?-cache} Node Power ISA Multiple-level and Shared Cache Properties}\label{devicenodes:id11}
-\begin{tabulary}{\linewidth}{| l c l J |}
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline
-\code{compatible}
- & 
-R
- & 
-\code{\textless{}string\textgreater{}}
- & 
-A standard property. The value shall include
-the string \code{"cache"}.
-\\
-\hline
-\code{cache-level}
- & 
-R
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the level in the cache hierarchy.
-For example, a level 2 cache has a value of 2.
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-\begin{notice}{note}{Note:}
-All other standard properties (section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}}) are allowed but are optional.
-\end{notice}
-
-
-\subsection{Example}
-\label{devicenodes:id1}
-See the following example of a devicetree representation of two CPUs,
-each with their own on-chip L2 and a shared L3.
-
-\begin{Verbatim}[commandchars=\\\{\}]
-cpus \PYGZob{}
-    \PYGZsh{}address\PYGZhy{}cells = \PYGZlt{}1\PYGZgt{};
-    \PYGZsh{}size\PYGZhy{}cells = \PYGZlt{}0\PYGZgt{};
-    cpu@0 \PYGZob{}
-        device\PYGZus{}type = \PYGZdq{}cpu\PYGZdq{};
-        reg = \PYGZlt{}0\PYGZgt{};
-        cache\PYGZhy{}unified;
-        cache\PYGZhy{}size = \PYGZlt{}0x8000\PYGZgt{}; // L1, 32KB
-        cache\PYGZhy{}block\PYGZhy{}size = \PYGZlt{}32\PYGZgt{};
-        timebase\PYGZhy{}frequency = \PYGZlt{}82500000\PYGZgt{}; // 82.5 MHz
-        next\PYGZhy{}level\PYGZhy{}cache = \PYGZlt{}\PYGZam{}L2\PYGZus{}0\PYGZgt{}; // phandle to L2
-
-        L2\PYGZus{}0:l2\PYGZhy{}cache \PYGZob{}
-            compatible = \PYGZdq{}cache\PYGZdq{};
-            cache\PYGZhy{}unified;
-            cache\PYGZhy{}size = \PYGZlt{}0x40000\PYGZgt{}; // 256 KB
-
-            cache\PYGZhy{}sets = \PYGZlt{}1024\PYGZgt{};
-            cache\PYGZhy{}block\PYGZhy{}size = \PYGZlt{}32\PYGZgt{};
-            cache\PYGZhy{}level = \PYGZlt{}2\PYGZgt{};
-            next\PYGZhy{}level\PYGZhy{}cache = \PYGZlt{}\PYGZam{}L3\PYGZgt{}; // phandle to L3
-
-            L3:l3\PYGZhy{}cache \PYGZob{}
-                compatible = \PYGZdq{}cache\PYGZdq{};
-                cache\PYGZhy{}unified;
-                cache\PYGZhy{}size = \PYGZlt{}0x40000\PYGZgt{}; // 256 KB
-                cache\PYGZhy{}sets = \PYGZlt{}0x400\PYGZgt{}; // 1024
-                cache\PYGZhy{}block\PYGZhy{}size =
-                cache\PYGZhy{}level = \PYGZlt{}3\PYGZgt{};
-            \PYGZcb{};
-        \PYGZcb{};
-    \PYGZcb{};
-
-    cpu@1 \PYGZob{}
-        device\PYGZus{}type = \PYGZdq{}cpu\PYGZdq{};
-        reg = \PYGZlt{}0\PYGZgt{};
-        cache\PYGZhy{}unified;
-        cache\PYGZhy{}block\PYGZhy{}size = \PYGZlt{}32\PYGZgt{};
-        cache\PYGZhy{}size = \PYGZlt{}0x8000\PYGZgt{}; // L1, 32KB
-        timebase\PYGZhy{}frequency = \PYGZlt{}82500000\PYGZgt{}; // 82.5 MHz
-        clock\PYGZhy{}frequency = \PYGZlt{}825000000\PYGZgt{}; // 825 MHz
-        cache\PYGZhy{}level = \PYGZlt{}2\PYGZgt{};
-        next\PYGZhy{}level\PYGZhy{}cache = \PYGZlt{}\PYGZam{}L2\PYGZus{}1\PYGZgt{}; // phandle to L2
-        L2\PYGZus{}1:l2\PYGZhy{}cache \PYGZob{}
-            compatible = \PYGZdq{}cache\PYGZdq{};
-            cache\PYGZhy{}unified;
-            cache\PYGZhy{}size = \PYGZlt{}0x40000\PYGZgt{}; // 256 KB
-            cache\PYGZhy{}sets = \PYGZlt{}0x400\PYGZgt{}; // 1024
-            cache\PYGZhy{}line\PYGZhy{}size = \PYGZlt{}32\PYGZgt{} // 32 bytes
-            next\PYGZhy{}level\PYGZhy{}cache = \PYGZlt{}\PYGZam{}L3\PYGZgt{}; // phandle to L3
-        \PYGZcb{};
-    \PYGZcb{};
-\PYGZcb{};
-\end{Verbatim}
-
-
-\chapter{Device Bindings}
-\label{device-bindings::doc}\label{device-bindings:device-bindings}\label{device-bindings:chapter-device-bindings}
-This chapter contains requirements, known as bindings, for how specific
-types and classes of devices are represented in the devicetree. The
-compatible property of a device node describes the specific binding (or
-bindings) to which the node complies.
-
-Bindings may be defined as extensions of other each. For example a new
-bus type could be defined as an extension of the simple-bus binding. In
-this case, the compatible property would contain several strings
-identifying each binding—from the most specific to the most general (see
-section {\hyperref[devicetree\string-basics:sect\string-standard\string-properties\string-compatible]{\crossref{\DUrole{std,std-ref}{2.3.1}}}}, compatible).
-
-
-\section{Binding Guidelines}
-\label{device-bindings:binding-guidelines}
-
-\subsection{General Principles}
-\label{device-bindings:general-principles}
-When creating a new devicetree representation for a device, a binding
-should be created that fully describes the required properties and value
-of the device. This set of properties shall be sufficiently descriptive
-to provide device drivers with needed attributes of the device.
-
-Some recommended practices include:
-\begin{enumerate}
-\item {} 
-Define a compatible string using the conventions described in section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties\string-compatible]{\crossref{\DUrole{std,std-ref}{2.3.1}}}}.
-
-\item {} 
-Use the standard properties (defined in sections
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}} and {\hyperref[devicetree\string-basics:sect\string-interrupts]{\crossref{\DUrole{std,std-ref}{2.4}}}}) as
-applicable for the new device. This usage typically includes the
-\code{reg} and \code{interrupts} properties at a minimum.
-
-\item {} 
-Use the conventions specified in section {\hyperref[device\string-bindings:chapter\string-device\string-bindings]{\crossref{\DUrole{std,std-ref}{4}}}}
-(Device Bindings) if the new device fits into one the DTSpec defined
-device classes.
-
-\item {} 
-Use the miscellaneous property conventions specified in section
-{\hyperref[device\string-bindings:sect\string-misc\string-properties]{\crossref{\DUrole{std,std-ref}{4.1.2}}}}, if applicable.
-
-\item {} 
-If new properties are needed by the binding, the recommended format
-for property names is: \code{"\textless{}company\textgreater{},\textless{}property-name\textgreater{}"}, where \code{\textless{}company\textgreater{}}
-is an OUI or short unique string like a stock ticker that identifies
-the creator of the binding.
-
-Example: \code{"ibm,ppc-interrupt-server\#s"}
-
-\end{enumerate}
-
-
-\subsection{Miscellaneous Properties}
-\label{device-bindings:sect-misc-properties}\label{device-bindings:miscellaneous-properties}
-This section defines a list of helpful properties that might be
-applicable to many types of devices and device classes. They are defined
-here to facilitate standardization of names and usage.
-
-
-\subsubsection{\texttt{clock-frequency} Property}
-\label{device-bindings:clock-frequency-property}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{clock-frequency} Property}\label{device-bindings:id3}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{clock-frequency}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}prop-encoded-array\textgreater{}}
-\\
-\hline
-Description
- & 
-Specifies the frequency of a clock in Hz. The value is a
-\code{\textless{}prop-encoded-array\textgreater{}} in one of two forms:
-
-a 32-bit integer consisting of one \code{\textless{}u32\textgreater{}} specifying the
-frequency
-
-a 64-bit integer represented as a \code{\textless{}u64\textgreater{}} specifying the
-frequency
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\subsubsection{\texttt{reg-shift} Property}
-\label{device-bindings:reg-shift-property}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{reg-shift} Property}\label{device-bindings:id4}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{reg-shift}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}u32\textgreater{}}
-\\
-\hline
-Description
- & 
-The \code{reg-shift} property provides a mechanism to represent
-devices that are identical in most respects except for the
-number of bytes between registers. The \code{reg-shift} property
-specifies in bytes how far the discrete device registers are
-separated from each other. The individual register location
-is calculated by using following formula: ``registers address''
-\textless{}\textless{} reg-shift. If unspecified, the default value is 0.
-
-For example, in a system where 16540 UART registers are
-located at addresses 0x0, 0x4, 0x8, 0xC, 0x10, 0x14, 0x18,
-and 0x1C, a \code{reg-shift = \textless{}2\textgreater{}}
-property would be used to specify register locations.
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\subsubsection{\texttt{label} Property}
-\label{device-bindings:label-property}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{label} Property}\label{device-bindings:id5}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{label}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}string\textgreater{}}
-\\
-\hline
-Descriptio
- & 
-The label property defines a human readable string describing
-a device. The binding for a given device specifies the exact
-meaning of the property for that device.
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\section{Serial devices}
-\label{device-bindings:serial-devices}
-
-\subsection{Serial Class Binding}
-\label{device-bindings:serial-class-binding}
-The class of serial devices consists of various types of point to point
-serial line devices. Examples of serial line devices include the 8250
-UART, 16550 UART, HDLC device, and BISYNC device. In most cases hardware
-compatible with the RS-232 standard fit into the serial device class.
-
-I$^{\text{2}}$C and SPI (Serial Peripheral Interface) devices shall not
-be represented as serial port devices because they have their own
-specific representation.
-
-
-\subsubsection{\texttt{clock-frequency} Property}
-\label{device-bindings:id1}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{clock-frequecy} Property}\label{device-bindings:id6}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{clock-frequency}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}u32\textgreater{}}
-\\
-\hline
-Description
- & 
-Specifies the frequency in Hertz of the baud rate generator's
-input clock.
-\\
-\hline
-Example
- & 
-\code{clock-frequency = \textless{}100000000\textgreater{};}
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\subsubsection{\texttt{current-speed} Property}
-\label{device-bindings:current-speed-property}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{current-speed} Property}\label{device-bindings:id7}
-\begin{tabulary}{\linewidth}{l J}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{current-speed}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}u32\textgreater{}}
-\\
-\hline
-Description
- & 
-Specifies the current speed of a serial device in bits per
-second. A boot program should set this property if it has
-initialized the serial device.
-\\
-\hline
-Example
- & 
-115,200 Baud: \code{current-speed = \textless{}115200\textgreater{};}
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\subsection{National Semiconductor 16450/16550 Compatible UART Requirements}
-\label{device-bindings:national-semiconductor-16450-16550-compatible-uart-requirements}
-Serial devices compatible to the National Semiconductor 16450/16550 UART
-(Universal Asynchronous Receiver Transmitter) should be represented in
-the devicetree using following properties.
-
-
-\begin{threeparttable}
-\capstart\caption{ns16550 UART Properties}\label{device-bindings:id8}
-\begin{tabulary}{\linewidth}{l c l J}
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline
-\code{compatible}
- & 
-R
- & 
-\textless{}string list\textgreater{}
- & 
-Value shall include ``ns16550''.
-\\
-\hline
-\code{clock-frequency}
- & 
-R
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies the frequency (in Hz) of the baud
-rate generator’s input clock
-\\
-\hline
-\code{current-speed}
- & 
-OR
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies current serial device speed in bits
-per second
-\\
-\hline
-\code{reg}
- & 
-R
- & 
-\code{\textless{}prop encoded
-array\textgreater{}}
- & 
-Specifies the physical address of the
-registers device within the address space of
-the parent bus
-\\
-\hline
-\code{interrupts}
- & 
-OR
- & 
-\code{\textless{}prop encoded
-array\textgreater{}}
- & 
-Specifies the interrupts generated by this
-device. The value of the interrupts property
-consists of one or more interrupt specifiers.
-The format of an interrupt specifier is
-defined by the binding document describing the
-node’s interrupt parent.
-\\
-\hline
-\code{reg-shift}
- & 
-O
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Specifies in bytes how far the discrete device
-registers are separated from each other. The
-individual register location is calculated by
-using following formula: \code{"registers address"
-\textless{}\textless{} reg-shift}. If unspecified, the default
-value is 0.
-\\
-\hline
-\code{virtual-reg}
- & 
-SD
- & 
-\code{\textless{}u32\textgreater{}}
-or
-\code{\textless{}u64\textgreater{}}
- & 
-See section {\hyperref[devicetree\string-basics:sect\string-standard\string-properties\string-virtual\string-reg]{\crossref{\DUrole{std,std-ref}{2.3.7}}}}.
-Specifies an effective address that maps to the
-first physical address specified in the \code{reg}
-property. This property is required if this
-device node is the system’s console.
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-\begin{notice}{note}{Note:}
-All other standard properties (section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}}) are allowed but are optional.
-\end{notice}
-
-
-\section{Network devices}
-\label{device-bindings:network-devices}
-Network devices are packet oriented communication devices. Devices in
-this class are assumed to implement the data link layer (layer 2) of the
-seven-layer OSI model and use Media Access Control (MAC) addresses.
-Examples of network devices include Ethernet, FDDI, 802.11, and
-Token-Ring.
-
-
-\subsection{Network Class Binding}
-\label{device-bindings:network-class-binding}
-
-\subsubsection{\texttt{address-bits} Property}
-\label{device-bindings:address-bits-property}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{address-bits} Property}\label{device-bindings:id9}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{address-bits}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}u32\textgreater{}}
-\\
-\hline
-Description
- & 
-Specifies number of address bits required to address the
-device described by this node. This property specifies number
-of bits in MAC address. If unspecified, the default value is 48.
-\\
-\hline
-Example
- & 
-\code{address-bits = \textless{}48\textgreater{};}
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\subsubsection{\texttt{local-mac-address} Property}
-\label{device-bindings:local-mac-address-property}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{local-mac-address} Property}\label{device-bindings:id10}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{local-mac-address}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}prop-encoded-array\textgreater{}} encoded as an array of hex numbers
-\\
-\hline
-Description
- & 
-Specifies MAC address that was assigned to the network device
-described by the node containing this property.
-\\
-\hline
-Example
- & 
-\code{local-mac-address = {[} 0x00 0x00 0x12 0x34 0x56 0x78{]};}
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\subsubsection{\texttt{mac-address} Property}
-\label{device-bindings:mac-address-property}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{mac-address} Property}\label{device-bindings:id11}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{mac-address}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}prop-encoded-array\textgreater{}} encoded as an array of hex numbers
-\\
-\hline
-Description
- & 
-Specifies the MAC address that was last used by the boot
-program. This property should be used in cases where the MAC
-address assigned to the device by the boot program is
-different from the local-mac-address property. This property
-shall be used only if the value differs from
-local-mac-address property value.
-\\
-\hline
-Example
- & 
-\code{mac-address = {[} 0x01 0x02 0x03 0x04 0x05 0x06 {]};}
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\subsubsection{\texttt{max-frame-size} Property}
-\label{device-bindings:max-frame-size-property}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{max-frame-size} Property}\label{device-bindings:id12}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{max-frame-size}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}u32\textgreater{}}
-\\
-\hline
-Descriptio
- & 
-Specifies maximum packet length in bytes that the physical
-interface can send and receive.
-\\
-\hline
-Example
- & 
-\code{max-frame-size = \textless{}1518\textgreater{};}
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\subsection{Ethernet specific considerations}
-\label{device-bindings:ethernet-specific-considerations}
-Network devices based on the IEEE 802.3 collections of LAN standards
-(collectively referred to as Ethernet) may be represented in the devicetree
-using following properties, in addition to properties specified of
-the network device class.
-
-The properties listed in this section augment the properties listed in
-the network device class.
-
-
-\subsubsection{\texttt{max-speed} Property}
-\label{device-bindings:max-speed-property}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{max-speed} Property}\label{device-bindings:id13}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{max-speed}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}u32\textgreater{}}
-\\
-\hline
-Description
- & 
-Specifies maximum speed (specified in megabits per second)
-supported the device.
-\\
-\hline
-Example
- & 
-\code{max-speed = \textless{}1000\textgreater{};}
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\subsubsection{\texttt{phy-connection-type} Property}
-\label{device-bindings:phy-connection-type-property}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{phy-connection-type} Property}\label{device-bindings:id14}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{phy-connection-type}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}string\textgreater{}}
-\\
-\hline
-Description
- & 
-Specifies interface type between the Ethernet device and a
-physical layer (PHY) device. The value of this property is
-specific to the implementation.
-
-Recommended values are shown in the following table.
-\\
-\hline
-Example
- & 
-\code{phy-connection-type = "mii";}
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\begin{threeparttable}
-\capstart\caption{Defined values for the \texttt{phy-connection-type} Property}\label{device-bindings:id15}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Connection type
-} & \textsf{\relax 
-Value
-}\\
-\hline
-Media Independent Interface
- & 
-\code{mii}
-\\
-\hline
-Reduced Media Independent Interface
- & 
-\code{rmii}
-\\
-\hline
-Gigabit Media Independent Interface
- & 
-\code{gmii}
-\\
-\hline
-Reduced Gigabit Media Independent
- & 
-\code{rgmii}
-\\
-\hline
-rgmii with internal delay
- & 
-\code{rgmii-id}
-\\
-\hline
-rgmii with internal delay on TX only
- & 
-\code{rgmii-txid}
-\\
-\hline
-rgmii with internal delay on RX only
- & 
-\code{rgmii-rxid}
-\\
-\hline
-Ten Bit Interface
- & 
-\code{tbi}
-\\
-\hline
-Reduced Ten Bit Interface
- & 
-\code{rtbi}
-\\
-\hline
-Serial Media Independent Interface
- & 
-\code{smii}
-\\
-\hline
-Serial Gigabit Media Independent Interface
- & 
-\code{sgmii}
-\\
-\hline
-Reverse Media Independent Interface
- & 
-\code{rev-mii}
-\\
-\hline
-10 Gigabits Media Independent Interface
- & 
-\code{xgmii}
-\\
-\hline
-Multimedia over Coaxial
- & 
-\code{moca}
-\\
-\hline
-Quad Serial Gigabit Media Independent Interface
- & 
-\code{qsgmii}
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\subsubsection{\texttt{phy-handle} Property}
-\label{device-bindings:phy-handle-property}
-
-\begin{threeparttable}
-\capstart\caption{\texttt{phy-handle} Property}\label{device-bindings:id16}
-\begin{tabulary}{\linewidth}{| l J |}
-\hline
-\textsf{\relax 
-Property
-} & \textsf{\relax 
-\code{phy-handle}
-}\\
-\hline
-Value type
- & 
-\code{\textless{}phandle\textgreater{}}
-\\
-\hline
-Description
- & 
-Specifies a reference to a node representing a physical layer
-(PHY) device connected to this Ethernet device. This property
-is required in case where the Ethernet device is connected a
-physical layer device.
-\\
-\hline
-Example
- & 
-\code{phy-handle = \textless{}\&PHY0\textgreater{};}
-\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\section{Power ISA Open PIC Interrupt Controllers}
-\label{device-bindings:power-isa-open-pic-interrupt-controllers}
-This section specifies the requirements for representing Open PIC
-compatible interrupt controllers. An Open PIC interrupt controller
-implements the Open PIC architecture (developed jointly by AMD and
-Cyrix) and specified in The Open Programmable Interrupt Controller (PIC)
-Register Interface Specification Revision 1.2 \phantomsection\label{device-bindings:id2}{\hyperref[references:b18]{\crossref{{[}b18{]}}}}.
-
-Interrupt specifiers in an Open PIC interrupt domain are encoded with
-two cells. The first cell defines the interrupt number. The second cell
-defines the sense and level information.
-
-Sense and level information shall be encoded as follows in interrupt
-specifiers:
-\begin{quote}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-0 = low to high edge sensitive type enabled
-1 = active low level sensitive type enabled
-2 = active high level sensitive type enabled
-3 = high to low edge sensitive type enabled
-\end{Verbatim}
-\end{quote}
-
-
-\begin{threeparttable}
-\capstart\caption{Open-PIC properties}\label{device-bindings:id17}
-\begin{tabulary}{\linewidth}{| l c l J |}
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline
-\code{compatible}
- & 
-R
- & 
-\code{\textless{}string\textgreater{}}
- & 
-Value shall include \code{"open-pic"}
-\\
-\hline
-\code{reg}
- & 
-R
- & 
-\code{\textless{}prop encoded
-array\textgreater{}}
- & 
-Specifies the physical address of the
-registers device within the address space of
-the parent bus
-\\
-\hline
-\code{interrupt-controller}
- & 
-R
- & 
-\code{\textless{}empty\textgreater{}}
- & 
-Specifies that this node is an interrupt controller
-\\
-\hline
-\code{\#interrupt-cells}
- & 
-R
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Shall be 2.
-\\
-\hline
-\code{\#address-cells}
- & 
-R
- & 
-\code{\textless{}u32\textgreater{}}
- & 
-Shall be 0.
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-\begin{notice}{note}{Note:}
-All other standard properties (section
-{\hyperref[devicetree\string-basics:sect\string-standard\string-properties]{\crossref{\DUrole{std,std-ref}{2.3}}}}) are allowed but are optional.
-\end{notice}
-
-
-\section{\texttt{simple-bus} Compatible Value}
-\label{device-bindings:simple-bus-compatible-value}\label{device-bindings:sect-bindings-simple-bus}
-System-on-a-chip processors may have an internal I/O bus that cannot be
-probed for devices. The devices on the bus can be accessed directly
-without additional configuration required. This type of bus is
-represented as a node with a compatible value of ``simple-bus''.
-
-
-\begin{threeparttable}
-\capstart\caption{\texttt{simple-bus} Compatible Node Properties}\label{device-bindings:id18}
-\begin{tabulary}{\linewidth}{| l c l J |}
-\hline
-\textsf{\relax 
-Property Name
-} & \textsf{\relax 
-Usage
-} & \textsf{\relax 
-Value Type
-} & \textsf{\relax 
-Definition
-}\\
-\hline
-\code{compatible}
- & 
-R
- & 
-\code{\textless{}string\textgreater{}}
- & 
-Value shall include ``simple-bus''.
-\\
-\hline
-\code{ranges}
- & 
-R
- & 
-\code{\textless{}prop encoded
-array\textgreater{}}
- & 
-This property represents the mapping between
-parent address to child address spaces (see
-section {\hyperref[devicetree\string-basics:sect\string-standard\string-properties\string-ranges]{\crossref{\DUrole{std,std-ref}{2.3.8}}}},
-ranges).
-\\
-\hline \multicolumn{4}{|l|}{
-Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
-}\\
-\hline\end{tabulary}
-
-\end{threeparttable}
-
-
-
-\chapter{Flat Devicetree Physical Structure}
-\label{flattened-format:flat-devicetree-physical-structure}\label{flattened-format::doc}\label{flattened-format:chapter-fdt-structure}
-With the exception of platforms using IEEE1275 Open Firmware {[}IEEE1275{]}, the
-devicetree data is contained within a single single, linear, pointerless data
-structure known as the flattened devicetree or devicetree blob.
-
-This data structure consists of a small header
-(see section {\hyperref[flattened\string-format:sect\string-fdt\string-header]{\crossref{\DUrole{std,std-ref}{5.2}}}}),
-followed by three variable sized sections:
-the memory reservation block (see section {\hyperref[flattened\string-format:sect\string-fdt\string-memory\string-reservation\string-block]{\crossref{\DUrole{std,std-ref}{5.3}}}}),
-the structure block (see secton {\hyperref[flattened\string-format:sect\string-fdt\string-structure\string-block]{\crossref{\DUrole{std,std-ref}{5.4}}}}),
-and the strings block (see section {\hyperref[flattened\string-format:sect\string-fdt\string-strings\string-block]{\crossref{\DUrole{std,std-ref}{5.5}}}}).
-These should be present in the flattened devicetree in that order.
-Thus, the devicetree structure as a whole, when loaded into memory at address,
-will resemble the diagram in \hyperref[flattened-format:figure-device-tree-structure]{Fig. \ref{flattened-format:figure-device-tree-structure}}
-(lower addresses are at the top of the diagram).
-\begin{figure}[htbp]
-\centering
-\capstart
-
-\includegraphics{graphviz-23a197b43ca822bb92fb1a341bdd04b0845caa29.pdf}
-\caption{Devicetree .dtb Structure}\label{flattened-format:figure-device-tree-structure}\label{flattened-format:id1}\end{figure}
-
-The (free space) sections may not be present, though in some cases they
-might be required to satisfy the alignment constraints of the individual
-blocks (see section {\hyperref[flattened\string-format:sect\string-fdt\string-alignment]{\crossref{\DUrole{std,std-ref}{5.6}}}}).
-
-
-\section{Versioning}
-\label{flattened-format:sect-fdt-versioning}\label{flattened-format:versioning}
-Several versions of the flattened devicetree structure have been defined since
-the original definition of the format. Fields in the header give the version,
-so that the client program can determine if the devicetree is encoded in a
-compatible format.
-
-This document describes only version 17 of the format. DTSpec compliant boot
-programs shall provide a devicetree of version 17 or later, and should provide
-a devicetree of a version that is backwards compatible with version 16.
-DTSpec compliant client programs shall accept devicetrees of any version
-backwards compatible with version 17 and may accept other versions as well.
-
-\begin{notice}{note}{Note:}
-The version is with respect to the binary structure of the device
-tree, not its content.
-\end{notice}
-
-
-\section{Header}
-\label{flattened-format:sect-fdt-header}\label{flattened-format:header}
-The layout of the header for the devicetree is defined by the following
-C structure. All the header fields are 32-bit integers, stored in
-big-endian format.
-
-\textbf{Flattened Devicetree Header Fields}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-struct fdt\PYGZus{}header \PYGZob{}
-    uint32\PYGZus{}t magic;
-    uint32\PYGZus{}t totalsize;
-    uint32\PYGZus{}t off\PYGZus{}dt\PYGZus{}struct;
-    uint32\PYGZus{}t off\PYGZus{}dt\PYGZus{}strings;
-    uint32\PYGZus{}t off\PYGZus{}mem\PYGZus{}rsvmap;
-    uint32\PYGZus{}t version;
-    uint32\PYGZus{}t last\PYGZus{}comp\PYGZus{}version;
-    uint32\PYGZus{}t boot\PYGZus{}cpuid\PYGZus{}phys;
-    uint32\PYGZus{}t size\PYGZus{}dt\PYGZus{}strings;
-    uint32\PYGZus{}t size\PYGZus{}dt\PYGZus{}struct;
-\PYGZcb{};
-\end{Verbatim}
-\begin{description}
-\item[{\code{magic}}] \leavevmode
-This field shall contain the value 0xd00dfeed (big-endian).
-
-\item[{\code{totalsize}}] \leavevmode
-This field shall contain the total size of the devicetree data
-structure. This size shall encompass all sections of the structure:
-the header, the memory reservation block, structure block and
-strings block, as well as any free space gaps between the blocks or
-after the final block.
-
-\item[{\code{off\_dt\_struct}}] \leavevmode
-This field shall contain the offset in bytes of the structure block
-(see section {\hyperref[flattened\string-format:sect\string-fdt\string-structure\string-block]{\crossref{\DUrole{std,std-ref}{5.4}}}}) from the beginning of the header.
-
-\item[{\code{off\_dt\_strings}}] \leavevmode
-This field shall contain the offset in bytes of the strings block
-(see section {\hyperref[flattened\string-format:sect\string-fdt\string-strings\string-block]{\crossref{\DUrole{std,std-ref}{5.5}}}}) from the beginning of the header.
-
-\item[{\code{off\_mem\_rsvmap}}] \leavevmode
-This field shall contain the offset in bytes of the memory
-reservation block (see section {\hyperref[flattened\string-format:sect\string-fdt\string-memory\string-reservation\string-block]{\crossref{\DUrole{std,std-ref}{5.3}}}})
-from the beginning of the header.
-
-\item[{\code{version}}] \leavevmode
-This field shall contain the version of the devicetree data
-structure. The version is 17 if using the structure as defined in
-this document. An DTSpec boot program may provide the devicetree of
-a later version, in which case this field shall contain the version
-number defined in whichever later document gives the details of that
-version.
-
-\item[{\code{last\_comp\_version}}] \leavevmode
-This field shall contain the lowest version of the devicetree data
-structure with which the version used is backwards compatible. So,
-for the structure as defined in this document (version 17), this
-field shall contain 16 because version 17 is backwards compatible
-with version 16, but not earlier versions. As per section
-{\hyperref[flattened\string-format:sect\string-fdt\string-versioning]{\crossref{\DUrole{std,std-ref}{5.1}}}}, a DTSpec boot program should provide a
-devicetree in a format which is backwards compatible with version
-16, and thus this field shall always contain 16.
-
-\item[{\code{boot\_cpuid\_phys}}] \leavevmode
-This field shall contain the physical ID of the system’s boot CPU.
-It shall be identical to the physical ID given in the \code{reg} property
-of that CPU node within the devicetree.
-
-\item[{\code{size\_dt\_strings}}] \leavevmode
-This field shall contain the length in bytes of the strings block
-section of the devicetree blob.
-
-\item[{\code{size\_dt\_struct}}] \leavevmode
-This field shall contain the length in bytes of the structure block
-section of the devicetree blob.
-
-\end{description}
-
-
-\section{Memory Reservation Block}
-\label{flattened-format:memory-reservation-block}\label{flattened-format:sect-fdt-memory-reservation-block}
-
-\subsection{Purpose}
-\label{flattened-format:purpose}
-The \emph{memory reservation block} provides the client program with a list
-of areas in physical memory which are \emph{reserved}; that is, which shall
-not be used for general memory allocations. It is used to protect vital
-data structures from being overwritten by the client program. For
-example, on some systems with an IOMMU, the TCE (translation control
-entry) tables initialized by a DTSpec boot program would need to be
-protected in this manner. Likewise, any boot program code or data used
-during the client program’s runtime would need to be reserved (e.g.,
-RTAS on Open Firmware platforms). DTSpec does not require the boot
-program to provide any such runtime components, but it does not prohibit
-implementations from doing so as an extension.
-
-More specifically, a client program shall not access memory in a
-reserved region unless other information provided by the boot program
-explicitly indicates that it shall do so. The client program may then
-access the indicated section of the reserved memory in the indicated
-manner. Methods by which the boot program can indicate to the client
-program specific uses for reserved memory may appear in this document,
-in optional extensions to it, or in platform-specific documentation.
-
-The reserved regions supplied by a boot program may, but are not
-required to, encompass the devicetree blob itself. The client program
-shall ensure that it does not overwrite this data structure before it is
-used, whether or not it is in the reserved areas.
-
-Any memory that is declared in a memory node and is accessed by the boot
-program or caused to be accessed by the boot program after client entry
-must be reserved. Examples of this type of access include (e.g.,
-speculative memory reads through a non-guarded virtual page).
-
-This requirement is necessary because any memory that is not reserved
-may be accessed by the client program with arbitrary storage attributes.
-
-Any accesses to reserved memory by or caused by the boot program must be
-done as not Caching Inhibited and Memory Coherence Required (i.e., WIMG
-= 0bx01x), and additionally for Book III-S implementations as not Write
-Through Required (i.e., WIMG = 0b001x). Further, if the VLE storage
-attribute is supported, all accesses to reserved memory must be done as
-VLE=0.
-
-This requirement is necessary because the client program is permitted to
-map memory with storage attributes specified as not Write Through
-Required, not Caching Inhibited, and Memory Coherence Required (i.e.,
-WIMG = 0b001x), and VLE=0 where supported. The client program may use
-large virtual pages that contain reserved memory. However, the client
-program may not modify reserved memory, so the boot program may perform
-accesses to reserved memory as Write Through Required where conflicting
-values for this storage attribute are architecturally permissible.
-
-
-\subsection{Format}
-\label{flattened-format:format}
-The memory reservation block consists of a list of pairs of 64-bit
-big-endian integers, each pair being represented by the following C
-structure.
-
-\begin{Verbatim}[commandchars=\\\{\}]
-struct fdt\PYGZus{}reserve\PYGZus{}entry \PYGZob{}
-    uint64\PYGZus{}t address;
-    uint64\PYGZus{}t size;
-\PYGZcb{};
-\end{Verbatim}
-
-Each pair gives the physical address and size of a reserved memory
-region. These given regions shall not overlap each other. The list of
-reserved blocks shall be terminated with an entry where both address and
-size are equal to 0. Note that the address and size values are always
-64-bit. On 32-bit CPUs the upper 32-bits of the value are ignored.
-
-Each uint64\_t in the memory reservation block, and thus the memory
-reservation block as a whole, shall be located at an 8-byte aligned
-offset from the beginning of the devicetree blob (see section
-{\hyperref[flattened\string-format:sect\string-fdt\string-alignment]{\crossref{\DUrole{std,std-ref}{5.6}}}}).
-
-
-\section{Structure Block}
-\label{flattened-format:sect-fdt-structure-block}\label{flattened-format:structure-block}
-The structure block describes the structure and contents of the devicetree
-itself. It is composed of a sequence of tokens with data, as
-described in 0. These are organized into a linear tree structure, as
-described in 0.
-
-Each token in the structure block, and thus the structure block itself,
-shall be located at a 4-byte aligned offset from the beginning of the
-devicetree blob (see {\hyperref[flattened\string-format:sect\string-fdt\string-alignment]{\crossref{\DUrole{std,std-ref}{5.6}}}}).
-
-
-\subsection{Lexical structure}
-\label{flattened-format:lexical-structure}\label{flattened-format:sect-fdt-lexical-structure}
-The structure block is composed of a sequence of pieces, each beginning
-with a token, that is, a bigendian 32-bit integer. Some tokens are
-followed by extra data, the format of which is determined by the token
-value. All tokens shall be aligned on a 32-bit boundary, which may
-require padding bytes (with a value of 0x0) to be inserted after the
-previous token’s data.
-
-The five token types are as follows:
-\begin{description}
-\item[{\code{FDT\_BEGIN\_NODE} (0x00000001)}] \leavevmode
-The FDT\_BEGIN\_NODE token marks the beginning of a node’s
-representation. It shall be followed by the node’s unit name as
-extra data. The name is stored as a null-terminated string, and
-shall include the unit address (see section {\hyperref[devicetree\string-basics:sect\string-node\string-names]{\crossref{\DUrole{std,std-ref}{2.2.1}}}}), if any.
-The node name is followed by zeroed padding bytes, if necessary for
-alignment, and then the next token, which may be any token except
-FDT\_END.
-
-\item[{\code{FDT\_END\_NODE} (0x00000002)}] \leavevmode
-The FDT\_END\_NODE token marks the end of a node’s representation.
-This token has no extra data; so it is followed immediately by the
-next token, which may be any token except FDT\_PROP.
-
-\item[{\code{FDT\_PROP} (0x00000003)}] \leavevmode
-The FDT\_PROP token marks the beginning of the representation of one
-property in the devicetree. It shall be followed by extra data
-describing the property. This data consists first of the property’s
-length and name represented as the following C structure:
-
-\begin{Verbatim}[commandchars=\\\{\}]
-struct \PYGZob{}
-    uint32\PYGZus{}t len;
-    uint32\PYGZus{}t nameoff;
-\PYGZcb{}
-\end{Verbatim}
-
-Both the fields in this structure are 32-bit big-endian integers.
-\begin{itemize}
-\item {} 
-len gives the length of the property’s value in bytes (which may be
-zero, indicating an empty property, see section {\hyperref[devicetree\string-basics:sect\string-property\string-values]{\crossref{\DUrole{std,std-ref}{2.2.4.2}}}}).
-
-\item {} 
-nameoff gives an offset into the strings block
-(see section {\hyperref[flattened\string-format:sect\string-fdt\string-strings\string-block]{\crossref{\DUrole{std,std-ref}{5.5}}}})
-at which the property’s name is stored as a null-terminated string.
-
-\end{itemize}
-
-After this structure, the property’s value is given as a byte string of
-length len. This value is followed by zeroed padding bytes (if
-necessary) to align to the next 32-bit boundary and then the next token,
-which may be any token except FDT\_END.
-
-\item[{\code{FDT\_NOP} (0x00000004)}] \leavevmode
-The FDT\_NOP token will be ignored by any program parsing the device
-tree. This token has no extra data; so it is followed immediately by
-the next token, which can be any valid token. A property or node
-definition in the tree can be overwritten with FDT\_NOP tokens to
-remove it from the tree without needing to move other sections of
-the tree’s representation in the devicetree blob.
-
-\item[{\code{FDT\_END} (0x00000009)}] \leavevmode
-The FDT\_END token marks the end of the structure block. There shall
-be only one FDT\_END token, and it shall be the last token in the
-structure block. It has no extra data; so the byte immediately after
-the FDT\_END token has offset from the beginning of the structure
-block equal to the value of the size\_dt\_struct field in the device
-tree blob header.
-
-\end{description}
-
-
-\subsection{Tree structure}
-\label{flattened-format:tree-structure}
-The devicetree structure is represented as a linear tree: the
-representation of each node begins with an FDT\_BEGIN\_NODE token and
-ends with an FDT\_END\_NODE token. The node’s properties and subnodes
-(if any) are represented before the FDT\_END\_NODE, so that the
-FDT\_BEGIN\_NODE and FDT\_END\_NODE tokens for those subnodes are nested
-within those of the parent.
-
-The structure block as a whole consists of the root node’s
-representation (which contains the representations for all other nodes),
-followed by an FDT\_END token to mark the end of the structure block as
-a whole.
-
-More precisely, each node’s representation consists of the following
-components:
-\begin{itemize}
-\item {} 
-(optionally) any number of FDT\_NOP tokens
-
-\item {} 
-FDT\_BEGIN\_NODE token
-\begin{itemize}
-\item {} 
-The node’s name as a null-terminated string
-
-\item {} 
-{[}zeroed padding bytes to align to a 4-byte boundary{]}
-
-\end{itemize}
-
-\item {} 
-For each property of the node:
-\begin{itemize}
-\item {} 
-(optionally) any number of FDT\_NOP tokens
-
-\item {} 
-FDT\_PROP token
-\begin{itemize}
-\item {} 
-property information as given in section {\hyperref[flattened\string-format:sect\string-fdt\string-lexical\string-structure]{\crossref{\DUrole{std,std-ref}{5.4.1}}}}
-
-\item {} 
-{[}zeroed padding bytes to align to a 4-byte boundary{]}
-
-\end{itemize}
-
-\end{itemize}
-
-\item {} 
-Representations of all child nodes in this format
-
-\item {} 
-(optionally) any number of FDT\_NOP tokens
-
-\item {} 
-FDT\_END\_NODE token
-
-\end{itemize}
-
-Note that this process requires that all property definitions for a
-particular node precede any subnode definitions for that node. Although
-the structure would not be ambiguous if properties and subnodes were
-intermingled, the code needed to process a flat tree is simplified by
-this requirement.
-
-
-\section{Strings Block}
-\label{flattened-format:strings-block}\label{flattened-format:sect-fdt-strings-block}
-The strings block contains strings representing all the property names
-used in the tree. These nullterminated strings are simply concatenated
-together in this section, and referred to from the structure block by an
-offset into the strings block.
-
-The strings block has no alignment constraints and may appear at any
-offset from the beginning of the devicetree blob.
-
-
-\section{Alignment}
-\label{flattened-format:alignment}\label{flattened-format:sect-fdt-alignment}
-For the data in the memory reservation and structure blocks to be used
-without unaligned memory accesses, they shall lie at suitably aligned
-memory addresses. Specifically, the memory reservation block shall be
-aligned to an 8-byte boundary and the structure block to a 4-byte
-boundary.
-
-Furthermore, the devicetree blob as a whole can be relocated without
-destroying the alignment of the subblocks.
-
-As described in the previous sections, the structure and strings blocks
-shall have aligned offsets from the beginning of the devicetree blob.
-To ensure the in-memory alignment of the blocks, it is sufficient to
-ensure that the devicetree as a whole is loaded at an address aligned
-to the largest alignment of any of the subblocks, that is, to an 8-byte
-boundary. A DTSpec compliant boot
-program shall load the devicetree blob at such an aligned address
-before passing it to the client program. If an DTSpec client program
-relocates the devicetree blob in memory, it should only do so to
-another 8-byte aligned address.
-
-
-\chapter{Devicetree Source Format (version 1)}
-\label{source-language:chapter-devicetree-source-format}\label{source-language:devicetree-source-format-version-1}\label{source-language::doc}
-The Devicetree Source (DTS) format is a textual representation of a
-devicetree in a form that can be processed by dtc into a binary
-devicetree in the form expected by the kernel. The following description is
-not a formal syntax definition of DTS, but describes the basic
-constructs used to represent devicetrees.
-
-
-\section{Node and property definitions}
-\label{source-language:node-and-property-definitions}
-Devicetree nodes are defined with a node name and unit address with
-braces marking the start and end of the node definition. They may be
-preceded by a label.
-
-\begin{Verbatim}[commandchars=\\\{\}]
-[label:] node\PYGZhy{}name[@unit\PYGZhy{}address] \PYGZob{}
-    [properties definitions]
-    [child nodes]
-\PYGZcb{}
-\end{Verbatim}
-
-Nodes may contain property definitions and/or child node definitions. If
-both are present, properties shall come before child nodes.
-
-Property definitions are name value pairs in the form:
-
-\begin{Verbatim}[commandchars=\\\{\}]
-[label:] property\PYGZhy{}name = value;
-\end{Verbatim}
-
-except for properties with empty (zero length) value which have the
-form:
-
-\begin{Verbatim}[commandchars=\\\{\}]
-[label:] property\PYGZhy{}name;
-\end{Verbatim}
-
-Property values may be defined as an array of 32-bit integer cells, as
-null-terminated strings, as bytestrings or a combination of these.
-\begin{itemize}
-\item {} 
-Arrays of cells are represented by angle brackets surrounding a space
-separated list of C-style integers. Example:
-
-\end{itemize}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-interrupts = \PYGZlt{}17 0xc\PYGZgt{};
-\end{Verbatim}
-\begin{itemize}
-\item {} 
-A 64-bit value is represented with two 32-bit cells. Example:
-
-\end{itemize}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-clock\PYGZhy{}frequency = \PYGZlt{}0x00000001 0x00000000\PYGZgt{};
-\end{Verbatim}
-\begin{itemize}
-\item {} 
-A null-terminated string value is represented using double quotes
-(the property value is considered to include the terminating NULL
-character). Example:
-
-\end{itemize}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-compatible = \PYGZdq{}simple\PYGZhy{}bus\PYGZdq{};
-\end{Verbatim}
-\begin{itemize}
-\item {} 
-A bytestring is enclosed in square brackets {[} {]} with each byte
-represented by two hexadecimal digits. Spaces between each byte are
-optional. Example:
-
-\end{itemize}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-local\PYGZhy{}mac\PYGZhy{}address = [00 00 12 34 56 78];
-\end{Verbatim}
-
-or equivalently:
-
-\begin{Verbatim}[commandchars=\\\{\}]
-local\PYGZhy{}mac\PYGZhy{}address = [000012345678];
-\end{Verbatim}
-\begin{itemize}
-\item {} 
-Values may have several comma-separated components, which are
-concatenated together. Example:
-
-\end{itemize}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-compatible = \PYGZdq{}ns16550\PYGZdq{}, \PYGZdq{}ns8250\PYGZdq{};
-example = \PYGZlt{}0xf00f0000 19\PYGZgt{}, \PYGZdq{}a strange property format\PYGZdq{};
-\end{Verbatim}
-\begin{itemize}
-\item {} 
-In a cell array a reference to another node will be expanded to that
-node’s phandle. References may be \& followed by a node’s label.
-Example:
-
-\end{itemize}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-interrupt\PYGZhy{}parent = \PYGZlt{} \PYGZam{}mpic \PYGZgt{};
-\end{Verbatim}
-
-or they may be \& followed by a node’s full path in braces. Example:
-
-\begin{Verbatim}[commandchars=\\\{\}]
-interrupt\PYGZhy{}parent = \PYGZlt{} \PYGZam{}\PYGZob{}/soc/interrupt\PYGZhy{}controller@40000\PYGZcb{} \PYGZgt{};
-\end{Verbatim}
-\begin{itemize}
-\item {} 
-Outside a cell array, a reference to another node will be expanded to
-that node’s full path. Example:
-
-\end{itemize}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-ethernet0 = \PYGZam{}EMAC0;
-\end{Verbatim}
-\begin{itemize}
-\item {} 
-Labels may also appear before or after any component of a property
-value, or between cells of a cell array, or between bytes of a
-bytestring. Examples:
-
-\end{itemize}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-reg = reglabel: \PYGZlt{}0 sizelabel: 0x1000000\PYGZgt{};
-prop = [ab cd ef byte4: 00 ff fe];
-str = start: \PYGZdq{}string value\PYGZdq{} end: ;
-\end{Verbatim}
-
-
-\section{File layout}
-\label{source-language:file-layout}
-\textbf{Version 1 DTS files have the overall layout:}
-
-\begin{Verbatim}[commandchars=\\\{\}]
-/dts\PYGZhy{}v1/;
-[memory reservations]
-    / \PYGZob{}
-        [property definitions]
-        [child nodes]
-    \PYGZcb{};
-\end{Verbatim}
-
-The /dts-v1/; shall be present to identify the file as a version 1 DTS
-(dts files without this tag will be treated by dtc as being in the
-obsolete version 0, which uses a different format for integers in
-addition to other small but incompatible changes).
-
-Memory reservations define an entry for the devicetree blob’s memory
-reservation table. They have the form: e.g., /memreserve/ \textless{}address\textgreater{}
-\textless{}length\textgreater{}; Where \textless{}address\textgreater{} and \textless{}length\textgreater{} are 64-bit C-style integers.
-\begin{itemize}
-\item {} 
-The / \{ \}; section defines the root node of the devicetree.
-
-\item {} 
-C style (/* ... */) and C++ style (//) comments are supported.
-
-\end{itemize}
-
-\begin{thebibliography}{IEEE1275}
-\bibitem[b1]{b1}{\phantomsection\label{references:b1} 
-\emph{Power ISA™}, Version 2.06 Revision B, July 23, 2010. It is
-available from power.org (\url{http://power.org})
-}
-\bibitem[IEEE1275]{IEEE1275}{\phantomsection\label{references:ieee1275} 
-\emph{Boot (Initialization Configuration) Firmware: Core Requirements
-and Practices}, 1994, This is the core standard (also known as IEEE
-1275) that defines the devicetree concept adopted by the DTSpec and
-ePAPR. It is available from Global Engineering (\url{http://global.ihs.com/}).
-}
-\bibitem[b3]{b3}{\phantomsection\label{references:b3} 
-\emph{PowerPC Processor Binding to IEEE 1275-1994 Standard for Boot
-(Initialization, Configuration) Firmware}, Version 2.1, Open Firmware
-Working Group,
-(\url{http://playground.sun.com/1275/bindings/ppc/release/ppc-2\_1.html}),
-1996, This document specifies the PowerPC processor specific binding
-to the base standard.
-}
-\bibitem[b4]{b4}{\phantomsection\label{references:b4} 
-\emph{booting-without-of.txt}, Ben Herrenschmidt, Becky Bruce, et
-al., From the Linux kernel source tree (\url{http://www.kernel.org/}),
-Describes the devicetree as used by the Linux kernel.
-}
-\bibitem[b5]{b5}{\phantomsection\label{references:b5} 
-\emph{Device Trees Everywhere}, David Gibson and Ben Herrenschmidt
-(\url{http://ozlabs.org/~dgibson/home/papers/dtc-paper.pdf}), An overview
-of the concept of the devicetree and devicetree compiler.
-}
-\bibitem[b6]{b6}{\phantomsection\label{references:b6} 
-\emph{PCI Bus Binding to: IEEE Std 1275-1994 Standard for Boot
-(Initialization Configuration) Firmware}, Revision 2.1, Open Firmware
-Working Group, 1998
-(\url{http://playground.sun.com/1275/bindings/pci/pci2\_1.pdf})
-}
-\bibitem[b7]{b7}{\phantomsection\label{references:b7} 
-\emph{Open Firmware Recommended Practice: Interrupt Mapping}, Version
-0.9, Open Firmware Working Group, 1996
-(\url{http://playground.sun.com/1275/practice/imap/imap0\_9d.pdf})
-}
-\bibitem[b8]{b8}{\phantomsection\label{references:b8} 
-\emph{Open Firmware Recommended Practice: Device Support Extensions},
-Version 1.0, Open Firmware Working Group, 1997,
-(\url{http://playground.sun.com/1275/practice/devicex/dse1\_0a.html}) This
-document describes the binding for various device types such as
-network, RTC, keyboard, sound, etc.
-}
-\bibitem[b9]{b9}{\phantomsection\label{references:b9} 
-\emph{Open Firmware Recommended Practice: Universal Serial Bus
-Binding to IEEE 1275}, Version 1, Open Firmware Working Group, 1998
-(\url{http://playground.sun.com/1275/bindings/usb/usb-1\_0.ps})
-}
-\bibitem[CHRP]{CHRP}{\phantomsection\label{references:chrp} 
-\emph{PowerPC Microprocessor Common Hardware Reference Platform
-(CHRP) Binding}, Version 1.8, Open Firmware Working Group, 1998
-(\url{http://playground.sun.com/1275/bindings/chrp/chrp1\_8a.ps}). This
-document specifies the properties for Open PIC-compatible interrupt
-controllers.
-}
-\bibitem[b11]{b11}{\phantomsection\label{references:b11} 
-\emph{CHRP ISA Interrupt Controller Device Binding}, Unapproved
-Draft version 1.1, Open Firmware Working Group, Aug 19, 1996
-(\url{http://playground.sun.com/1275/bindings/devices/postscript/isa-pic-1\_1d.ps})
-}
-\bibitem[b12]{b12}{\phantomsection\label{references:b12} 
-\emph{The Open Programmable Interrupt Controller (PIC) Register
-Interface Specification}, Revision 1.2, Advanced Micro Devices and
-Cyrix Corporation, October 1995
-}
-\bibitem[b13]{b13}{\phantomsection\label{references:b13} 
-\emph{PCI Local Bus Specification}, Revision 2.2, PCI Special
-Interest Group
-}
-\bibitem[b14]{b14}{\phantomsection\label{references:b14} 
-\emph{PCI Express Base Specification}, Revision 1.0a, PCI Special
-Interest Group
-}
-\bibitem[b15]{b15}{\phantomsection\label{references:b15} 
-\emph{PCI-Express Binding to OF}, P1275 Openboot Working Group
-Proposal, 18 August 2004
-}
-\bibitem[PAPR]{PAPR}{\phantomsection\label{references:papr} 
-\emph{Power.org Standard for Power Architecture Platform
-Requirements}, power.org
-}
-\bibitem[b17]{b17}{\phantomsection\label{references:b17} 
-\emph{System V Application Binary Interface, Edition 4.1}, Published
-by The Santa Cruz Operation, Inc., 1997
-}
-\bibitem[b18]{b18}{\phantomsection\label{references:b18} 
-\emph{The Open Programmable Interrupt Controller (PIC) Register
-Interface Specification Revision 1.2}, AMD and Cyrix, October 1995
-}
-\bibitem[b19]{b19}{\phantomsection\label{references:b19} 
-\emph{RFC 2119, Key words for use in RFCs to Indicate Requirement
-Levels}, \url{http://www.ietf.org/rfc/rfc2119.txt}
-}
-\bibitem[b20]{b20}{\phantomsection\label{references:b20} 
-\emph{64-bit PowerPC ELF Application Binary Interface Supplement
-1.9}, Ian Lance Taylor, 2004
-}
-\bibitem[EPAPR]{EPAPR}{\phantomsection\label{references:epapr} 
-\emph{Power.org Standard for Embedded Power Architecture
-Platform Requirements}, power.org, 2011,
-\url{https://www.power.org/documentation/power-org-standard-for-embedded-power-architecture-platform-requirements-epapr-v1-1-2/}
-}
-\bibitem[ARMv8]{ARMv8}{\phantomsection\label{references:armv8} 
-\emph{ARM DDI 0487 ARM(c) Architecture Reference Manual,
-ARMv8 for ARMv8-A architecture profile}, ARM,
-\url{http://infocenter.arm.com/help/topic/com.arm.doc.ddi0487a.h/index.html}
-}
-\end{thebibliography}
-
-
-
-\renewcommand{\indexname}{Index}
-\printindex
-\end{document}
diff --git a/release/latex/fncychap.sty b/release/latex/fncychap.sty
deleted file mode 100644
index 9a56c04..0000000
--- a/release/latex/fncychap.sty
+++ /dev/null
@@ -1,683 +0,0 @@
-%%% Copyright   Ulf A. Lindgren
-%%%
-%%% Note        Premission is granted to modify this file under
-%%%             the condition that it is saved using another
-%%%             file and package name.
-%%%
-%%% Revision    1.1 (1997)
-%%%
-%%%             Jan. 8th Modified package name base date option
-%%%             Jan. 22th Modified FmN and FmTi for error in book.cls
-%%%                  \MakeUppercase{#}->{\MakeUppercase#}
-%%%             Apr. 6th Modified Lenny option to prevent undesired 
-%%%                  skip of line.
-%%%             Nov. 8th Fixed \@chapapp for AMS
-%%%
-%%% Revision    1.2 (1998)
-%%%
-%%%             Feb. 11th Fixed appendix problem related to Bjarne
-%%%             Aug. 11th Fixed problem related to 11pt and 12pt 
-%%%                  suggested by Tomas Lundberg. THANKS!
-%%%
-%%% Revision    1.3 (2004)
-%%%             Sep. 20th problem with frontmatter, mainmatter and
-%%%                  backmatter, pointed out by Lapo Mori
-%%%
-%%% Revision    1.31 (2004)
-%%%             Sep. 21th problem with the Rejne definition streched text
-%%%                  caused ugly gaps in the vrule aligned with the title
-%%%                  text. Kindly pointed out to me by Hendri Adriaens
-%%%
-%%% Revision    1.32 (2005)
-%%%             Jun. 23th compatibility problem with the KOMA class 'scrbook.cls'
-%%%                  a remedy is a redefinition of '\@schapter' in
-%%%                  line with that used in KOMA. The problem was pointed
-%%%                  out to me by Mikkel Holm Olsen
-%%%
-%%% Revision    1.33 (2005)
-%%%             Aug. 9th misspelled ``TWELV'' corrected, the error was pointed
-%%%                  out to me by George Pearson
-%%%
-%%% Revision    1.34 (2007)
-%%%             Added an alternative to Lenny provided by Peter
-%%%             Osborne (2005-11-28)
-%%%             Corrected front, main and back matter, based on input
-%%%             from Bas van Gils (2006-04-24)
-%%%             Jul. 30th Added Bjornstrup option provided by Jean-Marc
-%%%             Francois (2007-01-05).
-%%%             Reverted to \MakeUppercase{#} see rev 1.1, solved
-%%%             problem with MakeUppercase and MakeLowercase pointed
-%%%             out by Marco Feuerstein  (2007-06-06) 
-
-
-%%% Last modified   Jul. 2007
-
-\NeedsTeXFormat{LaTeX2e}[1995/12/01]
-\ProvidesPackage{fncychap}
-             [2007/07/30 v1.34
-                 LaTeX package (Revised chapters)]
-
-%%%% For conditional inclusion of color
-\newif\ifusecolor
-\usecolorfalse
-
-
-
-%%%% DEFINITION OF Chapapp variables
-\newcommand{\CNV}{\huge\bfseries}
-\newcommand{\ChNameVar}[1]{\renewcommand{\CNV}{#1}}
-
-
-%%%% DEFINITION OF TheChapter variables
-\newcommand{\CNoV}{\huge\bfseries}
-\newcommand{\ChNumVar}[1]{\renewcommand{\CNoV}{#1}}
-
-\newif\ifUCN
-\UCNfalse
-\newif\ifLCN
-\LCNfalse
-\def\ChNameLowerCase{\LCNtrue\UCNfalse}
-\def\ChNameUpperCase{\UCNtrue\LCNfalse}
-\def\ChNameAsIs{\UCNfalse\LCNfalse}
-
-%%%%% Fix for AMSBook 971008
-
-\@ifundefined{@chapapp}{\let\@chapapp\chaptername}{}
-
-
-%%%%% Fix for Bjarne and appendix 980211
-
-\newif\ifinapp
-\inappfalse
-\renewcommand\appendix{\par
-  \setcounter{chapter}{0}%
-  \setcounter{section}{0}%
-  \inapptrue%
-  \renewcommand\@chapapp{\appendixname}%
-  \renewcommand\thechapter{\@Alph\c@chapter}}
-
-%%%%% Fix for frontmatter, mainmatter, and backmatter 040920
-
-\@ifundefined{@mainmatter}{\newif\if@mainmatter \@mainmattertrue}{}
-
-%%%%%
-
-
-
-\newcommand{\FmN}[1]{%
-\ifUCN
-   {\MakeUppercase{#1}}\LCNfalse
-\else
-   \ifLCN
-      {\MakeLowercase{#1}}\UCNfalse
-   \else #1
-   \fi
-\fi}
-
-
-%%%% DEFINITION OF Title variables
-\newcommand{\CTV}{\Huge\bfseries}
-\newcommand{\ChTitleVar}[1]{\renewcommand{\CTV}{#1}}
-
-%%%% DEFINITION OF the basic rule width
-\newlength{\RW}
-\setlength{\RW}{1pt}
-\newcommand{\ChRuleWidth}[1]{\setlength{\RW}{#1}}
-
-\newif\ifUCT
-\UCTfalse
-\newif\ifLCT
-\LCTfalse
-\def\ChTitleLowerCase{\LCTtrue\UCTfalse}
-\def\ChTitleUpperCase{\UCTtrue\LCTfalse}
-\def\ChTitleAsIs{\UCTfalse\LCTfalse}
-\newcommand{\FmTi}[1]{%
-\ifUCT
-   {\MakeUppercase{#1}}\LCTfalse
-\else
-   \ifLCT
-      {\MakeLowercase{#1}}\UCTfalse
-   \else {#1}
-   \fi
-\fi}
-
-
-
-\newlength{\mylen}
-\newlength{\myhi}
-\newlength{\px}
-\newlength{\py}
-\newlength{\pyy}
-\newlength{\pxx}
-
-
-\def\mghrulefill#1{\leavevmode\leaders\hrule\@height #1\hfill\kern\z@}
-
-\newcommand{\DOCH}{%
-  \CNV\FmN{\@chapapp}\space \CNoV\thechapter
-  \par\nobreak
-  \vskip 20\p@
-  }
-\newcommand{\DOTI}[1]{%
-    \CTV\FmTi{#1}\par\nobreak
-    \vskip 40\p@
-    }
-\newcommand{\DOTIS}[1]{%
-    \CTV\FmTi{#1}\par\nobreak
-    \vskip 40\p@
-    }
-
-%%%%%% SONNY DEF
-
-\DeclareOption{Sonny}{%
-  \ChNameVar{\Large\sf}
-  \ChNumVar{\Huge}
-  \ChTitleVar{\Large\sf}
-  \ChRuleWidth{0.5pt}
-  \ChNameUpperCase
-  \renewcommand{\DOCH}{%
-    \raggedleft
-    \CNV\FmN{\@chapapp}\space \CNoV\thechapter
-    \par\nobreak
-    \vskip 40\p@}
-  \renewcommand{\DOTI}[1]{%
-    \CTV\raggedleft\mghrulefill{\RW}\par\nobreak
-    \vskip 5\p@
-    \CTV\FmTi{#1}\par\nobreak
-    \mghrulefill{\RW}\par\nobreak
-    \vskip 40\p@}
-  \renewcommand{\DOTIS}[1]{%
-    \CTV\raggedleft\mghrulefill{\RW}\par\nobreak
-    \vskip 5\p@
-    \CTV\FmTi{#1}\par\nobreak
-    \mghrulefill{\RW}\par\nobreak
-    \vskip 40\p@}
-}
-
-%%%%%% LENNY DEF
-
-\DeclareOption{Lenny}{%
-
-  \ChNameVar{\fontsize{14}{16}\usefont{OT1}{phv}{m}{n}\selectfont}
-  \ChNumVar{\fontsize{60}{62}\usefont{OT1}{ptm}{m}{n}\selectfont}
-  \ChTitleVar{\Huge\bfseries\rm}
-  \ChRuleWidth{1pt}
-  \renewcommand{\DOCH}{%
-    \settowidth{\px}{\CNV\FmN{\@chapapp}}
-    \addtolength{\px}{2pt}
-    \settoheight{\py}{\CNV\FmN{\@chapapp}}
-    \addtolength{\py}{1pt}
-
-    \settowidth{\mylen}{\CNV\FmN{\@chapapp}\space\CNoV\thechapter}
-    \addtolength{\mylen}{1pt}
-    \settowidth{\pxx}{\CNoV\thechapter}
-    \addtolength{\pxx}{-1pt}
-
-    \settoheight{\pyy}{\CNoV\thechapter}
-    \addtolength{\pyy}{-2pt}
-    \setlength{\myhi}{\pyy}
-    \addtolength{\myhi}{-1\py}
-    \par
-    \parbox[b]{\textwidth}{%
-    \rule[\py]{\RW}{\myhi}%
-    \hskip -\RW%
-    \rule[\pyy]{\px}{\RW}%
-    \hskip -\px%
-    \raggedright%
-    \CNV\FmN{\@chapapp}\space\CNoV\thechapter%
-    \hskip1pt%
-    \mghrulefill{\RW}%
-    \rule{\RW}{\pyy}\par\nobreak%
-    \vskip -\baselineskip%
-    \vskip -\pyy%
-    \hskip \mylen%
-    \mghrulefill{\RW}\par\nobreak%
-    \vskip \pyy}%
-    \vskip 20\p@}
- 
-
-  \renewcommand{\DOTI}[1]{%
-    \raggedright
-    \CTV\FmTi{#1}\par\nobreak
-    \vskip 40\p@}
-
-  \renewcommand{\DOTIS}[1]{%
-    \raggedright
-    \CTV\FmTi{#1}\par\nobreak
-    \vskip 40\p@}
- }
-
-%%%%%% Peter Osbornes' version of LENNY DEF
-
-\DeclareOption{PetersLenny}{%
-
-% five new lengths 
-\newlength{\bl}                           %  bottom left   : orig \space
-\setlength{\bl}{6pt}
-\newcommand{\BL}[1]{\setlength{\bl}{#1}}
-\newlength{\br}                           %  bottom right  : orig 1pt
-\setlength{\br}{1pt}
-\newcommand{\BR}[1]{\setlength{\br}{#1}}
-\newlength{\tl}                           %  top left      : orig 2pt
-\setlength{\tl}{2pt}
-\newcommand{\TL}[1]{\setlength{\tl}{#1}}
-\newlength{\trr}                           %  top right      :orig 1pt 
-\setlength{\trr}{1pt}
-\newcommand{\TR}[1]{\setlength{\trr}{#1}}
-\newlength{\blrule}                           %  top right      :orig 1pt 
-\setlength{\trr}{0pt}
-\newcommand{\BLrule}[1]{\setlength{\blrule}{#1}}
-
-
-  \ChNameVar{\fontsize{14}{16}\usefont{OT1}{phv}{m}{n}\selectfont}
-  \ChNumVar{\fontsize{60}{62}\usefont{OT1}{ptm}{m}{n}\selectfont}
-  \ChTitleVar{\Huge\bfseries\rm}
-  \ChRuleWidth{1pt}
-\renewcommand{\DOCH}{%
-
-
-%%%%%%%                                   tweaks for 1--9 and A--Z
-\ifcase\c@chapter\relax%
-\or\BL{-3pt}\TL{-4pt}\BR{0pt}\TR{-6pt}%1
-\or\BL{0pt}\TL{-4pt}\BR{2pt}\TR{-4pt}%2
-\or\BL{0pt}\TL{-4pt}\BR{2pt}\TR{-4pt}%3
-\or\BL{0pt}\TL{5pt}\BR{2pt}\TR{-4pt}%4
-\or\BL{0pt}\TL{3pt}\BR{2pt}\TR{-4pt}%5
-\or\BL{-1pt}\TL{0pt}\BR{2pt}\TR{-2pt}%6
-\or\BL{0pt}\TL{-3pt}\BR{2pt}\TR{-2pt}%7
-\or\BL{0pt}\TL{-3pt}\BR{2pt}\TR{-2pt}%8
-\or\BL{0pt}\TL{-3pt}\BR{-4pt}\TR{-2pt}%9
-\or\BL{-3pt}\TL{-3pt}\BR{2pt}\TR{-7pt}%10
-\or\BL{-6pt}\TL{-6pt}\BR{0pt}\TR{-9pt}%11
-\or\BL{-6pt}\TL{-6pt}\BR{2pt}\TR{-7pt}%12
-\or\BL{-5pt}\TL{-5pt}\BR{0pt}\TR{-9pt}%13
-\or\BL{-6pt}\TL{-6pt}\BR{0pt}\TR{-9pt}%14
-\or\BL{-3pt}\TL{-3pt}\BR{3pt}\TR{-6pt}%15
-\or\BL{-3pt}\TL{-3pt}\BR{3pt}\TR{-6pt}%16
-\or\BL{-5pt}\TL{-3pt}\BR{-8pt}\TR{-6pt}%17
-\or\BL{-5pt}\TL{-5pt}\BR{0pt}\TR{-9pt}%18
-\or\BL{-3pt}\TL{-3pt}\BR{-6pt}\TR{-9pt}%19
-\or\BL{0pt}\TL{0pt}\BR{0pt}\TR{-5pt}%20
-\fi
-
-\ifinapp\ifcase\c@chapter\relax%
-\or\BL{0pt}\TL{14pt}\BR{5pt}\TR{-19pt}%A
-\or\BL{0pt}\TL{-5pt}\BR{-3pt}\TR{-8pt}%B
-\or\BL{-3pt}\TL{-2pt}\BR{1pt}\TR{-6pt}\BLrule{0pt}%C
-\or\BL{0pt}\TL{-5pt}\BR{-3pt}\TR{-8pt}\BLrule{0pt}%D
-\or\BL{0pt}\TL{-5pt}\BR{2pt}\TR{-3pt}%E
-\or\BL{0pt}\TL{-5pt}\BR{-10pt}\TR{-1pt}%F
-\or\BL{-3pt}\TL{0pt}\BR{0pt}\TR{-7pt}%G
-\or\BL{0pt}\TL{-5pt}\BR{3pt}\TR{-1pt}%H
-\or\BL{0pt}\TL{-5pt}\BR{3pt}\TR{-1pt}%I
-\or\BL{2pt}\TL{0pt}\BR{-3pt}\TR{1pt}%J
-\or\BL{0pt}\TL{-5pt}\BR{3pt}\TR{-1pt}%K
-\or\BL{0pt}\TL{-5pt}\BR{2pt}\TR{-19pt}%L
-\or\BL{0pt}\TL{-5pt}\BR{3pt}\TR{-1pt}%M
-\or\BL{0pt}\TL{-5pt}\BR{-2pt}\TR{-1pt}%N
-\or\BL{-3pt}\TL{-2pt}\BR{-3pt}\TR{-11pt}%O
-\or\BL{0pt}\TL{-5pt}\BR{-9pt}\TR{-3pt}%P
-\or\BL{-3pt}\TL{-2pt}\BR{-3pt}\TR{-11pt}%Q
-\or\BL{0pt}\TL{-5pt}\BR{4pt}\TR{-8pt}%R
-\or\BL{-2pt}\TL{-2pt}\BR{-2pt}\TR{-7pt}%S
-\or\BL{-3pt}\TL{0pt}\BR{-5pt}\TR{4pt}\BLrule{8pt}%T
-\or\BL{-7pt}\TL{-11pt}\BR{-5pt}\TR{-7pt}\BLrule{0pt}%U
-\or\BL{-14pt}\TL{-5pt}\BR{-14pt}\TR{-1pt}\BLrule{14pt}%V
-\or\BL{-10pt}\TL{-9pt}\BR{-13pt}\TR{-3pt}\BLrule{7pt}%W
-\or\BL{0pt}\TL{-5pt}\BR{3pt}\TR{-1pt}\BLrule{0pt}%X
-\or\BL{-6pt}\TL{-4pt}\BR{-7pt}\TR{1pt}\BLrule{7pt}%Y
-\or\BL{0pt}\TL{-5pt}\BR{3pt}\TR{-1pt}\BLrule{0pt}%Z
-\fi\fi
-%%%%%%%
-    \settowidth{\px}{\CNV\FmN{\@chapapp}}
-    \addtolength{\px}{\tl}        %MOD change 2pt to \tl
-    \settoheight{\py}{\CNV\FmN{\@chapapp}}
-    \addtolength{\py}{1pt}
-
-    \settowidth{\mylen}{\CNV\FmN{\@chapapp}\space\CNoV\thechapter}
-    \addtolength{\mylen}{\trr}% MOD change 1pt to \tr
-    \settowidth{\pxx}{\CNoV\thechapter}
-    \addtolength{\pxx}{-1pt}
-
-    \settoheight{\pyy}{\CNoV\thechapter}
-    \addtolength{\pyy}{-2pt}
-    \setlength{\myhi}{\pyy}
-    \addtolength{\myhi}{-1\py}
-    \par
-    \parbox[b]{\textwidth}{%
-    \rule[\py]{\RW}{\myhi}%
-    \hskip -\RW%
-    \rule[\pyy]{\px}{\RW}% 
-    \hskip -\px%
-    \raggedright%
-    \CNV\FmN{\@chapapp}\rule{\blrule}{\RW}\hskip\bl\CNoV\thechapter%MOD 
-%    \CNV\FmN{\@chapapp}\space\CNoV\thechapter                     %ORIGINAL
-    \hskip\br%                           %MOD 1pt to \br
-    \mghrulefill{\RW}% 
-    \rule{\RW}{\pyy}\par\nobreak% 
-    \vskip -\baselineskip%
-    \vskip -\pyy%
-    \hskip \mylen%
-    \mghrulefill{\RW}\par\nobreak%
-    \vskip \pyy}%
-    \vskip 20\p@}
- 
-
-  \renewcommand{\DOTI}[1]{%
-    \raggedright
-    \CTV\FmTi{#1}\par\nobreak
-    \vskip 40\p@}
-
-  \renewcommand{\DOTIS}[1]{%
-    \raggedright
-    \CTV\FmTi{#1}\par\nobreak
-    \vskip 40\p@}
- }
-
-
-%
-
-
-%%%%%% BJORNSTRUP DEF
-
-\DeclareOption{Bjornstrup}{%
-  \usecolortrue
-  % pzc (Zapf Chancelery) is nice.  ppl (Palatino) is cool too.
-  \ChNumVar{\fontsize{76}{80}\usefont{OT1}{pzc}{m}{n}\selectfont}
-  \ChTitleVar{\raggedleft\Large\sffamily\bfseries}
-
-  \setlength{\myhi}{10pt}         % Space between grey box border and text
-  \setlength{\mylen}{\textwidth}
-  \addtolength{\mylen}{-2\myhi}
-  \renewcommand{\DOCH}{%
-    \settowidth{\py}{\CNoV\thechapter}
-    \addtolength{\py}{-10pt}      % Amount of space by which the
-%                                  % number is shifted right
-    \fboxsep=0pt%
-    \colorbox[gray]{.85}{\rule{0pt}{40pt}\parbox[b]{\textwidth}{\hfill}}%
-    \kern-\py\raise20pt%
-    \hbox{\color[gray]{.5}\CNoV\thechapter}\\%
-  }
-  
-  \renewcommand{\DOTI}[1]{%
-    \nointerlineskip\raggedright%
-    \fboxsep=\myhi%
-    \vskip-1ex%
-    \colorbox[gray]{.85}{\parbox[t]{\mylen}{\CTV\FmTi{#1}}}\par\nobreak%
-    \vskip 40\p@%
-  }
-
-  \renewcommand{\DOTIS}[1]{%
-    \fboxsep=0pt
-    \colorbox[gray]{.85}{\rule{0pt}{40pt}\parbox[b]{\textwidth}{\hfill}}\\%
-    \nointerlineskip\raggedright%
-    \fboxsep=\myhi%
-    \colorbox[gray]{.85}{\parbox[t]{\mylen}{\CTV\FmTi{#1}}}\par\nobreak%
-    \vskip 40\p@%
-  }
-}
-
-
-%%%%%%% GLENN DEF
-
-
-\DeclareOption{Glenn}{%
-  \ChNameVar{\bfseries\Large\sf}
-  \ChNumVar{\Huge}
-  \ChTitleVar{\bfseries\Large\rm}
-  \ChRuleWidth{1pt}
-  \ChNameUpperCase
-  \ChTitleUpperCase
-  \renewcommand{\DOCH}{%
-    \settoheight{\myhi}{\CTV\FmTi{Test}}
-    \setlength{\py}{\baselineskip}
-    \addtolength{\py}{\RW}
-    \addtolength{\py}{\myhi}
-    \setlength{\pyy}{\py}
-    \addtolength{\pyy}{-1\RW}
-     
-    \raggedright
-    \CNV\FmN{\@chapapp}\space\CNoV\thechapter
-    \hskip 3pt\mghrulefill{\RW}\rule[-1\pyy]{2\RW}{\py}\par\nobreak}
-
-  \renewcommand{\DOTI}[1]{%
-    \addtolength{\pyy}{-4pt}
-    \settoheight{\myhi}{\CTV\FmTi{#1}}
-    \addtolength{\myhi}{\py}
-    \addtolength{\myhi}{-1\RW}
-    \vskip -1\pyy
-    \rule{2\RW}{\myhi}\mghrulefill{\RW}\hskip 2pt
-    \raggedleft\CTV\FmTi{#1}\par\nobreak
-    \vskip 80\p@}
-
-\newlength{\backskip}
-  \renewcommand{\DOTIS}[1]{%
-%    \setlength{\py}{10pt}
-%    \setlength{\pyy}{\py}
-%    \addtolength{\pyy}{\RW}
-%    \setlength{\myhi}{\baselineskip}
-%    \addtolength{\myhi}{\pyy}
-%    \mghrulefill{\RW}\rule[-1\py]{2\RW}{\pyy}\par\nobreak
-%    \addtolength{}{}
-%\vskip -1\baselineskip
-%    \rule{2\RW}{\myhi}\mghrulefill{\RW}\hskip 2pt
-%    \raggedleft\CTV\FmTi{#1}\par\nobreak
-%    \vskip 60\p@}
-%% Fix suggested by Tomas Lundberg
-    \setlength{\py}{25pt}  % eller vad man vill
-    \setlength{\pyy}{\py}
-    \setlength{\backskip}{\py}
-    \addtolength{\backskip}{2pt}
-    \addtolength{\pyy}{\RW}
-    \setlength{\myhi}{\baselineskip}
-    \addtolength{\myhi}{\pyy}
-    \mghrulefill{\RW}\rule[-1\py]{2\RW}{\pyy}\par\nobreak
-    \vskip -1\backskip
-    \rule{2\RW}{\myhi}\mghrulefill{\RW}\hskip 3pt %
-    \raggedleft\CTV\FmTi{#1}\par\nobreak
-    \vskip 40\p@}
- }
-
-%%%%%%% CONNY DEF
-
-\DeclareOption{Conny}{%
-  \ChNameUpperCase
-  \ChTitleUpperCase  
-  \ChNameVar{\centering\Huge\rm\bfseries}
-  \ChNumVar{\Huge}
-  \ChTitleVar{\centering\Huge\rm}
-  \ChRuleWidth{2pt}
-
-  \renewcommand{\DOCH}{%
-    \mghrulefill{3\RW}\par\nobreak
-    \vskip -0.5\baselineskip
-    \mghrulefill{\RW}\par\nobreak
-    \CNV\FmN{\@chapapp}\space \CNoV\thechapter
-    \par\nobreak
-    \vskip -0.5\baselineskip
-   }
-  \renewcommand{\DOTI}[1]{%
-    \mghrulefill{\RW}\par\nobreak
-    \CTV\FmTi{#1}\par\nobreak
-    \vskip 60\p@
-    }
-  \renewcommand{\DOTIS}[1]{%
-    \mghrulefill{\RW}\par\nobreak
-    \CTV\FmTi{#1}\par\nobreak
-    \vskip 60\p@
-    }
-  }
-
-%%%%%%% REJNE DEF
-
-\DeclareOption{Rejne}{%
-
-  \ChNameUpperCase
-  \ChTitleUpperCase  
-  \ChNameVar{\centering\Large\rm}
-  \ChNumVar{\Huge}
-  \ChTitleVar{\centering\Huge\rm}
-  \ChRuleWidth{1pt}
-  \renewcommand{\DOCH}{%
-    \settoheight{\py}{\CNoV\thechapter}
-    \parskip=0pt plus 1pt % Set parskip to default, just in case v1.31
-    \addtolength{\py}{-1pt}
-    \CNV\FmN{\@chapapp}\par\nobreak
-    \vskip 20\p@
-    \setlength{\myhi}{2\baselineskip}
-    \setlength{\px}{\myhi}
-    \addtolength{\px}{-1\RW}
-    \rule[-1\px]{\RW}{\myhi}\mghrulefill{\RW}\hskip
-    10pt\raisebox{-0.5\py}{\CNoV\thechapter}\hskip 10pt\mghrulefill{\RW}\rule[-1\px]{\RW}{\myhi}\par\nobreak
-     \vskip -3\p@% Added -2pt vskip to correct for streched text v1.31
-    }
-  \renewcommand{\DOTI}[1]{%
-    \setlength{\mylen}{\textwidth}
-    \parskip=0pt plus 1pt % Set parskip to default, just in case v1.31
-    \addtolength{\mylen}{-2\RW}
-    {\vrule width\RW}\parbox{\mylen}{\CTV\FmTi{#1}}{\vrule width\RW}\par\nobreak%
-    \vskip -3pt\rule{\RW}{2\baselineskip}\mghrulefill{\RW}\rule{\RW}{2\baselineskip}%
-    \vskip 60\p@% Added -2pt in vskip to correct for streched text v1.31
-    }
-  \renewcommand{\DOTIS}[1]{%
-    \setlength{\py}{\fboxrule}
-    \setlength{\fboxrule}{\RW}
-    \setlength{\mylen}{\textwidth}
-    \addtolength{\mylen}{-2\RW}
-    \fbox{\parbox{\mylen}{\vskip 2\baselineskip\CTV\FmTi{#1}\par\nobreak\vskip \baselineskip}} 
-    \setlength{\fboxrule}{\py}
-    \vskip 60\p@
-    }
-  }
-
-
-%%%%%%% BJARNE DEF
-
-\DeclareOption{Bjarne}{%
-  \ChNameUpperCase
-  \ChTitleUpperCase  
-  \ChNameVar{\raggedleft\normalsize\rm}
-  \ChNumVar{\raggedleft \bfseries\Large}
-  \ChTitleVar{\raggedleft \Large\rm}
-  \ChRuleWidth{1pt}
-
-
-%% Note thechapter -> c@chapter fix appendix bug
-%% Fixed misspelled 12
-
-  \newcounter{AlphaCnt}
-  \newcounter{AlphaDecCnt}
-  \newcommand{\AlphaNo}{%
-    \ifcase\number\theAlphaCnt
-      \ifnum\c@chapter=0
-        ZERO\else{}\fi
-    \or ONE\or TWO\or THREE\or FOUR\or FIVE
-    \or SIX\or SEVEN\or EIGHT\or NINE\or TEN
-    \or ELEVEN\or TWELVE\or THIRTEEN\or FOURTEEN\or FIFTEEN
-    \or SIXTEEN\or SEVENTEEN\or EIGHTEEN\or NINETEEN\fi
-}
-
-  \newcommand{\AlphaDecNo}{%
-    \setcounter{AlphaDecCnt}{0}
-    \@whilenum\number\theAlphaCnt>0\do
-      {\addtocounter{AlphaCnt}{-10}
-       \addtocounter{AlphaDecCnt}{1}}
-     \ifnum\number\theAlphaCnt=0
-     \else
-       \addtocounter{AlphaDecCnt}{-1}
-       \addtocounter{AlphaCnt}{10}
-     \fi
-     
-     
-    \ifcase\number\theAlphaDecCnt\or TEN\or TWENTY\or THIRTY\or
-    FORTY\or FIFTY\or SIXTY\or SEVENTY\or EIGHTY\or NINETY\fi
-    }
-  \newcommand{\TheAlphaChapter}{%
-    
-    \ifinapp 
-      \thechapter
-    \else
-      \setcounter{AlphaCnt}{\c@chapter}
-      \ifnum\c@chapter<20
-        \AlphaNo
-      \else
-        \AlphaDecNo\AlphaNo
-      \fi
-    \fi
-    }  
-  \renewcommand{\DOCH}{%
-    \mghrulefill{\RW}\par\nobreak
-    \CNV\FmN{\@chapapp}\par\nobreak 
-    \CNoV\TheAlphaChapter\par\nobreak
-    \vskip -1\baselineskip\vskip 5pt\mghrulefill{\RW}\par\nobreak
-    \vskip 20\p@
-    }
-  \renewcommand{\DOTI}[1]{%
-    \CTV\FmTi{#1}\par\nobreak
-    \vskip 40\p@
-    }
-  \renewcommand{\DOTIS}[1]{%
-    \CTV\FmTi{#1}\par\nobreak
-    \vskip 40\p@
-    }
-}
-
-\DeclareOption*{%
-  \PackageWarning{fancychapter}{unknown style option}
-  }
-
-\ProcessOptions* \relax
-
-\ifusecolor
-  \RequirePackage{color} 
-\fi
-\def\@makechapterhead#1{%
-  \vspace*{50\p@}%
-  {\parindent \z@ \raggedright \normalfont
-    \ifnum \c@secnumdepth >\m@ne
-      \if@mainmatter%%%%% Fix for frontmatter, mainmatter, and backmatter 040920
-        \DOCH
-      \fi
-    \fi
-    \interlinepenalty\@M
-    \if@mainmatter%%%%% Fix for frontmatter, mainmatter, and backmatter 060424
-      \DOTI{#1}%
-    \else%
-      \DOTIS{#1}%
-    \fi
-  }}
-
-
-%%% Begin: To avoid problem with scrbook.cls (fncychap version 1.32)
-
-%%OUT:
-%\def\@schapter#1{\if@twocolumn
-%                   \@topnewpage[\@makeschapterhead{#1}]%
-%                 \else
-%                   \@makeschapterhead{#1}%
-%                   \@afterheading
-%                 \fi}
-
-%%IN:
-\def\@schapter#1{%
-\if@twocolumn%
-  \@makeschapterhead{#1}%
-\else%
-  \@makeschapterhead{#1}%
-  \@afterheading%
-\fi}
-
-%%% End: To avoid problem with scrbook.cls (fncychap version 1.32)
-
-\def\@makeschapterhead#1{%
-  \vspace*{50\p@}%
-  {\parindent \z@ \raggedright
-    \normalfont
-    \interlinepenalty\@M
-    \DOTIS{#1}
-    \vskip 40\p@
-  }}
-
-\endinput
-
-
diff --git a/release/latex/graphviz-1d3954672eca688030b49a13a35b6714d9abdcd5.pdf b/release/latex/graphviz-1d3954672eca688030b49a13a35b6714d9abdcd5.pdf
deleted file mode 100644
index 86a5844e363ec4fbcbfecf062581eedb2463534d..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 19470
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
PGW@|pXlqlPtPuYLN0=3+

diff --git a/release/latex/graphviz-23a197b43ca822bb92fb1a341bdd04b0845caa29.pdf b/release/latex/graphviz-23a197b43ca822bb92fb1a341bdd04b0845caa29.pdf
deleted file mode 100644
index 71540b9bc2f34ff2b0d7137e8ca3c90ed710d244..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 14813
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
B5IFz<

diff --git a/release/latex/graphviz-8bc6c34d442f7e613c5d327992e204083ddaf50f.pdf b/release/latex/graphviz-8bc6c34d442f7e613c5d327992e204083ddaf50f.pdf
deleted file mode 100644
index 5df3549a4a3b17a6d389dc13dc14379f8b95aebd..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 8688
zcmbt)by$>J_conU(nt&)N)6pzlF}kIz|b%-beEKLBS=b1NViByhe(HX35aydHyG!5
z&Uyd%UDx*v^UUmf){eFI-fIu{J@jhQvaFnJJQ(z~d*xRcTmTLL#KamySQx;r1h%(u
zwghm)Aax7?0KhJ5W$O%v!d`7b&R}V<DZ~tnAu5XD<O~Ia>@eJ4<)`%7)5+k5>|YSL
z*iyY3_GzS6M6;s97GEqCh_v1%jj|=eK|46@N}HJ|h<q?!bs}S?UG8^Fc$0pB>6<CW
z%11SSxcw#^9G=5U->@!t{8o689p?k<`Ne_I)&(Qd{!%gf#@Cyb(r2P%`^oz$<V0B+
zLj#|>mS!>aQkD|TLHDyF)X{k#>}JDjC_jill|@`qE89Yn-Z7I>%-QvKQIO%-=CFzu
z;n*e{>+6p%C+^8+jchF+P=zWvB-hKWCb$d-Co=KTQUQ-o>1Q_d?R*79U#5rJxM5`^
zuLcRs>r=F)LSl{vrL4a7$O#Dq9|sx-e6%8B119Ebx}cJA)Yed2?F+-*n}|>uUH_Jd
zRS`Uvu=GuF)OIo_%q*}^x}`i|Hs{-030|)Hn@Q8?oX#+>P;WQgiWaeJ&-I06oV*I1
z{h0l_LKPZY=$DBCTsoAGGo!}mD|QeEa^|_uj)-r!-We>DV+#goBWw+|*JYXw@PDS|
zCYqzEnY8q=iM_Bj6n3!LBGAv21Qa|Fpv6P5IFN0n(o}u!53jKW3rMOKTHnrHJn#_m
z8N+e;(_NToUK#`ODr~Y{zZnLLr@x%@t;Q854c~88cb9~pe@zhP+wM0)@;&$%>$_9M
z0ByjqwT?%Z@oQSSs!EwAeI192;SgM-k8;rIhqGg?7)UfkXyghIXKuD`>exN}Qe2ni
zK6kCnE{r(aN7gp->s>5e2yxc4u{C_P7?tC(1tTogl3j%Z;i|+u;Q2TFo|*Vc3@n{2
z?pkBiZ?t-a@@p_DNEe}3zTQ132k^)Tk;lzN9Tb$({6#ou6!9qzYleg><eB&1U_C`_
zn9=5${e+nrMTUOny=L2&i?i3>wDpO<si~Vt7vDg+Q%EeVEzTT8`W-}`4sV>>Tl15#
z9%BSuZd!<IwpXMznJ__IRzbVcT8P!w{g)HmO`fuCT|mivotnA&NH4rVA#X}Dz`(i3
z^YO<Um5lgK_iu@V4svEzb~s4(Bg$&OVuY|Fsa9;3bR1Z7*fNmFP05IFs=kdKJ5I?f
zs6r-ESBEHAvkDYFzQ@I&D2P0%rlnJC&En$uSc|H-^Vt{f#1dci36*~5gj{pUYMgA@
z&YdpKcrt~iUO9PQk45?K_0}EWl8c@aWTI_vQW;DFt-gJ)dr9>4vl|oE&<BA5he(6<
za;&<;o{MSEC!V~iN$W!{*>chgh%m3*-F8&locf3sMni~_pberV^6Qj->2H-`Ysva5
z6KS?YxmqjK<o*#^B;5`f6NURSKLNzt{;CYv??8n|z8jUaqvF%yB8o{3R;}-HMCeOF
zb3u1EQ8?FNP|LVav9@4%la@WL{LKb4vgh=Lxp<F6{xofkY&s2vbWvVN%8d**r;-3}
z0@|?r+WV(1XVZ!AF$&2!jB{Cx<7-j?P_$!;Z1lB!!PNEl+X|0R`?M)u$TOrWb?uN9
zQJ825jGAxMvBx3$)Uw3}-4Y8R?Ho9VkV8+8k4i3wq3;iQI+Fq=cKhJ<9_+QbYDr~R
z?KoN@o3gVf5aZ0JQ4KCeA9HzQfbGqG<tNy?yUcc%&hB1e35}DJkL%9ht_b`q@%>13
zGVacD8qTmZ2M`v%17H_BhyzvtuuDk*I05XYAlMz2{9qsaytB(f?4AFxHfQBv<pA*f
zPM$C$*x#?tc>n4Qz^>`x00ywDfh@p3I#vTg!LW8Xf7fGI2Af%dBq8pAXE2BZz$*X*
zaPe{j41QQk!TN-mI|1(U_Rl0O2Zgve{4tK7?f*c3JE8&W6$-L<a=7cu)Z;g-0C0x7
z{20ZZw^A@GX|Su6DOg=j^3LR!o9bXEhzryd>;$+Anff1I@xjXfIy?CP8rJ_hJMOyq
zdB|`AIDy=}KV13=00G?Gy!?LvTmT*}u78|1d#PYuO}qLYg>51Uq=mfWdkeYT7-Imm
z4vxY1XoK%Lx^NNhqfqBK%gfWE$qz`mDTF?Emd6NOBlYP&^B8d{cgi^0)3?~a0o_iv
ze!ab1oYK1**f5{s!EFKuRfQDi#F9|sf!;pKj)cn48e78M`#`N5`6~SxDOQj%E>j)`
z5@G`KJp+(G{2)4R9D+0**fA!R8$d%#8>q-V>FN?Ny#l4n%j@ojXI5ZVu+k@C+<q=Y
zYrDtc&u|}6iq@}0f*g)shZyPp#tMR^RJN<wXQZSjmW<0{>u}2Sdu_V_eK<7Zu#oBZ
z<kXg4aLA|}u5ZPFqbf|ts>&cJ9^QKt_-?pKj%P^m<j1SJY4ZFSxbU}>^^Pu=PD5BB
zuI+p9?zjBRRQ^JRSQy*>$hO7~&`|>d6!>8H7Qg1r;KQ5h6`Ts=cB+uzTU6KEr-v!(
zw+kh=iE2(R4h@)&*V|WxNq&m{{50fmZ^19nch5R5IiBgD_O`Lwm;kWRwpjDZ5bwd=
zQc5-yQ41UMHlf`c$9|vfNPEa-`@AL~hr%IaLZ%VmOGbPjKIpd6+%nXE_Ldwmd@;pX
zKHbmrL+wGKX)F*aK=y`Q`|T)|WQjaeKT1FivNSy%JQ^8RdwdW)9=QUXAq^aY&Id$)
zk0tMb=W$H;>@k<tUL3$LF>znSSmCB1h_hki5;s#VFVc>|_2P%f-cZECi!;&fvVXWh
z0?pqVrVyZt;|>}z1!+9LR&E#?ZIefOgy3)7mdykgcpJ!1-)w|iKXm}<!s0}`z+A~w
zYXhkCZxeSZ<oHRT&vW`oD9q#eO1uJ3wLKvyjJyfIokcZ3LkQ>W61<r>qsln%qw%Ze
zMGBI2hdXO;h<S{Z64rd{U41_F4&k=%q&X!1et)MT+7ue~6Duombv^P}BI1LKlp!@8
zZnBWB>+2Fn{3FIryoTcE?ZU=thx_o)+$)We>0%%~HC9J!sK9hvdn;Eq=N-+?Sx=dg
z2T~Qu_?7si>s_qqTidmI8QDO-yw^7)EUc27h@o$*BWEBMrL^4{%9GLH+3UUMLrBO(
zCJ;a$uU2{Ru<9ab8%r9`-17XGLE4S`BPaKQCyfUTEuSgI9^E>C`j5(LJVFX>qtxpa
zx$7R<b$>H29}NybujR^OJRGO~X6T~2@i}^|zcMk5&ESlXKD^+wTi#xF>9YM*ab>Gd
zd$i8gP>Ysmwlz0SSw#!y7XxX9P)<>Si4M#(k=(>M?h8x?whrv*yr>t!->DEvYI(oa
zo08(~em=F`?zCc+y&}f3+|izk)T)h$A9%Om=0K_ydSXYX*i*`+IWkrCj>b8BNZ{4z
zx<ixrU~!wIhz7_D<Sv97^X60>yg?`Wy}Zo0azX?%t>&rGhnd`SgNqa-VI_oFbB6&0
z7pJqrl1CW>!4HIqG^w-{agWRga&(E&v@dM*?L+%ghMh&Wb_mL@7@Qj=l1FlbwelJ)
z4H>Msvb<^aL#hNtok%=JRi*6CtsT8&I8Vo9Tv{#EahOK362}b+`bUltNms01=BuI&
zuZz{2s**CU*>09bM`U+B1bxZkJ}$Yg!et*{c(74)8dbQlMcN5ezRYBOV`RAx_ZDe{
zdIjLoHaU>PeIC{;qgRfv_@=lngQUP3+kQsgvdF86%;lPYVmAD9Ny&3ToiB&yg*L*;
z@5O@zj+jWv28F7EDga<;gBvO6n7$Y?ap?iQZag?tFzKhs@jSk#>2Z>pZy%F5(UPB`
zg(l5F(RnL)_)z(==9FFEyNK^8X9`j^0E0E{r!jq1b6DsMv&z}R!ZYJ_PhQy(WXDN|
zjAg{ArZ1HR>e|#gjCjrJRPB^mFQAQm%GjH$xoX-lN@lUW{Q7K+>z)>FEK<D#8dXRr
zTZy6hH4+I)q^rBG8tAZ(#c;9W@_w9R3)7?CFE-YEE=E_?L~s*(cBKmoST+O$rpATj
z#@ul}GH<A-(*PtI9wjRbye5uyv)clF>aL3x7t!qVgJLF8X3qgrvIDouW0GGR3wq$v
z<Z6yN2e<XHaK(5}laAGa*vZaVGs_J{wFJ+SFj{ZK&vxF+dW^cz(lAsKuYu`?voO&^
zDAC^O<Z2iS?mT_xtY4XSNi)!4T4b)op5)$e`GnQz@otMT)f=*Wl+TWu$V5lQZ|wZH
z?XS1teAVT?At)iwDY$x96#EC5&+wOxpK5>bB)ZbMedSe!a_&p@xH0h<jC8ufsO!Xm
zHH3|!ailLtvw}hOsgp@hYhScXW1>};UeWz4!~BVHvV&%A+x0ug=U-*s05Hm)+KjT~
zJM65MqK?n`<Ue)`c`z4zQu4T(VWX)C9W~xCMC6^}&f?ZW;cWiG$F2$w6_4=*eu8~(
z5gU@D=|#nkh_m**ftRUu0C>0NgPDuhlPs6V&lI|!mzp0V2H@aqPxD5lPKl+mQwjzk
zzs+`3%~+eGGYrYXR?QGmXL>IKytqVZ)#L3G+2TX_WH~Oiy*wg9UqL#KSeKl1g7^qL
z{mmW2vZZPH>%Ln;oZI909_9wFx^!7u72U?w;K6e@_JKzRWf>59Ov2DP2js`Vyaz}t
z=%1r<FIL<(kCdYs!xt1r^SBd&934>jh6G1Or_GQu=D-&BePZ6dZ{(g?Q2z8_2uS*A
z{d_vEkqyI2Me~Ah_MGsX2I3ZHqI30e3G;X&f43!S^y^EDBz02BOE#^IqSuQpM`Dtf
zb<JnH+iK^G&z8*tOs)t|JF!1QZ}dB#%~uwrPkdcxQlRhh)Zk(??&b~}QCy>($l6@5
z>U%dID4G?Czl(`}UIkq=n{o}q=c>s)bg2+|*8(nKcQ{?zxMY;;A36_lf9)?t{FL-v
zW&6F8_8hs-1ex@LRwaxiL$!JOQv4NLp$$x*p6u;Cls_Fcu&b#+N$DqC|H#a^j(IL(
zw&nsFb-a37_kF3#r-#+|w8>SVGHFvUMYDG1u_}(X-YczDHpd-&vb0qlSM~T6E_c!$
z%*gm226H*8Sm;OYp^};_cfA2*KY5=E*Gt<KgQAIO?d95thrNMUXZLiS1-2qEDI4yy
zEj+7H?G>kr3J3+%jc!dW04iggsqq(AcL^X^7UM5xirgFkK=JB4VXab1PaK6S{6k*5
zp21#cy(whd<?m@a%)OCRZyeH2eVbYv9-U^MH8sUJ)R^s$d7FH<Knb1O33(hED{V*`
z!6-giy%t$Saec9nfjP8L_b4y@Rh8O4i-u?)gFVGgi5rqp<*4UbE79Pr&M7bhvS71X
zW7_snfKLINzX5p#i_N~dp(Uismo1*en9bd{JMmLeZpiGL*C*+(Z07<4LJG;<8&no+
zha9c1TyorBd;vVn(?|fq(>ygVmy(pOOyyPEqy88|C1K2aRQBQ_uF=Lql=9omOENs<
zNfu67rJW~V)~<FkJXEEJY>qw=qKVs3mgCpujNnl!g<ursKhBLJP$VAHroBgOPt2CC
zB6m)CVAT4)Nxiuw>s~SgS05c?kc~s*Q;~6>^OXWQFR^ry=4eTCG`c6gDIN}=Te+8y
z8x$9dKj=jjzRR6v!p!Hivv!wSwt13{%i8W1iga?AM|ZeoxQ}t`hT4jJE*kHv)H{>z
zoc(C_FwC4QKqO-GOi5P>v!fnR5Anb?WTgTr-GBPnKCJRE*cOk2#G6=tXc;&qw-PmK
zDshHG#q->YM=EphEzkMLfUa6-*3}z`wkk8m!_h!%ckUKalPGRg2&Cs@MTWTEaN6ZF
z)uJi}<`WFHVBQTy*(k<!A<mC6PA#YIHJ$!%V}#n-?M!I0=63}9Re1490EUr01yWFa
zf4XGNbW|H)jrllTugoQ(30toBvDTF`^tCDClUZm^=8?!y@Oo>xj#~#)F~i>F(9q>E
zTHU0ZHfdqE`<C0_^&3iP>$CY?<GmtFH6J~m-MStv6*@uRl*i!11rO)i2l_0`z^Cfn
zH1~~mD#Oan!m1fN)@=wC1+8)!`se2M=8ts0uiqOv>yPzjbaC2$K>y5e&IycJY|1m4
zU?*jLk{r5|%GybGSyurJE=Wvm=>CGD(UuL56H;g-=i{@xf^7{Z6jKmi*iIM^i%c@B
zO6Ae?G9jL{C%Z~=8vI}&V8puFY~DL)yXGZZ(Bd?;5$F+SL*i3;Ibri4`jh+Nr0a3%
z0r|ifVr#ebYG9%fuCI{ELIlEq!giC?^6tdq<@Pk9(1!@R7x?(dBhtk;$=?=b!$*r+
z@putmg>ms+&_V=p6OazNY<tGdGp>*h>O>Jjy<aBSLIk6T)^w1@;-3Z{4wjZ8VvZCC
ze|vb8bwF#^^7>sgM0qan{-llu{XWZTF=2gChE_YgmJ(ZrQ?eO81ga}=D$X9ZtXm;9
zlFMKzU$usw>feXx6?2f8{LCOt!dsGcHA5BuM0k<dN*FQrG5wS__TKh|MRQb_crk_Z
z$adhx;Wjw;MdFLriz6`Wsm$53E@53F_6`C6dqN(tn*y)AcM14OP^VJlXWzt^OWeJE
zP?A<@Zl_EkRl_F#Bw*1AjVA)fYWJYwbi8pkzNZ$h@8TJh?Bmg1X<^=r9<N7`bWg<R
z5n-ekl!}dtT9mf!Zli>Wkk>vS^mAvvh)pyMXNFB@a#@P04U`H1MolMH3SlXBQMn()
zSA9(QwJo!XM8{{31p~@i7L(%A$%L^+yqZU&-6{obY>%`@%!=itQ!>zPJf_+lw_-lV
zx0@IGlq9WpcJ!NjVzan?j<HOAz<fn(YdCo^(_>eT9hLyrDcMSu-_uFDj9${BePNAR
z@$$98r}6@fe9J4LE)?K!NoOlRP;S0El^Go;SO{(6Wxdsb?iR+>+A{Fa24b<s*FrW&
z(twl+Dj5kCc_iPKOvu|D!Zx+js!U!2`qEF;R^T4W#r}0cX(_20k?sn;CB*EcX_2JR
zoZ(v(+SItRRDD>!9%I=E<YD}=thum^ddVkw3&J(36p~|S7Ue5~*_uYnFTx~4oXHcp
z<zDUiDMTOGyIj_N(qn9c;ZDaBFCtRB!17Dd4w8;8q$3irFPXQ6MMzh&oF8jFSY9H0
zeQmE$Z|LDmgI-(^*~>t=slremX6K?){=`W2KmdBv9p0flAzGb0^(HiYz9SB`qRefs
zQBvPX<2iGP!l=`z@bd~)UP5y@Z}*fDhm<i$>n-}G&!U%1C7dXGFnFiw)=GmOomAO?
zTCsXF*tHGvV);9KR^dx4yI5cxdTm(b?wg5Op+$2+_cPUD&;43e@)knt?A+GT+ki(`
zSH;tpl22ZipOHcO`X8v^*F~WRZnS)ADw)O!R9vl^avSP4*whvxEh(~jYAV-<Ln4Mk
z$4bImF|c6M+D|M;p-y%3iuf}ctzS-NN0->^wNBN^w^=+chLmckNnVbZTZf+qz7p&p
zJ`H>q>w$mcEkwI=P&430o<E=x1YG2JfuyBhG>La2fbgIYWk(HBJ7pg8xX;v2W8RC>
zlbmxg*>5g&UwdLX4>XH<oBjN;ACM{L<b6WMAhAasVXNsieoWnvi#^kXcBU^b{~UFe
z_G}@A$$E2g#p`LOD67kl%ANruAGTh3V09>!-ZBTTSxgj5R4zke6Q-4G^xfb&7pIAJ
zVE^v`Y*n|aQ3dv|q7+IxQLD<S){JUfKe{)zgM7(Il#a9b$y<`PJK%>EXU=0avFYCt
zi<4z|6!tPTXdY;x9b9p-Q){D52y+k#I%*ImGn-@N=C@%@9*&t&7goLm9VPo~RCd_$
zU+Y+|SunjgH10b-c)T@P53O+alj^oO5!HC(`=l#e?_mZHR+ummX91M_laQEOzT`@)
zdU#=_pO?oJ=Qyw*2U5fr1^tHg5Tb1Ph^xVRC;#g_mlEH2bxIoT`&Q;JLpEn2!VBMO
z5s-9uwsiH*<F;bIcVB`#$VT<IW$wGBC1Vk#Bah03B)m_{8(^2^Ca~u>$+bw<A)M}a
zk1mXxxA@MN+N~&9aGf<QDvcCSVv(<DUSRYE#}$1p_r~Rror+n)()7IZtEB$DMNz1P
zNZJ(PyYS@g2V#C5BXsFh>O>IHJQnXn7p+%gNjWdkkDDCSBWsBAG|6Y2oM(F%0x5iL
z&%fgho$+h;O>b9GWaPEK=sFJR9ocNATWau4iVjcZ4?fF3nKDI7eabEyQjMf{*up}c
zF|xc=7sIgMk0#tOI(}bRY2UW!Y3quXlZBvN4#gKQ2FAkA8mHC)ZyOy;pqjRymR3)8
z@1r)h-~nq5<+pRMRm$DwcXLISm1XLlHm)xlmgQO(_-sC?*A9n6zYH90uGX1u%qHs=
z5KK7A8ZtxQ43AJDSTNvb6b3;rgvdq9G*uG^&IKpN%{kZ1*UD~c_Qjn2eDR;%Qcs7l
zG1$KmcqVH4#KIyx{9*9BO!L>ngq$oul1$j4<S;UvW~O*#!>EJtVB5Hc^wWjYa%9Ym
z%eN*X86J1T<sKLI%IHERbRyqNt*Zl;YepeOIY&gwruwI^BQ!9&gTNVLJnV5GB|@aq
zat>Nd?_!cwBz5kwVzj^~TEU8J?1&zGq0bBp$d0<MuIjorD9<CK?p-Dq`sn$-@0VMd
z+8=f`@e(W3lNpzEk!o^i3Q`zaZ622Ks9$;%#TK8aD)KU(s)W{aR$U9;gn}+Yc>!BH
zwd~t{yD_Fdr=ZH-MJC~h%x-9JrUA!_Uy-nqNH+QLv=w>0KH#R34bGT=F>_kiB$I^B
z`@m5UXtZs!4;d5Q<jG;q=xFAkfA}S}vAaJ-{}Z3sElN0UGsA1>c!9Lpd6S{ZK^_<5
z$Ex<4B_@Q))exof3;V=}eqk$gwB<sWS%msccD_jy<g)6^#a9JNt<E`^*DuV}%SIwB
z(Rnk@SUoS<T%uDygb&iArU{&o7W7Dzy4k;4r3eZlE+9LT5o=QLS?!}Bz@SbwJC5>k
zU3?W6I-x%PQRYTOJ5RR;UzNwx2>ZINrT5lo>GnC?I6R7kshXItZ$iQ?Dr<k?)_+;$
zJEHR!tIPxB=J`$Z3jCK6<-B8Y|8IJlLEMmiC*Yp{zHo5NLQX%#>Y+?r!Pods-x^z-
z*uYOTtVnpCy>mFLB?+$b*C5gKF0;a~`PB^Kr^^--rv4vw_Z(kB45?oon3OU-9+eHg
zVriY==8x-M@ijnD$)K?K$Q|qRVTk^mkaxsWbTt9ae|N#=_=BPGk<S-_iN#k}?dW#?
z`ZcVU<fhG2?X6h&lF2XXGor5;O6PP>ExgOHbCh-h#T16fi20a~gIcpK4_kuG$)5#i
z-_AXZ)`wC~xO~fH?kU>vxR)EJwL&6YJ%ZnZ>(SFfYi^+$J-%yW;z}nF@AddgBl`?{
zc+6l=FV9&;v0t}7-aw!Y=Aq50O~2x>;^9njZyf3{RahKp-?EcwHud~%@&}2t)70uF
z4=TA=Y<xq>1=f#5zb+0%my8`@PEn@G{C9GGg#6d+aB%{EPY&lD$^M(L{z;SHarn|;
zCsU}EgEIvBgMPk)R6uqxj$T1cM^{Sop%je%wgUh9&=zFj1mOP5Q1T~H&&tgYU<LB?
z19<tl0sP#Yzu0;OXOOLxsf4|SEf~P@qmG1==^fh-Gx<@x>-w&ISN8`X1#*xFTUl8C
zZKB}}w$ldi|EzvjkpEq{8z_ur2LtYS_&<61I}PH$ZvJRr!^On;hyHNq{?9Q;f}FrV
zq>TURuNBnES;`Uw1#kg>G@u0fRptc#tp3jk!X%czR=bQnOfa^xw*au~SlLV1J6Zh(
zel(<GW#(+@^h@Np+amw_!OH=YK>m3CZ>u}>&g%d7@w1J;?|;Ah-SQps=kuSXpZ32;
z^Fy+MNiPsBd#gL`9B`K%{+y`)uE#rB$mvIX6s^qeqI0JlssAPZxZEj4e<(1Vf2&w9
z0SBha!xk}s$rNM-g#b9&IJwz)0Zf+8&JKd?F#QS!T0lV#mR6=tY!IjgGxLvr)SwVE
z7gLzZ|9`Lcx30zc=g$Xz?kFh`Y|%q3eztw*%`a)|?@I1ausH??fRh`8<F5<A%frLP
z126~t!uUD(V4mMy0Q=t<=iLVT7skQC30v*|w&VQ|#>dM83--V4xCCH3=U*7_-2(n6
z#w)-NbMv1V9|y;O#>dAc@L!CZ6E^Aptjo^{OA!CYfV_X$IYU9PeGUEbqYMozPw-u=
q?zA&?2n06&e@lM~_U5p8{!5l~at1-2e?*s`3kbxZr<YNc#rS{Qp%@bY

diff --git a/release/latex/graphviz-e69f9031183bd8d3b6636722c922fcb66d4843c4.pdf b/release/latex/graphviz-e69f9031183bd8d3b6636722c922fcb66d4843c4.pdf
deleted file mode 100644
index a99166be61f6268a238ce7e5e965b6021072b306..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 12918
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

diff --git a/release/latex/newfloat.sty b/release/latex/newfloat.sty
deleted file mode 100644
index 47ac5e5..0000000
--- a/release/latex/newfloat.sty
+++ /dev/null
@@ -1,737 +0,0 @@
-%%
-%% This is file `newfloat.sty',
-%% generated with the docstrip utility.
-%%
-%% The original source files were:
-%%
-%% newfloat.dtx  (with options: `package')
-%% 
-%% Copyright (C) 1994-2016 Axel Sommerfeldt (axel.sommerfeldt-362TJNa6IEM@public.gmane.org)
-%% 
-%% http://sourceforge.net/projects/latex-caption/
-%% 
-%% --------------------------------------------------------------------------
-%% 
-%% This work may be distributed and/or modified under the
-%% conditions of the LaTeX Project Public License, either version 1.3
-%% of this license or (at your option) any later version.
-%% The latest version of this license is in
-%%   http://www.latex-project.org/lppl.txt
-%% and version 1.3 or later is part of all distributions of LaTeX
-%% version 2003/12/01 or later.
-%% 
-%% This work has the LPPL maintenance status "maintained".
-%% 
-%% This Current Maintainer of this work is Axel Sommerfeldt.
-%% 
-%% This work consists of the files
-%%   CHANGELOG, README, SUMMARY, caption.ins,
-%%   caption.dtx, caption2.dtx, caption3.dtx,
-%%   bicaption.dtx, ltcaption.dtx, subcaption.dtx,
-%%   newfloat.dtx, and totalcount.dtx
-%% the derived files
-%%   caption.sty, caption2.sty, caption3.sty,
-%%   bicaption.sty, ltcaption.sty, subcaption.sty,
-%%   newfloat.sty, and totalcount.sty
-%% and the user manuals
-%%   caption-deu.tex, caption-eng.tex, and caption-rus.tex.
-%% 
-\NeedsTeXFormat{LaTeX2e}[1994/12/01]
-\def\caption@tempa$Id: #1 #2 #3-#4-#5 #6${%
-  \def\caption@tempa{#3/#4/#5 }\def\caption@tempb{#2 }}
-\caption@tempa $Id: newfloat.dtx 109 2015-09-17 09:29:07Z sommerfeldt $
-\ProvidesPackage{newfloat}[\caption@tempa v1.1-\caption@tempb Defining new floating environments (AR)]
-\newcommand*\newfloat@Info[1]{%
-  \PackageInfo{newfloat}{#1}}
-\newcommand*\newfloat@InfoNoLine[1]{%
-  \newfloat@Info{#1\@gobble}}
-\newcommand*\newfloat@Error[1]{%
-  \PackageError{newfloat}{#1}\newfloat@eh}
-\newcommand*\newfloat@eh{%
-  If you do not understand this error, please take a closer look\MessageBreak
-  at the documentation of the `newfloat' package.\MessageBreak\@ehc}
-\RequirePackage{keyval}[1997/11/10]
-\newcommand*\newfloat@def[2]{%
-  \newfloat@ifundefined{#1}{%
-    \@namedef{#1}{#2}}}
-\newcommand*\newfloat@let[2]{%
-  \newfloat@ifundefined{#1}{%
-    \expandafter\let\csname #1\endcsname#2}}
-\newcommand*\newfloat@ifundefined[2]{%
-  \@ifundefined{#1}{#2}{%
-    \newfloat@Info{%
-      \expandafter\string\csname#1\endcsname\space is already defined}}}
-\newcommand*\DeclareFloatingEnvironment{%
-  \@testopt\@DeclareFloatingEnvironment{}}
-\@onlypreamble\DeclareFloatingEnvironment
-\def\@DeclareFloatingEnvironment[#1]#2{%
-  \newfloat@Info{New float `#2' with options `#1'}%
-  \newfloat@ifundefined{c@#2}{\newcounter{#2}}%
-  \ifdefined\c@float@type % from float package
-    \expandafter\edef\csname ftype@#2\endcsname{\the\value{float@type}}%
-    \addtocounter{float@type}{\value{float@type}}%
-  \else\ifdefined\c@newflo@tctr % from memoir document class
-    \expandafter\edef\csname ftype@#2\endcsname{\the\c@newflo@tctr}%
-    \advance\c@newflo@tctr \c@newflo@tctr
-  \else
-    \ifdefined\newfloat@ftype \else
-      \newcount\newfloat@ftype
-      \newfloat@ftype=8\relax
-    \fi
-    \expandafter\xdef\csname ftype@#2\endcsname{\the\newfloat@ftype}%
-    \advance\newfloat@ftype\newfloat@ftype
-  \fi\fi
-  \newfloat@Info{float type `#2'=\@nameuse{ftype@#2}}%
-  \newfloat@def{fnum@#2}%
-   {\@nameuse{#2name}\nobreakspace\@nameuse{the#2}\@nameuse{autodot}}%
-  \newfloat@capitalize\newfloat@Type{#2}%
-  \newfloat@let{#2name}{\newfloat@Type}%
-  \newfloat@def{fleg#2}{\@nameuse{#2name}}% legend naming (memoir)
-  \newfloat@ifundefined{flegtoc#2}{\@namedef{flegtoc#2}##1{}}%
-  \ifcsname @tufte@float\endcsname
-    \newenvironment{#2}[1][htbp]%
-      {\begin{@tufte@float}[##1]{#2}{}}%
-      {\end{@tufte@float}}%
-    \newenvironment{#2*}[1][htbp]%
-      {\begin{@tufte@float}[##1]{#2}{star}}%
-      {\end{@tufte@float}}%
-  \else
-    \newenvironment{#2}{\@float{#2}}{\end@float}%
-    \newenvironment{#2*}{\@dblfloat{#2}}{\end@dblfloat}%
-  \fi
-  \newfloat@def{listof#2}{\newfloat@listof{#2}}%
-  \newfloat@def{listof#2s}{\@nameuse{listof#2}}%
-  \newfloat@def{listof#2es}{\@nameuse{listof#2s}}%
-  \newfloat@def{newfloat@listof#2@hook}{}%
-  \ifdefined\l@figure
-    \newfloat@let{l@#2}{\l@figure}%
-  \else
-    \newfloat@def{l@#2}{\@dottedtocline{1}{1.5em}{2.3em}}%
-  \fi
-  \edef\newfloat@tempa{List of \newfloat@Type s}%
-  \newfloat@let{list#2name}{\newfloat@tempa}%
-  \expandafter\let\csname fst@#2\endcsname\@undefined
-  \newfloat@ifundefined{fps@#2}{\newfloat@setplacement{#2}{tbp}}%
-  \newfloat@ifundefined{ext@#2}{\newfloat@setfileext{#2}{lo#2}}%
-  \newfloat@setoptions*{#2}{#1}%
-  \@expandtwoargs\newfloat@announce{#2}{\@nameuse{ext@#2}}%
-  \@ifnextchar[\newfloat@DFE@setname\relax}
-\@onlypreamble\@DeclareFloatingEnvironment
-\def\newfloat@DFE@setname[#1]{%
-  \KV@@newfloat@name{#1}%
-  \@ifnextchar[\newfloat@DFE@setlistname\relax}
-\@onlypreamble\newfloat@DFE@setname
-\def\newfloat@DFE@setlistname[#1]{%
-  \KV@@newfloat@listname{#1}}
-\@onlypreamble\newfloat@DFE@setlistname
-\newcommand*\newfloat@capitalize[2]{%
-  \edef\newfloat@tempa{\gdef\noexpand#1{\@car#2\@nil}}%
-  \uppercase\expandafter{\newfloat@tempa}%
-  \edef\newfloat@tempa{%
-    \noexpand\g@addto@macro\noexpand#1{\@cdr#2\@nil}}%
-  \newfloat@tempa}
-\newcommand*\newfloat@listof[1]{%
-  \@expandtwoargs\newfloat@list@of{#1}{\@nameuse{ext@#1}}}
-\newcommand*\newfloat@list@of[2]{%
-  \begingroup
-    \expandafter\let\expandafter\listfigurename\csname list#1name\endcsname
-    \def\ext@figure{#2}%
-    \let\newfloat@starttoc\@starttoc
-    \def\@starttoc##1{\newfloat@starttoc{#2}}%
-    \let\newfloat@listoftoc\listoftoc
-    \def\listoftoc##1{\newfloat@listoftoc{#2}}%
-    \@nameuse{newfloat@listof#1@hook}%
-    \listoffigures
-  \endgroup}
-\newcommand*\newfloat@setoptions{%
-  \@ifstar
-    {\newfloat@@setoptions\@firstofone}%
-    {\newfloat@@setoptions\@gobble}}
-\newcommand*\newfloat@@setoptions[3]{%
-  \let\newfloat@within@value\@undefined
-  \let\newfloat@chapterlistsgaps@value\@undefined
-  #1{\KV@@newfloat@within\newfloat@within@default}% set default value for new floats
-  \def\newfloat@type{#2}%
-  \setkeys{@newfloat}{#3}%
-  \ifx\newfloat@within@value\@undefined \else
-    \newfloat@setoption{within}\newfloat@within@value
-  \fi
-  \ifx\newfloat@chapterlistsgaps@value\@undefined \else
-    \newfloat@setoption{chapterlistsgaps}\newfloat@chapterlistsgaps@value
-  \fi}
-\newcommand*\newfloat@within@default{%
-  \ifcsname c@chapter\endcsname chapter\else none\fi}
-\@onlypreamble\newfloat@within@default
-\newcommand*\newfloat@setoption[1]{%
-  \edef\caption@tempa{\noexpand\@nameuse{newfloat@set#1}{\newfloat@type}}%
-  \caption@tempa}
-\newcommand*\newfloat@setfileext[2]{%
-  \@namedef{ext@#1}{#2}}
-\define@key{@newfloat}{fileext}{%
-  \newfloat@setoption{fileext}{#1}}
-\newcommand*\newfloat@setlistname[2]{%
-  \@namedef{list#1name}{#2}}
-\define@key{@newfloat}{listname}{%
-  \newfloat@setoption{listname}{#1}}
-\newcommand*\newfloat@setname[2]{%
-  \newfloat@@setname{#1}{#2}%
-  \begingroup
-    \ifcsname languagename\endcsname
-      \ifcsname captions\languagename\endcsname
-        \expandafter\g@addto@macro\csname captions\languagename\endcsname
-          {\newfloat@@setname{#1}{#2}}%
-      \fi
-    \fi
-  \endgroup}
-%%\AtBeginDocument{\let\newfloat@setname\newfloat@@setname}
-\newcommand*\newfloat@@setname[2]{%
-  \@namedef{#1name}{#2}}
-\define@key{@newfloat}{name}{%
-  \newfloat@setoption{name}{#1}}
-\newcommand*\newfloat@setplacement[2]{%
-  \@namedef{fps@#1}{#2}}
-\define@key{@newfloat}{placement}{%
-  \newfloat@setoption{placement}{#1}}
-\newcommand*\newfloat@setwithin[2]{%
-  \ifcsname c@chapter\endcsname
-    \@removefromreset{#1}{chapter}%
-  \fi
-  \@removefromreset{#1}{section}%
-  \edef\@tempa{#2}%
-  \ifx\@tempa\@empty
-    \def\@tempa{none}%
-  \fi
-  \def\@tempb{none}%
-  \ifx\@tempa\@tempb
-    \ifcsname c@chapter\endcsname
-      \@chapterlistsgap@off{#1}%
-    \fi
-    \newfloat@@setwithin{#1}{}{}%
-  \else
-    \def\@tempb{chapter}%
-    \ifx\@tempa\@tempb
-      \@addtoreset{#1}{chapter}%
-      \@chapterlistsgap@on{#1}%
-      \newfloat@@setwithin{#1}{\ifnum\c@chapter>\z@ \thechapter.\fi}{\theHchapter.}%
-    \else
-      \def\@tempb{section}%
-      \ifx\@tempa\@tempb
-        \@addtoreset{#1}{section}%
-        \ifcsname c@chapter\endcsname
-          \@addtoreset{#1}{chapter}%
-          \@chapterlistsgap@on{#1}%
-          \newfloat@@setwithin{#1}{\thesection.}{\theHsection.}%
-        \else
-          \newfloat@@setwithin{#1}{\ifnum\c@section>\z@ \thesection.\fi}{\theHsection.}%
-        \fi
-      \else
-        \newfloat@Error{Invalid value `#2' for option `within'}%
-      \fi
-    \fi
-  \fi}
-\newcommand*\newfloat@@setwithin[3]{%
-  \global\@namedef{the#1}{#2\arabic{#1}}%
-  \global\@namedef{theH#1}{#3\arabic{#1}}}
-\define@key{@newfloat}{within}{%
-  \def\newfloat@within@value{#1}}
-\newcommand*\newfloat@setwithout[1]{%
-  \newfloat@setwithin{#1}{none}}
-\define@key{@newfloat}{without}[]{%
-  \def\newfloat@within@value{none}}
-\newcommand*\newfloat@setchapterlistsgaps[2]{%
-  \edef\@tempa{#2}%
-  \def\@tempb{off}%
-  \ifx\@tempa\@tempb
-    \@chapterlistsgap@off{#1}%
-  \else
-    \def\@tempb{on}%
-    \ifx\@tempa\@tempb
-      \@chapterlistsgap@on{#1}%
-    \else
-      \newfloat@Error{Invalid value `#2' for option `chapterlistsgaps'}%
-    \fi
-  \fi}
-\define@key{@newfloat}{chapterlistsgaps}{%
-  \def\newfloat@chapterlistsgaps@value{#1}}
-\providecommand*\@removefromreset[2]{{%
-  \expandafter\let\csname c@#1\endcsname\@removefromreset
-  \def\@elt##1{%
-    \expandafter\ifx\csname c@##1\endcsname\@removefromreset
-    \else
-      \noexpand\@elt{##1}%
-    \fi}%
-  \expandafter\xdef\csname cl@#2\endcsname{%
-    \csname cl@#2\endcsname}}}
-\newcommand*\newfloat@announce[2]{%
-  \@cons\newfloat@list{{#1}}%
-  \@cons\newfloat@@list{{#1}}%
-  \newfloat@ifundefined{newfloat@ext@#2}{%
-    \@namedef{newfloat@ext@#2}{#1}%
-    \ifcsname c@lofdepth\endcsname
-      \newfloat@ifundefined{c@#2depth}{%
-        \newcounter{#2depth}%
-        \setcounter{#2depth}{1}}%
-    \fi
-    \ifcsname addtotoclist\endcsname
-      \addtotoclist[float]{#2}%
-      \newfloat@def{listof#2name}{\@nameuse{list#1name}}%
-    \fi
-  }%
-  \ifcsname contentsuse\endcsname
-    \contentsuse{#1}{#2}%
-  \fi
-  \newfloat@hook{#1}}
-\@onlypreamble\newfloat@announce
-\newcommand*\newfloat@@list{}
-\newcommand*\SetupFloatingEnvironment[1]{%
-  \newfloat@addtolist{#1}%
-  \newfloat@setoptions{#1}}
-\newcommand\ForEachFloatingEnvironment{%
-  \@ifstar
-    {\@ForEachFloatingEnvironment\@gobble}%
-    {\@ForEachFloatingEnvironment\@iden}}
-\newcommand\@ForEachFloatingEnvironment[2]{%
-  \def\@elt##1{#2}%
-  \newfloat@list
-  \let\@elt\relax
-  #1{\newfloat@addtohook{#2}}}
-\providecommand\newfloat@addtohook[1]{%
-  \toks@=\expandafter{\newfloat@hook{##1}#1}%
-  \edef\@tempa{\def\noexpand\newfloat@hook####1{\the\toks@}}%
-  \@tempa}
-\providecommand*\newfloat@hook[1]{}
-\newcommand\PrepareListOf[1]{%
-  \expandafter\g@addto@macro\csname newfloat@listof#1@hook\endcsname}
-\@onlypreamble\PrepareListOf
-\newcommand*\newfloat@list{}
-\newcommand*\newfloat@addtolist[1]{%
-  \newfloat@ifinlist{#1}{}{%
-    \ifcsname ext@#1\endcsname
-      \@cons\newfloat@list{{#1}}%
-      \@namedef{newfloat@ext@\@nameuse{ext@#1}}{#1}%
-      \newfloat@let{@ifchapterlistsgap@#1}{\@iden}%
-    \else
-      \newfloat@Error{`#1' does not seem to be a floating environment}%
-    \fi}}
-\newcommand*\newfloat@ifinlist[1]{%
-  \let\next\@secondoftwo
-  \begingroup
-    \expandafter\let\csname c@#1\endcsname\newfloat@ifinlist
-    \def\@elt##1{%
-      \expandafter\ifx\csname c@##1\endcsname\newfloat@ifinlist
-        \global\let\next\@firstoftwo
-      \fi}%
-    \newfloat@list
-  \endgroup
-  \next}
-\ifcsname ext@figure\endcsname
-  \newfloat@addtolist{figure}
-\fi
-\ifcsname ext@table\endcsname
-  \newfloat@addtolist{table}
-\fi
-\ifcsname @chapter\endcsname
-  \providecommand*\@chapterlistsgap{10\p@}%
-  \providecommand*\@addchapterlistsgap[2]{%
-    \@nameuse{@ifchapterlistsgap@#1}{% if switched on
-      \@@addchapterlistsgap{#1}{#2}}}
-  \providecommand*\@@addchapterlistsgap[2]{%
-    \@ifundefined{@addchapterlistsgap@#2}{% only once per extension
-      \@namedef{@addchapterlistsgap@#2}{#1}%
-      \@@@addchapterlistsgap{#2}}{}}
-  \providecommand*\@@@addchapterlistsgap[1]{%
-    \ifdim \@chapterlistsgap>\z@
-      \addtocontents{#1}{\protect\addvspace{\@chapterlistsgap}}%
-    \fi}
-  \providecommand*\@addchapterlistsgaps{%
-    \begingroup
-      \def\@elt##1{%
-        \@expandtwoargs\@addchapterlistsgap{##1}{\@nameuse{ext@##1}}}%
-      \newfloat@list
-    \endgroup}
-  \providecommand*\@chapterlistsgap@off[1]{%
-    \expandafter\let\csname @ifchapterlistsgap@#1\endcsname\@gobble
-    \ifcsname unsettoc\endcsname
-      \@expandtwoargs\unsettoc{\@nameuse{ext@#1}}{chapteratlist}%
-    \fi}
-  \providecommand*\@chapterlistsgap@on[1]{%
-    \expandafter\let\csname @ifchapterlistsgap@#1\endcsname\@iden
-    \ifcsname setuptoc\endcsname
-      \@expandtwoargs\setuptoc{\@nameuse{ext@#1}}{chapteratlist}%
-    \fi}
-\fi
-\define@key{newfloat}{chapterlistsgap}{%
-  \renewcommand*\@chapterlistsgap{#1}}
-\define@key{newfloat}{within}{%
-  \def\newfloat@within@default{#1}% set new default value
-  \def\@elt##1{\newfloat@setwithin{##1}{#1}}%
-  \newfloat@list
-  \let\@elt\relax}
-\define@key{newfloat}{without}[]{%
-  \KV@newfloat@within{none}}
-\def\@elt#1{%
-  \define@key{newfloat}{#1name}{%
-    \newfloat@setname{#1}{##1}}%
-  \define@key{newfloat}{list#1name}{%
-    \newfloat@setname{list#1}{##1}}%
-  \define@key{newfloat}{#1within}{%
-    \newfloat@setwithin{#1}{##1}}%
-  \define@key{newfloat}{#1without}[]{%
-    \newfloat@setwithout{#1}}%
-}%
-\newfloat@list
-\let\@elt\relax
-\define@key{newfloat}{planb}[true]{%
-  \def\@tempa{#1}%
-  \def\@tempb{false}%
-  \ifx\@tempa\@tempb
-    \let\newfloat@ifplanb\@gobble
-  \else
-    \def\@tempb{true}%
-    \ifx\@tempa\@tempb
-      \let\newfloat@ifplanb\@iden
-    \else
-      \newfloat@Error{Invalid value `#1' for option `planb'}%
-    \fi
-  \fi}
-\define@key{newfloat}{planb-fileext}{%
-  \newfloat@Info{Setting Plan B file extension to `#1'}
-  \xdef\newfloat@addtocontents@ext{#1}}
-
-\let\@tempc\relax
-\@expandtwoargs\setkeys{newfloat}{planb,\@ptionlist{\@currname.\@currext}}%
-\AtEndOfPackage{\let\@unprocessedoptions\relax}
-\newcommand*\newfloatsetup{\setkeys{newfloat}}
-\newcommand\newfloat@replace@chapter[2]{%
-  \begingroup
-    \let\if@twocolumn\iffalse
-    \let\if@mainmatter\iffalse
-    \let\if@thema\iffalse
-    \def\@tempa[##1]##2{#1}%
-    \ifx\@tempa\@chapter
-      \gdef\@chapter[##1]##2{#2}%
-      \global\let\newfloat@replace@chapter\@gobbletwo
-    \else\ifx\@tempa\Hy@org@chapter
-      \gdef\Hy@org@chapter[##1]##2{#2}%
-      \global\let\newfloat@replace@chapter\@gobbletwo
-    \fi\fi
-  \endgroup}
-\ifcsname @chapter\endcsname \else
-  \let\newfloat@replace@chapter\@gobbletwo
-\fi
-\newfloat@replace@chapter{%
-  \ifnum \c@secnumdepth >\m@ne
-    \refstepcounter{chapter}%
-    \typeout{\@chapapp\space\thechapter.}%
-    \addcontentsline{toc}{chapter}%
-      {\protect\numberline{\thechapter}#1}%
-  \else
-    \addcontentsline{toc}{chapter}{#1}%
-  \fi
-  \chaptermark{#1}%
-  \addtocontents{lof}{\protect\addvspace{10\p@}}%
-  \addtocontents{lot}{\protect\addvspace{10\p@}}%
-  \if@twocolumn
-    \@topnewpage[\@makechapterhead{#2}]%
-  \else
-    \@makechapterhead{#2}%
-    \@afterheading
-  \fi
-}{%
-  \ifnum \c@secnumdepth >\m@ne
-    \refstepcounter{chapter}%
-    \typeout{\@chapapp\space\thechapter.}%
-    \addcontentsline{toc}{chapter}%
-      {\protect\numberline{\thechapter}#1}%
-  \else
-    \addcontentsline{toc}{chapter}{#1}%
-  \fi
-  \chaptermark{#1}%
-  \@addchapterlistsgaps
-  \if@twocolumn
-    \@topnewpage[\@makechapterhead{#2}]%
-  \else
-    \@makechapterhead{#2}%
-    \@afterheading
-  \fi}
-\newfloat@replace@chapter{%
-  \ifnum \c@secnumdepth >\m@ne
-    \if@mainmatter
-      \refstepcounter{chapter}%
-      \typeout{\@chapapp\space\thechapter.}%
-      \addcontentsline{toc}{chapter}%
-        {\protect\numberline{\thechapter}#1}%
-    \else
-      \addcontentsline{toc}{chapter}{#1}%
-    \fi
-  \else
-    \addcontentsline{toc}{chapter}{#1}%
-  \fi
-  \chaptermark{#1}%
-  \addtocontents{lof}{\protect\addvspace{10\p@}}%
-  \addtocontents{lot}{\protect\addvspace{10\p@}}%
-  \if@twocolumn
-    \@topnewpage[\@makechapterhead{#2}]%
-  \else
-    \@makechapterhead{#2}%
-    \@afterheading
-  \fi
-}{%
-  \ifnum \c@secnumdepth >\m@ne
-    \if@mainmatter
-      \refstepcounter{chapter}%
-      \typeout{\@chapapp\space\thechapter.}%
-      \addcontentsline{toc}{chapter}%
-        {\protect\numberline{\thechapter}#1}%
-    \else
-      \addcontentsline{toc}{chapter}{#1}%
-    \fi
-  \else
-    \addcontentsline{toc}{chapter}{#1}%
-  \fi
-  \chaptermark{#1}%
-  \@addchapterlistsgaps
-  \if@twocolumn
-    \@topnewpage[\@makechapterhead{#2}]%
-  \else
-    \@makechapterhead{#2}%
-    \@afterheading
-  \fi}
-\newfloat@replace@chapter{%
-  \refstepcounter{chapter}%
-  \ifnum\c@secnumdepth<\z@ \let\@secnumber\@empty
-  \else \let\@secnumber\thechapter \fi
-  \typeout{\chaptername\space\@secnumber}%
-  \def\@toclevel{0}%
-  \ifx\chaptername\appendixname \@tocwriteb\tocappendix{chapter}{#2}%
-  \else \@tocwriteb\tocchapter{chapter}{#2}\fi
-  \chaptermark{#1}%
-  \addtocontents{lof}{\protect\addvspace{10\p@}}%
-  \addtocontents{lot}{\protect\addvspace{10\p@}}%
-  \@makechapterhead{#2}\@afterheading
-}{%
-  \refstepcounter{chapter}%
-  \ifnum\c@secnumdepth<\z@ \let\@secnumber\@empty
-  \else \let\@secnumber\thechapter \fi
-  \typeout{\chaptername\space\@secnumber}%
-  \def\@toclevel{0}%
-  \ifx\chaptername\appendixname \@tocwriteb\tocappendix{chapter}{#2}%
-  \else \@tocwriteb\tocchapter{chapter}{#2}\fi
-  \chaptermark{#1}%
-  \@addchapterlistsgaps
-  \@makechapterhead{#2}\@afterheading}
-\@ifpackageloaded{tocbasic}{%
-  \let\newfloat@replace@chapter\@gobbletwo}{}
-\ifcsname insertchapterspace\endcsname
-  \renewcommand*\insertchapterspace{\@addchapterlistsgaps}
-  \let\newfloat@replace@chapter\@gobbletwo
-\fi
-\newfloat@replace@chapter{%
-  \ifnum \c@secnumdepth >\m@ne
-    \refstepcounter{chapter}%
-    \typeout{\@chapapp\space\thechapter.}%
-    \addcontentsline{toc}{chapter}%
-      {\protect\numberline{\thechapter}\toc@font0 #1}%
-  \else
-    \addcontentsline{toc}{chapter}{\toc@font0 #1}%
-  \fi
-  \chaptermark{#1}%
-  \addtocontents{lof}{\protect\addvspace{10\p@}}%
-  \addtocontents{lot}{\protect\addvspace{10\p@}}%
-  \if@twocolumn
-    \@topnewpage[\@makechapterhead{#2}]%
-  \else
-    \@makechapterhead{#2}%
-    \@afterheading
-  \fi
-}{%
-  \ifnum \c@secnumdepth >\m@ne
-    \refstepcounter{chapter}%
-    \typeout{\@chapapp\space\thechapter.}%
-    \addcontentsline{toc}{chapter}%
-      {\protect\numberline{\thechapter}\toc@font0 #1}%
-  \else
-    \addcontentsline{toc}{chapter}{\toc@font0 #1}%
-  \fi
-  \chaptermark{#1}%
-  \@addchapterlistsgaps
-  \if@twocolumn
-    \@topnewpage[\@makechapterhead{#2}]%
-  \else
-    \@makechapterhead{#2}%
-    \@afterheading
-  \fi}
-  % boek(3).cls [2004/06/07 v2.1a NTG LaTeX document class]
-\newfloat@replace@chapter{%
-  \ifnum \c@secnumdepth >\m@ne
-    \if@mainmatter
-      \refstepcounter{chapter}%
-      \typeout{\@chapapp\space\thechapter.}%
-      \addcontentsline{toc}{chapter}%
-        {\protect\numberline{\thechapter}\toc@font0 #1}%
-    \else
-      \addcontentsline{toc}{chapter}{\toc@font0 #1}%
-    \fi
-  \else
-    \addcontentsline{toc}{chapter}{\toc@font0 #1}%
-  \fi
-  \chaptermark{#1}%
-  \addtocontents{lof}{\protect\addvspace{10\p@}}%
-  \addtocontents{lot}{\protect\addvspace{10\p@}}%
-  \if@twocolumn
-    \@topnewpage[\@makechapterhead{#2}]%
-  \else
-    \@makechapterhead{#2}%
-    \@afterheading
-  \fi
-}{%
-  \ifnum \c@secnumdepth >\m@ne
-    \if@mainmatter
-      \refstepcounter{chapter}%
-      \typeout{\@chapapp\space\thechapter.}%
-      \addcontentsline{toc}{chapter}%
-        {\protect\numberline{\thechapter}\toc@font0 #1}%
-    \else
-      \addcontentsline{toc}{chapter}{\toc@font0 #1}%
-    \fi
-  \else
-    \addcontentsline{toc}{chapter}{\toc@font0 #1}%
-  \fi
-  \chaptermark{#1}%
-  \@addchapterlistsgaps
-  \if@twocolumn
-    \@topnewpage[\@makechapterhead{#2}]%
-  \else
-    \@makechapterhead{#2}%
-    \@afterheading
-  \fi}
-\newfloat@replace@chapter{%
-  \ifnum \c@secnumdepth >\m@ne
-    \if@mainmatter
-      \refstepcounter{chapter}%
-      \typeout{\chaptername\space\thechapter.}
-      \if@thema
-        \ifx\@shortauthor\@empty
-          \addcontentsline{toc}{chapter}{%
-          \protect\numberline{\thechapter.}#1}%
-        \else
-          \addcontentsline{toc}{chapter}{%
-          \protect\numberline{\thechapter.}%
-          \@shortauthor\hfill\mbox{}\vskip\normallineskip #1}%
-        \fi
-      \else
-        \addcontentsline{toc}{chapter}{%
-        \protect\numberline{\thechapter.}#1}%
-      \fi
-    \else
-      \addcontentsline{toc}{chapter}{#1}
-    \fi
-  \else
-    \addcontentsline{toc}{chapter}{#1}
-  \fi
-  \chaptermark{#1}
-  \addtocontents{lof}{\protect\addvspace{10pt}}
-  \addtocontents{lot}{\protect\addvspace{10pt}}
-  \if@twocolumn
-    \@topnewpage[\@makechapterhead{#2}]
-  \else
-    \@makechapterhead{#2}
-    \@afterheading
-  \fi
-}{%
-  \ifnum \c@secnumdepth >\m@ne
-    \if@mainmatter
-      \refstepcounter{chapter}%
-      \typeout{\chaptername\space\thechapter.}%
-      \if@thema
-        \ifx\@shortauthor\@empty
-          \addcontentsline{toc}{chapter}{%
-          \protect\numberline{\thechapter.}#1}%
-        \else
-          \addcontentsline{toc}{chapter}{%
-          \protect\numberline{\thechapter.}%
-          \@shortauthor\hfill\mbox{}\vskip\normallineskip #1}%
-        \fi
-      \else
-        \addcontentsline{toc}{chapter}{%
-        \protect\numberline{\thechapter.}#1}%
-      \fi
-    \else
-      \addcontentsline{toc}{chapter}{#1}%
-    \fi
-  \else
-    \addcontentsline{toc}{chapter}{#1}%
-  \fi
-  \chaptermark{#1}%
-  \@addchapterlistsgaps
-  \if@twocolumn
-    \@topnewpage[\@makechapterhead{#2}]%
-  \else
-    \@makechapterhead{#2}%
-    \@afterheading
-  \fi}
-\ifx\newfloat@replace@chapter\@gobbletwo \else
-  \newfloat@InfoNoLine{%
-   Unsupported document class, or \noexpand\@chapter\MessageBreak
-   was already redefined by another package}
-  \newfloat@InfoNoLine{\string\@chapter\space=\space\meaning\@chapter}
-  \newfloat@InfoNoLine{\string\Hy@org@chapter\space=\space\meaning\Hy@org@chapter}
-  \newfloat@ifplanb{%
-    \newfloat@InfoNoLine{Trying Plan B..}%
-    \let\newfloat@addtocontents@ORI\addtocontents
-    \long\def\addtocontents#1#2{%
-      \newfloat@addtocontents{#1}{#2}#2\addvspace\newfloat@nil}%
-    \long\def\newfloat@addtocontents#1#2#3\addvspace#4\newfloat@nil{%
-      \def\newfloat@tempa{#4}%
-      \ifx\newfloat@tempa\@empty
-        \newfloat@addtocontents@ORI{#1}{#2}%
-      \else
-        \ifx\newfloat@addtocontents@ext\@undefined
-          \newfloat@Info{Setting Plan B file extension to `#1'...}%
-          \xdef\newfloat@addtocontents@ext{#1}%
-        \fi
-        \edef\newfloat@tempa{#1}%
-        \ifx\newfloat@tempa\newfloat@addtocontents@ext
-          \begingroup
-            \let\addtocontents\newfloat@addtocontents@ORI
-            \@addchapterlistsgaps
-          \endgroup
-        \fi
-      \fi}}
-\fi
-\newcommand\newfloat@ForEachNew[2][newfloat@@list]{%
-  \AtBeginDocument{%
-    \ifcsname#1\endcsname
-      \def\@elt##1{#2}%
-      \newfloat@@list
-      \let\@elt\relax
-    \fi}}%
-\@onlypreamble\newfloat@ForEachNew
-%%    \begin{macrocode}
-\newfloat@ForEachNew[float@exts]{%
-  \@nameuse{@ifchapterlistsgap@#1}{% if switched on
-    \let\float@do=\relax
-    \edef\@tempa{%
-      \noexpand\float@exts{\the\float@exts\float@do{\@nameuse{ext@#1}}}}%
-    \@tempa}}
-\newfloat@ForEachNew[FP@floatBegin]{%
-  \newcounter{FP@#1C}%
-  \newenvironment{FP#1}{\FP@floatBegin{#1}}{\FP@floatEnd}}
-\providecommand*\ext@lstlisting{lol}%
-\newfloat@ForEachNew[@rotfloat]{%
-  \newenvironment{sideways#1}{\@rotfloat{#1}}{\end@rotfloat}%
-  \newenvironment{sideways#1*}{\@rotdblfloat{#1}}{\end@rotdblfloat}}
-\newcommand*\newfloat@For@SC[2]{%
-  \def#1{b}% = \sidecaptionvpos{#2}{b} (v1.6)
-  \newenvironment{SC#2}%
-    {\SC@float[#1]{#2}}{\endSC@float}%
-  \newenvironment{SC#2*}%
-    {\SC@dblfloat[#1]{#2}}{\endSC@dblfloat}}
-\@onlypreamble\newfloat@For@SC
-\newfloat@ForEachNew[SC@float]{%
-  \expandafter\newfloat@For@SC\csname SC@#1@vpos\endcsname{#1}}
-\newfloat@ForEachNew[wrapfloat]{%
-  \newenvironment{wrap#1}{\wrapfloat{#1}}{\endwrapfloat}}
-\endinput
-%%
-%% End of file `newfloat.sty'.
diff --git a/release/latex/python.ist b/release/latex/python.ist
deleted file mode 100644
index 9ffa0f9..0000000
--- a/release/latex/python.ist
+++ /dev/null
@@ -1,11 +0,0 @@
-line_max 100
-headings_flag 1
-heading_prefix "  \\bigletter "
-
-preamble "\\begin{theindex}
-\\def\\bigletter#1{{\\Large\\sffamily#1}\\nopagebreak\\vspace{1mm}}
-
-"
-
-symhead_positive "{Symbols}"
-numhead_positive "{Numbers}"
diff --git a/release/latex/sphinx.sty b/release/latex/sphinx.sty
deleted file mode 100644
index ce17407..0000000
--- a/release/latex/sphinx.sty
+++ /dev/null
@@ -1,641 +0,0 @@
-%
-% sphinx.sty
-%
-% Adapted from the old python.sty, mostly written by Fred Drake,
-% by Georg Brandl.
-%
-
-\NeedsTeXFormat{LaTeX2e}[1995/12/01]
-\ProvidesPackage{sphinx}[2010/01/15 LaTeX package (Sphinx markup)]
-
-\@ifclassloaded{memoir}{}{\RequirePackage{fancyhdr}}
-
-\RequirePackage{textcomp}
-\RequirePackage{fancybox}
-\RequirePackage{titlesec}
-\RequirePackage{tabulary}
-\RequirePackage{makeidx}
-\RequirePackage{framed}
-\RequirePackage{ifthen}
-%The xcolor package draws better fcolorboxes
-%around verbatim code
-\IfFileExists{xcolor.sty}{
-    \RequirePackage{xcolor}
-}{
-    \RequirePackage{color}
-}
-% For highlighted code.
-\RequirePackage{fancyvrb}
-% For table captions.
-\RequirePackage{threeparttable}
-% Handle footnotes in tables.
-\RequirePackage{footnote}
-\makesavenoteenv{tabulary}
-% For floating figures in the text.
-\RequirePackage{wrapfig}
-% Separate paragraphs by space by default.
-\RequirePackage{parskip}
-% For parsed-literal blocks.
-\RequirePackage{alltt}
-% Display "real" single quotes in literal blocks.
-\RequirePackage{upquote}
-
-% Redefine these colors to your liking in the preamble.
-\definecolor{TitleColor}{rgb}{0.126,0.263,0.361}
-\definecolor{InnerLinkColor}{rgb}{0.208,0.374,0.486}
-\definecolor{OuterLinkColor}{rgb}{0.216,0.439,0.388}
-% Redefine these colors to something if you want to have colored
-% background and border for code examples.
-\definecolor{VerbatimColor}{rgb}{1,1,1}
-\definecolor{VerbatimBorderColor}{rgb}{0,0,0}
-
-% Uncomment these two lines to ignore the paper size and make the page 
-% size more like a typical published manual.
-%\renewcommand{\paperheight}{9in}
-%\renewcommand{\paperwidth}{8.5in}   % typical squarish manual
-%\renewcommand{\paperwidth}{7in}     % O'Reilly ``Programmming Python''
-
-% use pdfoutput for pTeX and dvipdfmx
-% when pTeX (\kanjiskip is defined), set pdfoutput to evade \include{pdfcolor}
-\ifx\kanjiskip\undefined\else
-  \newcount\pdfoutput\pdfoutput=0
-\fi
-
-\RequirePackage{graphicx}
-
-% for PDF output, use colors and maximal compression
-\newif\ifsphinxpdfoutput\sphinxpdfoutputfalse
-\ifx\pdfoutput\undefined\else\ifcase\pdfoutput
-  \let\py@NormalColor\relax
-  \let\py@TitleColor\relax
-\else
-  \sphinxpdfoutputtrue
-  \input{pdfcolor}
-  \def\py@NormalColor{\color[rgb]{0.0,0.0,0.0}}
-  \def\py@TitleColor{\color{TitleColor}}
-  \pdfcompresslevel=9
-\fi\fi
-
-% XeLaTeX can do colors, too
-\ifx\XeTeXrevision\undefined\else
-  \def\py@NormalColor{\color[rgb]{0.0,0.0,0.0}}
-  \def\py@TitleColor{\color{TitleColor}}
-\fi
-
-% Increase printable page size (copied from fullpage.sty)
-\topmargin 0pt
-\advance \topmargin by -\headheight
-\advance \topmargin by -\headsep
-
-% attempt to work a little better for A4 users
-\textheight \paperheight
-\advance\textheight by -2in
-
-\oddsidemargin 0pt
-\evensidemargin 0pt
-%\evensidemargin -.25in  % for ``manual size'' documents
-\marginparwidth 0.5in
-
-\textwidth \paperwidth
-\advance\textwidth by -2in
-
-
-% Style parameters and macros used by most documents here
-\raggedbottom
-\sloppy
-\hbadness = 5000                % don't print trivial gripes
-
-\pagestyle{empty}               % start this way
-
-% Use this to set the font family for headers and other decor:
-\newcommand{\py@HeaderFamily}{\sffamily\bfseries}
-
-% Redefine the 'normal' header/footer style when using "fancyhdr" package:
-\@ifundefined{fancyhf}{}{
-  % Use \pagestyle{normal} as the primary pagestyle for text.
-  \fancypagestyle{normal}{
-    \fancyhf{}
-    \fancyfoot[LE,RO]{{\py@HeaderFamily\thepage}}
-    \fancyfoot[LO]{{\py@HeaderFamily\nouppercase{\rightmark}}}
-    \fancyfoot[RE]{{\py@HeaderFamily\nouppercase{\leftmark}}}
-    \fancyhead[LE,RO]{{\py@HeaderFamily \@title, \py@release}}
-    \renewcommand{\headrulewidth}{0.4pt}
-    \renewcommand{\footrulewidth}{0.4pt}
-    % define chaptermark with \@chappos when \@chappos is available for Japanese
-    \ifx\@chappos\undefined\else
-      \def\chaptermark##1{\markboth{\@chapapp\space\thechapter\space\@chappos\space ##1}{}}
-    \fi
-  }
-  % Update the plain style so we get the page number & footer line,
-  % but not a chapter or section title.  This is to keep the first
-  % page of a chapter and the blank page between chapters `clean.'
-  \fancypagestyle{plain}{
-    \fancyhf{}
-    \fancyfoot[LE,RO]{{\py@HeaderFamily\thepage}}
-    \renewcommand{\headrulewidth}{0pt}
-    \renewcommand{\footrulewidth}{0.4pt}
-  }
-}
-
-% Some custom font markup commands.
-%
-\newcommand{\strong}[1]{{\textbf{#1}}}
-\newcommand{\code}[1]{\texttt{#1}}
-\newcommand{\bfcode}[1]{\code{\bfseries#1}}
-\newcommand{\email}[1]{\textsf{#1}}
-\newcommand{\tablecontinued}[1]{\textsf{#1}}
-\newcommand{\titleref}[1]{\emph{#1}}
-\newcommand{\menuselection}[1]{\emph{#1}}
-\newcommand{\accelerator}[1]{\underline{#1}}
-\newcommand{\crossref}[1]{\emph{#1}}
-\newcommand{\termref}[1]{\emph{#1}}
-
-\newcommand*{\sphinxAtStartFootnote}{\mbox{ }}
-
-% Redefine the Verbatim environment to allow border and background colors.
-% The original environment is still used for verbatims within tables.
-\let\OriginalVerbatim=\Verbatim
-\let\endOriginalVerbatim=\endVerbatim
-
-% Play with vspace to be able to keep the indentation.
-\newlength\Sphinx@scratchlength
-\newcommand\Sphinxcolorbox [1]{%
-  \setlength\Sphinx@scratchlength{\linewidth}%
-  \advance\Sphinx@scratchlength -\@totalleftmargin %
-  \fcolorbox{VerbatimBorderColor}{VerbatimColor}{%
-  \begin{minipage}{\Sphinx@scratchlength}%
-    #1
-  \end{minipage}%
-  }%
-}
-% used for split frames for continuation on next and final page
-\def\MidFrameCommand{\Sphinxcolorbox}
-\let\LastFrameCommand\MidFrameCommand
-
-% We customize \FrameCommand (for non split frames) and \FirstFrameCommand
-% (split frames), in order for the framed environment to insert a Title above
-% the frame, which can not be separated by a pagebreak.
-
-% The title is specified from outside as macro \SphinxVerbatimTitle.
-% \SphinxVerbatimTitle is reset to empty after each use of Verbatim environment.
-
-% It is also possible to use directly framed environment (i.e. not indirectly
-% via the Verbatim environment next), then it is \SphinxFrameTitle which specifies
-% the title.
-\newcommand*\SphinxFrameTitle {}
-\newcommand*\SphinxVerbatimTitle {}
-\newcommand*\SphinxSetupCaptionForVerbatim [2]
-{%
-    \needspace{\literalblockneedspace}\vspace{\literalblockcaptiontopvspace}%
-    \def\SphinxVerbatimTitle
-       {\captionof{#1}{\SphinxLiteralBlockLabel #2}\smallskip }%
-}
-% \SphinxLiteralBlockLabel will be set dynamically to hold the label for links
-\newcommand*\SphinxLiteralBlockLabel {}
-
-% \SphinxCustomFBox is copied from framed.sty's \CustomFBox, but
-% #1=title/caption is to be set _above_ the top rule, not _below_
-% #1 must be "vertical material", it may be left empty.
-
-% The amsmath patches \stepcounter to inhibit stepping under
-% \firstchoice@false. We use it because framed.sty typesets multiple
-% times its contents.
-\newif\ifSphinx@myfirstframedpass
-
-\long\def\SphinxCustomFBox#1#2#3#4#5#6#7{%
-  % we set up amsmath (amstext.sty) conditional to inhibit counter stepping
-  % except in first pass
-  \ifSphinx@myfirstframedpass\firstchoice@true
-                  \else\firstchoice@false\fi
-  \leavevmode\begingroup
-  \setbox\@tempboxa\hbox{%
-    \color@begingroup
-      \kern\fboxsep{#7}\kern\fboxsep
-    \color@endgroup}%
-  \hbox{%
-    \lower\dimexpr#4+\fboxsep+\dp\@tempboxa\hbox{%
-      \vbox{%
-        #1% TITLE
-        \hrule\@height#3\relax
-        \hbox{%
-          \vrule\@width#5\relax
-          \vbox{%
-            \vskip\fboxsep
-            \copy\@tempboxa
-            \vskip\fboxsep}%
-          \vrule\@width#6\relax}%
-        #2%
-        \hrule\@height#4\relax}%
-    }%
-  }%
-  \endgroup
-  \global\Sphinx@myfirstframedpassfalse
-}
-
-% for non split frames:
-\def\FrameCommand{%
-   % this is inspired from framed.sty v 0.96 2011/10/22 lines 185--190
-   % \fcolorbox (see \Sphinxcolorbox above) from color.sty uses \fbox.
-   \def\fbox{\SphinxCustomFBox{\SphinxFrameTitle}{}%
-                 \fboxrule\fboxrule\fboxrule\fboxrule}%
-   % \fcolorbox from xcolor.sty may use rather \XC@fbox.
-   \let\XC@fbox\fbox
-   \Sphinxcolorbox
-}
-% for first portion of split frames:
-\let\FirstFrameCommand\FrameCommand
-
-\renewcommand{\Verbatim}[1][1]{%
-  % list starts new par, but we don't want it to be set apart vertically
-  \parskip\z@skip
-  \smallskip
-  % first, let's check if there is a caption
-  \ifx\SphinxVerbatimTitle\empty
-      % there was no caption. Check if nevertheless a label was set.
-      \ifx\SphinxLiteralBlockLabel\empty\else
-      % we require some space to be sure hyperlink target from \phantomsection
-      % will not be separated from upcoming verbatim by a page break
-          \needspace{\literalblockwithoutcaptionneedspace}%
-          \phantomsection\SphinxLiteralBlockLabel
-      \fi
-  \fi
-  % non-empty \SphinxVerbatimTitle has label inside it (in case there is one)
-  \let\SphinxFrameTitle\SphinxVerbatimTitle
-  \global\Sphinx@myfirstframedpasstrue
-  % The list environement is needed to control perfectly the vertical
-  % space.
-  \list{}{%
-  \setlength\parskip{0pt}%
-  \setlength\itemsep{0ex}%
-  \setlength\topsep{0ex}%
-  \setlength\partopsep{0pt}%
-  \setlength\leftmargin{0pt}%
-  }%
-  \item\MakeFramed {\FrameRestore}%
-     \small
-    \OriginalVerbatim[#1]%
-}
-\renewcommand{\endVerbatim}{%
-  \endOriginalVerbatim
-  \endMakeFramed
-  \endlist
-  % LaTeX environments always revert local changes on exit, here e.g. \parskip
-}
-
-
-% \moduleauthor{name}{email}
-\newcommand{\moduleauthor}[2]{}
-
-% \sectionauthor{name}{email}
-\newcommand{\sectionauthor}[2]{}
-
-% Augment the sectioning commands used to get our own font family in place,
-% and reset some internal data items:
-\titleformat{\section}{\Large\py@HeaderFamily}%
-            {\py@TitleColor\thesection}{0.5em}{\py@TitleColor}{\py@NormalColor}
-\titleformat{\subsection}{\large\py@HeaderFamily}%
-            {\py@TitleColor\thesubsection}{0.5em}{\py@TitleColor}{\py@NormalColor}
-\titleformat{\subsubsection}{\py@HeaderFamily}%
-            {\py@TitleColor\thesubsubsection}{0.5em}{\py@TitleColor}{\py@NormalColor}
-\titleformat{\paragraph}{\small\py@HeaderFamily}%
-            {\py@TitleColor}{0em}{\py@TitleColor}{\py@NormalColor}
-
-% {fulllineitems} is the main environment for object descriptions.
-%
-\newcommand{\py@itemnewline}[1]{%
-  \@tempdima\linewidth%
-  \advance\@tempdima \leftmargin\makebox[\@tempdima][l]{#1}%
-}
-
-\newenvironment{fulllineitems}{
-  \begin{list}{}{\labelwidth \leftmargin \labelsep 0pt
-                 \rightmargin 0pt \topsep -\parskip \partopsep \parskip
-                 \itemsep -\parsep
-                 \let\makelabel=\py@itemnewline}
-}{\end{list}}
-
-% \optional is used for ``[, arg]``, i.e. desc_optional nodes.
-\newcommand{\optional}[1]{%
-  {\textnormal{\Large[}}{#1}\hspace{0.5mm}{\textnormal{\Large]}}}
-
-\newlength{\py@argswidth}
-\newcommand{\py@sigparams}[2]{%
-  \parbox[t]{\py@argswidth}{#1\code{)}#2}}
-\newcommand{\pysigline}[1]{\item[#1]\nopagebreak}
-\newcommand{\pysiglinewithargsret}[3]{%
-  \settowidth{\py@argswidth}{#1\code{(}}%
-  \addtolength{\py@argswidth}{-2\py@argswidth}%
-  \addtolength{\py@argswidth}{\linewidth}%
-  \item[#1\code{(}\py@sigparams{#2}{#3}]}
-
-% Production lists
-%
-\newenvironment{productionlist}{
-%  \def\optional##1{{\Large[}##1{\Large]}}
-  \def\production##1##2{\\\code{##1}&::=&\code{##2}}
-  \def\productioncont##1{\\& &\code{##1}}
-  \parindent=2em
-  \indent
-  \setlength{\LTpre}{0pt}
-  \setlength{\LTpost}{0pt}
-  \begin{longtable}[l]{lcl}
-}{%
-  \end{longtable}
-}
-
-% Notices / Admonitions
-%
-\newlength{\py@noticelength}
-
-\newcommand{\py@heavybox}{
-  \setlength{\fboxrule}{1pt}
-  \setlength{\fboxsep}{6pt}
-  \setlength{\py@noticelength}{\linewidth}
-  \addtolength{\py@noticelength}{-2\fboxsep}
-  \addtolength{\py@noticelength}{-2\fboxrule}
-  %\setlength{\shadowsize}{3pt}
-  \noindent\Sbox
-  \minipage{\py@noticelength}
-}
-\newcommand{\py@endheavybox}{
-  \endminipage
-  \endSbox
-  \fbox{\TheSbox}
-}
-
-\newcommand{\py@lightbox}{%
-  \par\allowbreak
-  \noindent\rule{\linewidth}{0.5pt}\par\nobreak
-  {\parskip\z@skip\noindent}%
-  }
-\newcommand{\py@endlightbox}{%
-  \par\nobreak
-  {\parskip\z@skip\noindent\rule[.4\baselineskip]{\linewidth}{0.5pt}}\par
-  }
-
-% Some are quite plain:
-\newcommand{\py@noticestart@note}{\py@lightbox}
-\newcommand{\py@noticeend@note}{\py@endlightbox}
-\newcommand{\py@noticestart@hint}{\py@lightbox}
-\newcommand{\py@noticeend@hint}{\py@endlightbox}
-\newcommand{\py@noticestart@important}{\py@lightbox}
-\newcommand{\py@noticeend@important}{\py@endlightbox}
-\newcommand{\py@noticestart@tip}{\py@lightbox}
-\newcommand{\py@noticeend@tip}{\py@endlightbox}
-
-% Others gets more visible distinction:
-\newcommand{\py@noticestart@warning}{\py@heavybox}
-\newcommand{\py@noticeend@warning}{\py@endheavybox}
-\newcommand{\py@noticestart@caution}{\py@heavybox}
-\newcommand{\py@noticeend@caution}{\py@endheavybox}
-\newcommand{\py@noticestart@attention}{\py@heavybox}
-\newcommand{\py@noticeend@attention}{\py@endheavybox}
-\newcommand{\py@noticestart@danger}{\py@heavybox}
-\newcommand{\py@noticeend@danger}{\py@endheavybox}
-\newcommand{\py@noticestart@error}{\py@heavybox}
-\newcommand{\py@noticeend@error}{\py@endheavybox}
-
-\newenvironment{notice}[2]{
-  \def\py@noticetype{#1}
-  \csname py@noticestart@#1\endcsname
-  \strong{#2}
-}{\csname py@noticeend@\py@noticetype\endcsname}
-
-% Allow the release number to be specified independently of the
-% \date{}.  This allows the date to reflect the document's date and
-% release to specify the release that is documented.
-%
-\newcommand{\py@release}{}
-\newcommand{\version}{}
-\newcommand{\shortversion}{}
-\newcommand{\releaseinfo}{}
-\newcommand{\releasename}{Release}
-\newcommand{\release}[1]{%
-  \renewcommand{\py@release}{\releasename\space\version}%
-  \renewcommand{\version}{#1}}
-\newcommand{\setshortversion}[1]{%
-  \renewcommand{\shortversion}{#1}}
-\newcommand{\setreleaseinfo}[1]{%
-  \renewcommand{\releaseinfo}{#1}}
-
-% Allow specification of the author's address separately from the
-% author's name.  This can be used to format them differently, which
-% is a good thing.
-%
-\newcommand{\py@authoraddress}{}
-\newcommand{\authoraddress}[1]{\renewcommand{\py@authoraddress}{#1}}
-
-% This sets up the fancy chapter headings that make the documents look
-% at least a little better than the usual LaTeX output.
-%
-\@ifundefined{ChTitleVar}{}{
-  \ChNameVar{\raggedleft\normalsize\py@HeaderFamily}
-  \ChNumVar{\raggedleft \bfseries\Large\py@HeaderFamily}
-  \ChTitleVar{\raggedleft \textrm{\Huge\py@HeaderFamily}}
-  % This creates chapter heads without the leading \vspace*{}:
-  \def\@makechapterhead#1{%
-    {\parindent \z@ \raggedright \normalfont
-      \ifnum \c@secnumdepth >\m@ne
-        \DOCH
-      \fi
-      \interlinepenalty\@M
-      \DOTI{#1}
-    }
-  }
-}
-
-% Redefine description environment so that it is usable inside fulllineitems.
-%
-\renewcommand{\description}{%
-  \list{}{\labelwidth\z@%
-          \itemindent-\leftmargin%
-	  \labelsep5pt%
-          \let\makelabel=\descriptionlabel}}
-
-% Definition lists; requested by AMK for HOWTO documents.  Probably useful
-% elsewhere as well, so keep in in the general style support.
-%
-\newenvironment{definitions}{%
-  \begin{description}%
-  \def\term##1{\item[##1]\mbox{}\\*[0mm]}
-}{%
-  \end{description}%
-}
-
-% Tell TeX about pathological hyphenation cases:
-\hyphenation{Base-HTTP-Re-quest-Hand-ler}
-
-
-% The following is stuff copied from docutils' latex writer.
-%
-\newcommand{\optionlistlabel}[1]{\bf #1 \hfill}
-\newenvironment{optionlist}[1]
-{\begin{list}{}
-  {\setlength{\labelwidth}{#1}
-   \setlength{\rightmargin}{1cm}
-   \setlength{\leftmargin}{\rightmargin}
-   \addtolength{\leftmargin}{\labelwidth}
-   \addtolength{\leftmargin}{\labelsep}
-   \renewcommand{\makelabel}{\optionlistlabel}}
-}{\end{list}}
-
-\newlength{\lineblockindentation}
-\setlength{\lineblockindentation}{2.5em}
-\newenvironment{lineblock}[1]
-{\begin{list}{}
-  {\setlength{\partopsep}{\parskip}
-   \addtolength{\partopsep}{\baselineskip}
-   \topsep0pt\itemsep0.15\baselineskip\parsep0pt
-   \leftmargin#1}
- \raggedright}
-{\end{list}}
-
-% Redefine includgraphics for avoiding images larger than the screen size
-% If the size is not specified.
-\let\py@Oldincludegraphics\includegraphics
-
-\newbox\image@box%
-\newdimen\image@width%
-\renewcommand\includegraphics[2][\@empty]{%
-  \ifx#1\@empty%
-    \setbox\image@box=\hbox{\py@Oldincludegraphics{#2}}%
-    \image@width\wd\image@box%
-    \ifdim \image@width>\linewidth%
-      \setbox\image@box=\hbox{\py@Oldincludegraphics[width=\linewidth]{#2}}%
-      \box\image@box%
-    \else%
-      \py@Oldincludegraphics{#2}%
-    \fi%
-  \else%
-    \py@Oldincludegraphics[#1]{#2}%
-  \fi%
-}
-
-% to make pdf with correct encoded bookmarks in Japanese
-% this should precede the hyperref package
-\ifx\kanjiskip\undefined\else
-  \usepackage{atbegshi}
-  \ifx\ucs\undefined
-    \ifnum 42146=\euc"A4A2
-      \AtBeginShipoutFirst{\special{pdf:tounicode EUC-UCS2}}
-    \else
-      \AtBeginShipoutFirst{\special{pdf:tounicode 90ms-RKSJ-UCS2}}
-    \fi
-  \else
-    \AtBeginShipoutFirst{\special{pdf:tounicode UTF8-UCS2}}
-  \fi
-\fi
-
-% Include hyperref last.
-\RequirePackage[colorlinks,breaklinks,
-                linkcolor=InnerLinkColor,filecolor=OuterLinkColor,
-                menucolor=OuterLinkColor,urlcolor=OuterLinkColor,
-                citecolor=InnerLinkColor]{hyperref}
-% Fix anchor placement for figures with captions.
-% (Note: we don't use a package option here; instead, we give an explicit
-% \capstart for figures that actually have a caption.)
-\RequirePackage{hypcap}
-
-% Set up styles of URL: it should be placed after hyperref
-\urlstyle{same}
-
-% From docutils.writers.latex2e
-% inline markup (custom roles)
-% \DUrole{#1}{#2} tries \DUrole#1{#2}
-\providecommand*{\DUrole}[2]{%
-  \ifcsname DUrole#1\endcsname%
-    \csname DUrole#1\endcsname{#2}%
-  \else% backwards compatibility: try \docutilsrole#1{#2}
-    \ifcsname docutilsrole#1\endcsname%
-      \csname docutilsrole#1\endcsname{#2}%
-    \else%
-      #2%
-    \fi%
-  \fi%
-}
-
-\providecommand*{\DUprovidelength}[2]{
-  \ifthenelse{\isundefined{#1}}{\newlength{#1}\setlength{#1}{#2}}{}
-}
-
-\DUprovidelength{\DUlineblockindent}{2.5em}
-\ifthenelse{\isundefined{\DUlineblock}}{
-  \newenvironment{DUlineblock}[1]{%
-    \list{}{\setlength{\partopsep}{\parskip}
-            \addtolength{\partopsep}{\baselineskip}
-            \setlength{\topsep}{0pt}
-            \setlength{\itemsep}{0.15\baselineskip}
-            \setlength{\parsep}{0pt}
-            \setlength{\leftmargin}{#1}}
-    \raggedright
-  }
-  {\endlist}
-}{}
-
-
-% From footmisc.sty: allows footnotes in titles
-\let\FN@sf@@footnote\footnote
-\def\footnote{\ifx\protect\@typeset@protect
-    \expandafter\FN@sf@@footnote
-  \else
-    \expandafter\FN@sf@gobble@opt
-  \fi
-}
-\edef\FN@sf@gobble@opt{\noexpand\protect
-  \expandafter\noexpand\csname FN@sf@gobble@opt \endcsname}
-\expandafter\def\csname FN@sf@gobble@opt \endcsname{%
-  \@ifnextchar[%]
-    \FN@sf@gobble@twobracket
-    \@gobble
-}
-\def\FN@sf@gobble@twobracket[#1]#2{}
-
-% adjust the margins for footer,
-% this works with the jsclasses only (Japanese standard document classes)
-\ifx\@jsc@uplatextrue\undefined\else
-  \hypersetup{setpagesize=false}
-  \setlength\footskip{2\baselineskip}
-  \addtolength{\textheight}{-2\baselineskip}
-\fi
-
-% fix the double index and bibliography on the table of contents
-% in jsclasses (Japanese standard document classes)
-\ifx\@jsc@uplatextrue\undefined\else
-  \renewcommand{\theindex}{
-    \cleardoublepage
-    \phantomsection
-    \py@OldTheindex
-  }
-  \renewcommand{\thebibliography}[1]{
-    \cleardoublepage
-    \phantomsection
-    \py@OldThebibliography{1}
-  }
-\fi
-
-% disable \@chappos in Appendix in pTeX
-\ifx\kanjiskip\undefined\else
-  \let\py@OldAppendix=\appendix
-  \renewcommand{\appendix}{
-    \py@OldAppendix
-    \gdef\@chappos{}
-  }
-\fi
-
-% Define literal-block environment
-\RequirePackage{newfloat}
-\DeclareFloatingEnvironment{literal-block}
-\ifx\thechapter\undefined
-  \SetupFloatingEnvironment{literal-block}{within=section,placement=h}
-\else
-  \SetupFloatingEnvironment{literal-block}{within=chapter,placement=h}
-\fi
-\SetupFloatingEnvironment{literal-block}{name=List}
-% control caption around literal-block
-\RequirePackage{capt-of}
-\RequirePackage{needspace}
-% if the left page space is less than \literalblockneedsapce, insert page-break
-\newcommand{\literalblockneedspace}{5\baselineskip}
-\newcommand{\literalblockwithoutcaptionneedspace}{1.5\baselineskip}
-% margin before the caption of literal-block
-\newcommand{\literalblockcaptiontopvspace}{0.5\baselineskip}
diff --git a/release/latex/sphinxhowto.cls b/release/latex/sphinxhowto.cls
deleted file mode 100644
index 26e63a7..0000000
--- a/release/latex/sphinxhowto.cls
+++ /dev/null
@@ -1,104 +0,0 @@
-%
-% sphinxhowto.cls for Sphinx (http://sphinx-doc.org/)
-%
-
-\NeedsTeXFormat{LaTeX2e}[1995/12/01]
-\ProvidesClass{sphinxhowto}[2009/06/02 Document class (Sphinx HOWTO)]
-
-% 'oneside' option overriding the 'twoside' default
-\newif\if@oneside
-\DeclareOption{oneside}{\@onesidetrue}
-% Pass remaining document options to the parent class.
-\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\sphinxdocclass}}
-\ProcessOptions\relax
-
-% Default to two-side document
-\if@oneside
-% nothing to do (oneside is the default)
-\else
-\PassOptionsToClass{twoside}{\sphinxdocclass}
-\fi
-
-\LoadClass{\sphinxdocclass}
-
-% Set some sane defaults for section numbering depth and TOC depth.  You can
-% reset these counters in your preamble.
-%
-\setcounter{secnumdepth}{2}
-
-% Change the title page to look a bit better, and fit in with the fncychap
-% ``Bjarne'' style a bit better.
-%
-\renewcommand{\maketitle}{
-  \rule{\textwidth}{1pt}
-  \ifsphinxpdfoutput
-    \begingroup
-    % These \defs are required to deal with multi-line authors; it
-    % changes \\ to ', ' (comma-space), making it pass muster for
-    % generating document info in the PDF file.
-    \def\\{, }
-    \def\and{and }
-    \pdfinfo{
-      /Author (\@author)
-      /Title (\@title)
-    }
-    \endgroup
-  \fi
-  \begin{flushright}
-    \sphinxlogo%
-    {\rm\Huge\py@HeaderFamily \@title} \par
-    {\em\large\py@HeaderFamily \py@release\releaseinfo} \par
-    \vspace{25pt}
-    {\Large\py@HeaderFamily
-      \begin{tabular}[t]{c}
-        \@author
-      \end{tabular}} \par
-    \vspace{25pt}
-    \@date \par
-    \py@authoraddress \par
-  \end{flushright}
-  \@thanks
-  \setcounter{footnote}{0}
-  \let\thanks\relax\let\maketitle\relax
-  %\gdef\@thanks{}\gdef\@author{}\gdef\@title{}
-}
-
-\let\py@OldTableofcontents=\tableofcontents
-\renewcommand{\tableofcontents}{
-  \begingroup
-    \parskip = 0mm
-    \py@OldTableofcontents
-  \endgroup
-  \rule{\textwidth}{1pt}
-  \vspace{12pt}
-}  
-
-\@ifundefined{fancyhf}{
-  \pagestyle{plain}}{
-  \pagestyle{normal}}		% start this way; change for
-\pagenumbering{arabic}		% ToC & chapters
-
-\thispagestyle{empty}
-
-% Fix the bibliography environment to add an entry to the Table of
-% Contents.
-% For an article document class this environment is a section,
-% so no page break before it.
-\let\py@OldThebibliography=\thebibliography
-\renewcommand{\thebibliography}[1]{
-  \phantomsection
-  \py@OldThebibliography{1}
-  \addcontentsline{toc}{section}{\bibname}
-}
-
-% Same for the indices.
-% The memoir class already does this, so we don't duplicate it in that case.
-%
-\@ifclassloaded{memoir}{}{
-  \let\py@OldTheindex=\theindex
-  \renewcommand{\theindex}{
-    \phantomsection
-    \py@OldTheindex
-    \addcontentsline{toc}{section}{\indexname}
-  }
-}
diff --git a/release/latex/sphinxmanual.cls b/release/latex/sphinxmanual.cls
deleted file mode 100644
index a6b9b39..0000000
--- a/release/latex/sphinxmanual.cls
+++ /dev/null
@@ -1,148 +0,0 @@
-%
-% sphinxmanual.cls for Sphinx (http://sphinx-doc.org/)
-%
-
-\NeedsTeXFormat{LaTeX2e}[1995/12/01]
-\ProvidesClass{sphinxmanual}[2009/06/02 Document class (Sphinx manual)]
-
-% chapters starting at odd pages (overridden by 'openany' document option)
-\PassOptionsToClass{openright}{\sphinxdocclass}
-
-% 'oneside' option overriding the 'twoside' default
-\newif\if@oneside
-\DeclareOption{oneside}{\@onesidetrue}
-% Pass remaining document options to the parent class.
-\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\sphinxdocclass}}
-\ProcessOptions\relax
-
-% Defaults two-side document
-\if@oneside
-% nothing to do (oneside is the default)
-\else
-\PassOptionsToClass{twoside}{\sphinxdocclass}
-\fi
-
-\LoadClass{\sphinxdocclass}
-
-% Set some sane defaults for section numbering depth and TOC depth.  You can
-% reset these counters in your preamble.
-%
-\setcounter{secnumdepth}{2}
-\setcounter{tocdepth}{1}
-
-% Change the title page to look a bit better, and fit in with the fncychap
-% ``Bjarne'' style a bit better.
-%
-\renewcommand{\maketitle}{%
-  \begin{titlepage}%
-    \let\footnotesize\small
-    \let\footnoterule\relax
-    \rule{\textwidth}{1pt}%
-    \ifsphinxpdfoutput
-      \begingroup
-      % These \defs are required to deal with multi-line authors; it
-      % changes \\ to ', ' (comma-space), making it pass muster for
-      % generating document info in the PDF file.
-      \def\\{, }
-      \def\and{and }
-      \pdfinfo{
-        /Author (\@author)
-        /Title (\@title)
-      }
-      \endgroup
-    \fi
-    \begin{flushright}%
-      \sphinxlogo%
-      {\rm\Huge\py@HeaderFamily \@title \par}%
-      {\em\LARGE\py@HeaderFamily \py@release\releaseinfo \par}
-      \vfill
-      {\LARGE\py@HeaderFamily
-        \begin{tabular}[t]{c}
-          \@author
-        \end{tabular}
-        \par}
-      \vfill\vfill
-      {\large
-       \@date \par
-       \vfill
-       \py@authoraddress \par
-      }%
-    \end{flushright}%\par
-    \@thanks
-  \end{titlepage}%
-  \cleardoublepage%
-  \setcounter{footnote}{0}%
-  \let\thanks\relax\let\maketitle\relax
-  %\gdef\@thanks{}\gdef\@author{}\gdef\@title{}
-}
-
-
-% Catch the end of the {abstract} environment, but here make sure the abstract
-% is followed by a blank page if the 'openright' option is used.
-%
-\let\py@OldEndAbstract=\endabstract
-\renewcommand{\endabstract}{
-  \if@openright
-    \ifodd\value{page}
-      \typeout{Adding blank page after the abstract.}
-      \vfil\pagebreak
-    \fi
-  \fi
-  \py@OldEndAbstract
-}
-
-% This wraps the \tableofcontents macro with all the magic to get the spacing
-% right and have the right number of pages if the 'openright' option has been
-% used.  This eliminates a fair amount of crud in the individual document files.
-%
-\let\py@OldTableofcontents=\tableofcontents
-\renewcommand{\tableofcontents}{%
-  \pagenumbering{roman}%
-  \setcounter{page}{1}%
-  \pagebreak%
-  \pagestyle{plain}%
-  {%
-    \parskip = 0mm%
-    \py@OldTableofcontents%
-    \if@openright%
-      \ifodd\value{page}%
-        \typeout{Adding blank page after the table of contents.}%
-        \pagebreak\hspace{0pt}%
-      \fi%
-    \fi%
-    \cleardoublepage%
-  }%
-  \pagenumbering{arabic}%
-  \@ifundefined{fancyhf}{}{\pagestyle{normal}}%
-}
-\pagenumbering{alph}
-
-% This is needed to get the width of the section # area wide enough in the
-% library reference.  Doing it here keeps it the same for all the manuals.
-%
-\renewcommand*\l@section{\@dottedtocline{1}{1.5em}{2.6em}}
-\renewcommand*\l@subsection{\@dottedtocline{2}{4.1em}{3.5em}}
-
-% Fix the bibliography environment to add an entry to the Table of
-% Contents.
-% For a report document class this environment is a chapter.
-\let\py@OldThebibliography=\thebibliography
-\renewcommand{\thebibliography}[1]{
-  \cleardoublepage
-  \phantomsection
-  \py@OldThebibliography{1}
-  \addcontentsline{toc}{chapter}{\bibname}
-}
-
-% Same for the indices.
-% The memoir class already does this, so we don't duplicate it in that case.
-%
-\@ifclassloaded{memoir}{}{
-  \let\py@OldTheindex=\theindex
-  \renewcommand{\theindex}{
-    \cleardoublepage
-    \phantomsection
-    \py@OldTheindex
-    \addcontentsline{toc}{chapter}{\indexname}
-  }
-}
diff --git a/release/latex/tabulary.sty b/release/latex/tabulary.sty
deleted file mode 100644
index 11fdf74..0000000
--- a/release/latex/tabulary.sty
+++ /dev/null
@@ -1,452 +0,0 @@
-%%
-%% This is file `tabulary.sty',
-%% generated with the docstrip utility.
-%%
-%% The original source files were:
-%%
-%% tabulary.dtx  (with options: `package')
-%% DRAFT VERSION
-%%
-%% File `tabulary.dtx'.
-%% Copyright (C) 1995 1996 2003 2008 David Carlisle
-%% This file may be distributed under the terms of the LPPL.
-%% See 00readme.txt for details.
-%%
-\NeedsTeXFormat{LaTeX2e}
-\ProvidesPackage{tabulary}
-          [2008/12/01 v0.9 tabulary package (DPC)]
-\RequirePackage{array}
-\catcode`\Z=14
-\DeclareOption{debugshow}{\catcode`\Z=9\relax}
-\ProcessOptions
-\def\arraybackslash{\let\\=\@arraycr}
-\def\@finalstrut#1{%
-  \unskip\ifhmode\nobreak\fi\vrule\@width\z@\@height\z@\@depth\dp#1}
-\newcount\TY@count
-\def\tabulary{%
-  \let\TY@final\tabular
-  \let\endTY@final\endtabular
-  \TY@tabular}
-\def\TY@tabular#1{%
-  \edef\TY@{\@currenvir}%
-  {\ifnum0=`}\fi
-  \@ovxx\TY@linewidth
-  \@ovyy\TY@tablewidth
-  \count@\z@
-  \@tempswatrue
-  \@whilesw\if@tempswa\fi{%
-  \advance\count@\@ne
-  \expandafter\ifx\csname TY@F\the\count@\endcsname\relax
-    \@tempswafalse
-  \else
-    \expandafter\let\csname TY@SF\the\count@\expandafter\endcsname
-                     \csname TY@F\the\count@\endcsname
-    \global\expandafter\let\csname TY@F\the\count@\endcsname\relax
-    \expandafter\let\csname TY@S\the\count@\expandafter\endcsname
-                     \csname TY@\the\count@\endcsname
-  \fi}%
-    \global\TY@count\@ne
-    \TY@width\xdef{0pt}%
-    \global\TY@tablewidth\z@
-    \global\TY@linewidth#1\relax
-Z\message{^^J^^JTable^^J%
-Z        Target Width: \the\TY@linewidth^^J%
-Z        \string\tabcolsep: \the\tabcolsep\space
-Z        \string\arrayrulewidth: \the\arrayrulewidth\space
-Z        \string\doublerulesep: \the\doublerulesep^^J%
-Z        \string\tymin: \the\tymin\space
-Z        \string\tymax: \the\tymax^^J}%
-    \let\@classz\TY@classz
-    \let\verb\TX@verb
-    \toks@{}\TY@get@body}
-\let\TY@@mkpream\@mkpream
-\def\TY@mkpream{%
-    \def\@addamp{%
-      \if@firstamp \@firstampfalse \else
-      \global\advance\TY@count\@ne
-      \edef\@preamble{\@preamble &}\fi
-      \TY@width\xdef{0pt}}%
-    \def\@acol{%
-      \TY@subwidth\col@sep
-      \@addtopreamble{\hskip\col@sep}}%
-    \let\@arrayrule\TY@arrayrule
-    \let\@classvi\TY@classvi
-    \def\@classv{\save@decl
-      \expandafter\NC@ecs\@nextchar\extracolsep{}\extracolsep\@@@
-      \sbox\z@{\d@llarbegin\@nextchar\d@llarend}%
-      \TY@subwidth{\wd\z@}%
-      \@addtopreamble{\d@llarbegin\the@toks\the\count@\relax\d@llarend}%
-      \prepnext@tok}%
-  \global\let\@mkpream\TY@@mkpream
-  \TY@@mkpream}
-\def\TY@arrayrule{%
-  \TY@subwidth\arrayrulewidth
-  \@addtopreamble \vline}
-\def\TY@classvi{\ifcase \@lastchclass
-  \@acol \or
-  \TY@subwidth\doublerulesep
-  \@addtopreamble{\hskip \doublerulesep}\or
-  \@acol \or
-  \@classvii
-  \fi}
-\def\TY@tab{%
-  \setbox\z@\hbox\bgroup
-  \let\[$\let\]$%
-  \let\equation$\let\endequation$%
-    \col@sep\tabcolsep
-    \let\d@llarbegin\begingroup\let\d@llarend\endgroup
-    \let\@mkpream\TY@mkpream
-      \def\multicolumn##1##2##3{\multispan##1\relax}%
-    \CT@start\TY@tabarray}
-\def\TY@tabarray{\@ifnextchar[{\TY@array}{\@array[t]}}
-\def\TY@array[#1]{\@array[t]}
-\def\TY@width#1{%
-  \expandafter#1\csname TY@\the\TY@count\endcsname}
-\def\TY@subwidth#1{%
-  \TY@width\dimen@
-  \advance\dimen@-#1\relax
-  \TY@width\xdef{\the\dimen@}%
-  \global\advance\TY@linewidth-#1\relax}
-\def\endtabulary{%
-  \gdef\@halignto{}%
-  \let\TY@footnote\footnote%
-  \def\footnote{}% prevent footnotes from doing anything
-  \expandafter\TY@tab\the\toks@
-  \crcr\omit
-  {\xdef\TY@save@row{}%
-     \loop
-    \advance\TY@count\m@ne
-    \ifnum\TY@count>\z@
-    \xdef\TY@save@row{\TY@save@row&\omit}%
-    \repeat}\TY@save@row
-  \endarray\global\setbox1=\lastbox\setbox0=\vbox{\unvbox1
-    \unskip\global\setbox1=\lastbox}\egroup
-  \dimen@\TY@linewidth
-  \divide\dimen@\TY@count
-  \ifdim\dimen@<\tymin
-    \TY@warn{tymin too large (\the\tymin), resetting to \the\dimen@}%
-    \tymin\dimen@
-  \fi
-  \setbox\tw@=\hbox{\unhbox\@ne
-    \loop
-\@tempdima=\lastskip
-\ifdim\@tempdima>\z@
-Z   \message{ecs=\the\@tempdima^^J}%
-   \global\advance\TY@linewidth-\@tempdima
-\fi
-    \unskip
-    \setbox\tw@=\lastbox
-    \ifhbox\tw@
-Z     \message{Col \the\TY@count: Initial=\the\wd\tw@\space}%
-      \ifdim\wd\tw@>\tymax
-        \wd\tw@\tymax
-Z       \message{> max\space}%
-Z     \else
-Z       \message{ \@spaces\space}%
-      \fi
-  \TY@width\dimen@
-Z \message{\the\dimen@\space}%
-  \advance\dimen@\wd\tw@
-Z \message{Final=\the\dimen@\space}%
-   \TY@width\xdef{\the\dimen@}%
-      \ifdim\dimen@<\tymin
-Z        \message{< tymin}%
-         \global\advance\TY@linewidth-\dimen@
-         \expandafter\xdef\csname TY@F\the\TY@count\endcsname
-                                                        {\the\dimen@}%
-       \else
-      \expandafter\ifx\csname TY@F\the\TY@count\endcsname\z@
-Z        \message{***}%
-         \global\advance\TY@linewidth-\dimen@
-         \expandafter\xdef\csname TY@F\the\TY@count\endcsname
-                                                        {\the\dimen@}%
-        \else
-Z        \message{> tymin}%
-         \global\advance\TY@tablewidth\dimen@
-         \global\expandafter\let\csname TY@F\the\TY@count\endcsname
-                                                               \maxdimen
-       \fi\fi
-       \advance\TY@count\m@ne
-    \repeat}%
-    \TY@checkmin
-    \TY@checkmin
-    \TY@checkmin
-    \TY@checkmin
-    \TY@count\z@
-    \let\TY@box\TY@box@v
-    \let\footnote\TY@footnote % restore footnotes
-  {\expandafter\TY@final\the\toks@\endTY@final}%
-  \count@\z@
-  \@tempswatrue
-  \@whilesw\if@tempswa\fi{%
-  \advance\count@\@ne
-  \expandafter\ifx\csname TY@SF\the\count@\endcsname\relax
-    \@tempswafalse
-  \else
-    \global\expandafter\let\csname TY@F\the\count@\expandafter\endcsname
-                   \csname TY@SF\the\count@\endcsname
-    \global\expandafter\let\csname TY@\the\count@\expandafter\endcsname
-                   \csname TY@S\the\count@\endcsname
-  \fi}%
-  \TY@linewidth\@ovxx
-  \TY@tablewidth\@ovyy
-    \ifnum0=`{\fi}}
-\def\TY@checkmin{%
-  \let\TY@checkmin\relax
-\ifdim\TY@tablewidth>\z@
-  \Gscale@div\TY@ratio\TY@linewidth\TY@tablewidth
- \ifdim\TY@tablewidth <\TY@linewidth
-   \def\TY@ratio{1}%
- \fi
-\else
-  \TY@warn{No suitable columns!}%
-  \def\TY@ratio{1}%
-\fi
-\count@\z@
-Z \message{^^JLine Width: \the\TY@linewidth,
-Z             Natural Width: \the\TY@tablewidth,
-Z             Ratio: \TY@ratio^^J}%
-\@tempdima\z@
-\loop
-\ifnum\count@<\TY@count
-\advance\count@\@ne
-  \ifdim\csname TY@F\the\count@\endcsname>\tymin
-    \dimen@\csname TY@\the\count@\endcsname
-    \dimen@\TY@ratio\dimen@
-    \ifdim\dimen@<\tymin
-Z     \message{Column \the\count@\space ->}%
-      \global\expandafter\let\csname TY@F\the\count@\endcsname\tymin
-      \global\advance\TY@linewidth-\tymin
-      \global\advance\TY@tablewidth-\csname TY@\the\count@\endcsname
-      \let\TY@checkmin\TY@@checkmin
-    \else
-      \expandafter\xdef\csname TY@F\the\count@\endcsname{\the\dimen@}%
-      \advance\@tempdima\csname TY@F\the\count@\endcsname
-    \fi
-  \fi
-Z \dimen@\csname TY@F\the\count@\endcsname\message{\the\dimen@, }%
-\repeat
-Z \message{^^JTotal:\the\@tempdima^^J}%
-}
-\let\TY@@checkmin\TY@checkmin
-\newdimen\TY@linewidth
-\def\tyformat{\everypar{{\nobreak\hskip\z@skip}}}
-\newdimen\tymin
-\tymin=10pt
-\newdimen\tymax
-\tymax=2\textwidth
-\def\@testpach{\@chclass
- \ifnum \@lastchclass=6 \@ne \@chnum \@ne \else
-  \ifnum \@lastchclass=7 5 \else
-   \ifnum \@lastchclass=8 \tw@ \else
-    \ifnum \@lastchclass=9 \thr@@
-   \else \z@
-   \ifnum \@lastchclass = 10 \else
-   \edef\@nextchar{\expandafter\string\@nextchar}%
-   \@chnum
-   \if \@nextchar c\z@ \else
-    \if \@nextchar l\@ne \else
-     \if \@nextchar r\tw@ \else
-   \if \@nextchar C7 \else
-    \if \@nextchar L8 \else
-     \if \@nextchar R9 \else
-     \if \@nextchar J10 \else
-   \z@ \@chclass
-   \if\@nextchar |\@ne \else
-    \if \@nextchar !6 \else
-     \if \@nextchar @7 \else
-      \if \@nextchar <8 \else
-       \if \@nextchar >9 \else
-  10
-  \@chnum
-  \if \@nextchar m\thr@@\else
-   \if \@nextchar p4 \else
-    \if \@nextchar b5 \else
-   \z@ \@chclass \z@ \@preamerr \z@ \fi \fi \fi \fi\fi \fi \fi\fi \fi
-     \fi  \fi  \fi  \fi  \fi  \fi \fi \fi \fi \fi \fi}
-\def\TY@classz{%
-  \@classx
-  \@tempcnta\count@
-  \ifx\TY@box\TY@box@v
-    \global\advance\TY@count\@ne
-  \fi
-  \let\centering c%
-  \let\raggedright\noindent
-  \let\raggedleft\indent
-  \let\arraybackslash\relax
-  \prepnext@tok
-  \ifnum\@chnum<4
-    \global\expandafter\let\csname TY@F\the\TY@count\endcsname\z@
-  \fi
-  \ifnum\@chnum=6
-    \global\expandafter\let\csname TY@F\the\TY@count\endcsname\z@
-  \fi
-  \@addtopreamble{%
-    \ifcase\@chnum
-      \hfil \d@llarbegin\insert@column\d@llarend \hfil \or
-      \kern\z@
-       \d@llarbegin \insert@column \d@llarend \hfil \or
-      \hfil\kern\z@ \d@llarbegin \insert@column \d@llarend \or
-      $\vcenter\@startpbox{\@nextchar}\insert@column \@endpbox $\or
-      \vtop \@startpbox{\@nextchar}\insert@column \@endpbox \or
-      \vbox \@startpbox{\@nextchar}\insert@column \@endpbox \or
-      \d@llarbegin \insert@column \d@llarend \or% dubious "s" case
-      \TY@box\centering\or
-      \TY@box\raggedright\or
-      \TY@box\raggedleft\or
-      \TY@box\relax
-    \fi}\prepnext@tok}
-\def\TY@box#1{%
-  \ifx\centering#1%
-      \hfil \d@llarbegin\insert@column\d@llarend \hfil \else
-  \ifx\raggedright#1%
-        \kern\z@%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-      \d@llarbegin \insert@column \d@llarend \hfil \else
-  \ifx\raggedleft#1%
-      \hfil\kern\z@ \d@llarbegin \insert@column \d@llarend \else
-  \ifx\relax#1%
-       \d@llarbegin \insert@column \d@llarend
-  \fi  \fi  \fi  \fi}
-\def\TY@box@v#1{%
-      \vtop \@startpbox{\csname TY@F\the\TY@count\endcsname}%
-              #1\arraybackslash\tyformat
-                              \insert@column\@endpbox}
-\newdimen\TY@tablewidth
-\def\Gscale@div#1#2#3{%
-  \setlength\dimen@{#3}%
-  \ifdim\dimen@=\z@
-    \PackageError{graphics}{Division by 0}\@eha
-    \dimen@#2%
-  \fi
-  \edef\@tempd{\the\dimen@}%
-  \setlength\dimen@{#2}%
-  \count@65536\relax
-  \ifdim\dimen@<\z@
-    \dimen@-\dimen@
-    \count@-\count@
-  \fi
-  \loop
-    \ifdim\dimen@<8192\p@
-      \dimen@\tw@\dimen@
-      \divide\count@\tw@
-  \repeat
-  \dimen@ii=\@tempd\relax
-  \divide\dimen@ii\count@
-  \divide\dimen@\dimen@ii
-  \edef#1{\strip@pt\dimen@}}
-\long\def\TY@get@body#1\end
-  {\toks@\expandafter{\the\toks@#1}\TY@find@end}
-\def\TY@find@end#1{%
-  \def\@tempa{#1}%
-  \ifx\@tempa\TY@\def\@tempa{\end{#1}}\expandafter\@tempa
-  \else\toks@\expandafter
-    {\the\toks@\end{#1}}\expandafter\TY@get@body\fi}
-\def\TY@warn{%
-  \PackageWarning{tabulary}}
-\catcode`\Z=11
-\AtBeginDocument{
-\@ifpackageloaded{colortbl}{%
-\expandafter\def\expandafter\@mkpream\expandafter#\expandafter1%
-  \expandafter{%
-    \expandafter\let\expandafter\CT@setup\expandafter\relax
-    \expandafter\let\expandafter\CT@color\expandafter\relax
-    \expandafter\let\expandafter\CT@do@color\expandafter\relax
-    \expandafter\let\expandafter\color\expandafter\relax
-    \expandafter\let\expandafter\CT@column@color\expandafter\relax
-    \expandafter\let\expandafter\CT@row@color\expandafter\relax
-    \@mkpream{#1}}
-\let\TY@@mkpream\@mkpream
-\def\TY@classz{%
-  \@classx
-  \@tempcnta\count@
-  \ifx\TY@box\TY@box@v
-    \global\advance\TY@count\@ne
-  \fi
-  \let\centering c%
-  \let\raggedright\noindent
-  \let\raggedleft\indent
-  \let\arraybackslash\relax
-  \prepnext@tok
-\expandafter\CT@extract\the\toks\@tempcnta\columncolor!\@nil
-  \ifnum\@chnum<4
-    \global\expandafter\let\csname TY@F\the\TY@count\endcsname\z@
-  \fi
-  \ifnum\@chnum=6
-    \global\expandafter\let\csname TY@F\the\TY@count\endcsname\z@
-  \fi
-  \@addtopreamble{%
-    \setbox\z@\hbox\bgroup\bgroup
-    \ifcase\@chnum
-      \hskip\stretch{.5}\kern\z@
-      \d@llarbegin\insert@column\d@llarend\hskip\stretch{.5}\or
-      \kern\z@%<<<<<<<<<<<<<<<<<<<<<<<<<<<
-       \d@llarbegin \insert@column \d@llarend \hfill \or
-      \hfill\kern\z@ \d@llarbegin \insert@column \d@llarend \or
-      $\vcenter\@startpbox{\@nextchar}\insert@column \@endpbox $\or
-      \vtop \@startpbox{\@nextchar}\insert@column \@endpbox \or
-      \vbox \@startpbox{\@nextchar}\insert@column \@endpbox \or
-      \d@llarbegin \insert@column \d@llarend \or% dubious s case
-      \TY@box\centering\or
-      \TY@box\raggedright\or
-      \TY@box\raggedleft\or
-      \TY@box\relax
-    \fi
- \egroup\egroup
-\begingroup
-  \CT@setup
-  \CT@column@color
-  \CT@row@color
-  \CT@do@color
-\endgroup
-        \@tempdima\ht\z@
-        \advance\@tempdima\minrowclearance
-        \vrule\@height\@tempdima\@width\z@
-\unhbox\z@
-}\prepnext@tok}%
-    \def\TY@arrayrule{%
-      \TY@subwidth\arrayrulewidth
-      \@addtopreamble{{\CT@arc@\vline}}}%
-    \def\TY@classvi{\ifcase \@lastchclass
-      \@acol \or
-      \TY@subwidth\doublerulesep
-      \ifx\CT@drsc@\relax
-        \@addtopreamble{\hskip\doublerulesep}%
-      \else
-        \@addtopreamble{{\CT@drsc@\vrule\@width\doublerulesep}}%
-      \fi\or
-      \@acol \or
-      \@classvii
-      \fi}%
-}{%
-\let\CT@start\relax
-}
-}
-{\uccode`\*=`\ %
-\uppercase{\gdef\TX@verb{%
-  \leavevmode\null\TX@vwarn
-  {\ifnum0=`}\fi\ttfamily\let\\\ignorespaces
-  \@ifstar{\let~*\TX@vb}{\TX@vb}}}}
-\def\TX@vb#1{\def\@tempa##1#1{\toks@{##1}\edef\@tempa{\the\toks@}%
-    \expandafter\TX@v\meaning\@tempa\\ \\\ifnum0=`{\fi}}\@tempa!}
-\def\TX@v#1!{\afterassignment\TX@vfirst\let\@tempa= }
-\begingroup
-\catcode`\*=\catcode`\#
-\catcode`\#=12
-\gdef\TX@vfirst{%
-  \if\@tempa#%
-    \def\@tempb{\TX@v@#}%
-  \else
-    \let\@tempb\TX@v@
-    \if\@tempa\space~\else\@tempa\fi
-  \fi
-  \@tempb}
-\gdef\TX@v@*1 *2{%
-  \TX@v@hash*1##\relax\if*2\\\else~\expandafter\TX@v@\fi*2}
-\gdef\TX@v@hash*1##*2{*1\ifx*2\relax\else#\expandafter\TX@v@hash\fi*2}
-\endgroup
-\def\TX@vwarn{%
-  \@warning{\noexpand\verb may be unreliable inside tabularx/y}%
-  \global\let\TX@vwarn\@empty}
-\endinput
-%%
-%% End of file `tabulary.sty'.
-- 
2.11.0
