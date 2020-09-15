From: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 3/4] Update Makefile to newer Sphinx 'minimal' style
Date: Tue, 15 Sep 2020 10:03:34 +0100
Message-ID: <20200915090335.9167-4-grant.likely@arm.com>
References: <20200915090335.9167-1-grant.likely@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3GNWR42XZB4pwWglGuPahwgmyL1LHzH/ZpJ3RnBT6o=;
 b=3Njb4ca/6db9A+wiwZ4ZJAN7RVQe8bdqeAIlru4FIDqQrezC3P9k+H/VAlnF2we3Y5IGCSAw0Z0eKhdeOmxuGBVWQSfISEk5jqCcsFWH34m/emQnK5ltYedjAmcYTMsGNkh7JS9VZZQk3ltcz3/BosjhRCXzFeJ/gHWak/anGhU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3GNWR42XZB4pwWglGuPahwgmyL1LHzH/ZpJ3RnBT6o=;
 b=3Njb4ca/6db9A+wiwZ4ZJAN7RVQe8bdqeAIlru4FIDqQrezC3P9k+H/VAlnF2we3Y5IGCSAw0Z0eKhdeOmxuGBVWQSfISEk5jqCcsFWH34m/emQnK5ltYedjAmcYTMsGNkh7JS9VZZQk3ltcz3/BosjhRCXzFeJ/gHWak/anGhU=
In-Reply-To: <20200915090335.9167-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nd-5wv7dgnIgG8@public.gmane.org, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

Drops a ton of lines from the Makefile and makes it easier to track
upstream Sphinx changes. This change is in line with Sphinx 1.8

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---
 Makefile | 232 +++----------------------------------------------------
 1 file changed, 11 insertions(+), 221 deletions(-)

diff --git a/Makefile b/Makefile
index 3b5d3cd..e1430fa 100644
--- a/Makefile
+++ b/Makefile
@@ -1,152 +1,21 @@
-# Makefile for Sphinx documentation
+# Minimal makefile for Sphinx documentation
 #
 
 # You can set these variables from the command line.
 SPHINXOPTS    =
 SPHINXBUILD   = sphinx-build
-PAPER         =
+SOURCEDIR     = source
 BUILDDIR      = build
 LATEXDIFF     = latexdiff
 
-# User-friendly check for sphinx-build
-ifeq ($(shell which $(SPHINXBUILD) >/dev/null 2>&1; echo $$?), 1)
-        $(error The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed, then set the SPHINXBUILD environment variable to point to the full path of the '$(SPHINXBUILD)' executable. Alternatively you can add the directory with the executable to your PATH. If you don\'t have Sphinx installed, grab it from http://sphinx-doc.org/)
-endif
-
-# Internal variables.
-PAPEROPT_a4     = -D latex_paper_size=a4
-PAPEROPT_letter = -D latex_paper_size=letter
-ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) source
-# the i18n builder cannot share the environment and doctrees with the others
-I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) source
-
-.PHONY: help
+# Put it first so that "make" without argument is like "make help".
 help:
-	@echo "Please use \`make <target>' where <target> is one of"
-	@echo "  html       to make standalone HTML files"
-	@echo "  dirhtml    to make HTML files named index.html in directories"
-	@echo "  singlehtml to make a single large HTML file"
-	@echo "  pickle     to make pickle files"
-	@echo "  json       to make JSON files"
-	@echo "  htmlhelp   to make HTML files and a HTML help project"
-	@echo "  qthelp     to make HTML files and a qthelp project"
-	@echo "  applehelp  to make an Apple Help Book"
-	@echo "  devhelp    to make HTML files and a Devhelp project"
-	@echo "  epub       to make an epub"
-	@echo "  epub3      to make an epub3"
-	@echo "  latex      to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
-	@echo "  latexdiff  to make LaTeX files including changebars against previous release"
-	@echo "  latexpdf   to make LaTeX files and run them through pdflatex"
-	@echo "  latexpdfja to make LaTeX files and run them through platex/dvipdfmx"
-	@echo "  text       to make text files"
-	@echo "  man        to make manual pages"
-	@echo "  texinfo    to make Texinfo files"
-	@echo "  info       to make Texinfo files and run them through makeinfo"
-	@echo "  gettext    to make PO message catalogs"
-	@echo "  changes    to make an overview of all changed/added/deprecated items"
-	@echo "  xml        to make Docutils-native XML files"
-	@echo "  pseudoxml  to make pseudoxml-XML files for display purposes"
-	@echo "  linkcheck  to check all external links for integrity"
-	@echo "  doctest    to run all doctests embedded in the documentation (if enabled)"
-	@echo "  coverage   to run coverage check of the documentation (if enabled)"
-
-.PHONY: clean
-clean:
-	rm -rf $(BUILDDIR)/*
-
-.PHONY: check
-check:
-	codespell source/*.rst
+	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
+	@echo "  latexdiff   to make LaTeX files including changebars against previous release"
 
-.PHONY: html
-html:
-	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
-	@echo
-	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."
-
-.PHONY: dirhtml
-dirhtml:
-	$(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) $(BUILDDIR)/dirhtml
-	@echo
-	@echo "Build finished. The HTML pages are in $(BUILDDIR)/dirhtml."
-
-.PHONY: singlehtml
-singlehtml:
-	$(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) $(BUILDDIR)/singlehtml
-	@echo
-	@echo "Build finished. The HTML page is in $(BUILDDIR)/singlehtml."
-
-.PHONY: pickle
-pickle:
-	$(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) $(BUILDDIR)/pickle
-	@echo
-	@echo "Build finished; now you can process the pickle files."
-
-.PHONY: json
-json:
-	$(SPHINXBUILD) -b json $(ALLSPHINXOPTS) $(BUILDDIR)/json
-	@echo
-	@echo "Build finished; now you can process the JSON files."
-
-.PHONY: htmlhelp
-htmlhelp:
-	$(SPHINXBUILD) -b htmlhelp $(ALLSPHINXOPTS) $(BUILDDIR)/htmlhelp
-	@echo
-	@echo "Build finished; now you can run HTML Help Workshop with the" \
-	      ".hhp project file in $(BUILDDIR)/htmlhelp."
-
-.PHONY: qthelp
-qthelp:
-	$(SPHINXBUILD) -b qthelp $(ALLSPHINXOPTS) $(BUILDDIR)/qthelp
-	@echo
-	@echo "Build finished; now you can run "qcollectiongenerator" with the" \
-	      ".qhcp project file in $(BUILDDIR)/qthelp, like this:"
-	@echo "# qcollectiongenerator $(BUILDDIR)/qthelp/DevicetreeSpecification.qhcp"
-	@echo "To view the help file:"
-	@echo "# assistant -collectionFile $(BUILDDIR)/qthelp/DevicetreeSpecification.qhc"
-
-.PHONY: applehelp
-applehelp:
-	$(SPHINXBUILD) -b applehelp $(ALLSPHINXOPTS) $(BUILDDIR)/applehelp
-	@echo
-	@echo "Build finished. The help book is in $(BUILDDIR)/applehelp."
-	@echo "N.B. You won't be able to view it unless you put it in" \
-	      "~/Library/Documentation/Help or install it in your application" \
-	      "bundle."
-
-.PHONY: devhelp
-devhelp:
-	$(SPHINXBUILD) -b devhelp $(ALLSPHINXOPTS) $(BUILDDIR)/devhelp
-	@echo
-	@echo "Build finished."
-	@echo "To view the help file:"
-	@echo "# mkdir -p $$HOME/.local/share/devhelp/DevicetreeSpecification"
-	@echo "# ln -s $(BUILDDIR)/devhelp $$HOME/.local/share/devhelp/DevicetreeSpecification"
-	@echo "# devhelp"
-
-.PHONY: epub
-epub:
-	$(SPHINXBUILD) -b epub $(ALLSPHINXOPTS) $(BUILDDIR)/epub
-	@echo
-	@echo "Build finished. The epub file is in $(BUILDDIR)/epub."
-
-.PHONY: epub3
-epub3:
-	$(SPHINXBUILD) -b epub3 $(ALLSPHINXOPTS) $(BUILDDIR)/epub3
-	@echo
-	@echo "Build finished. The epub3 file is in $(BUILDDIR)/epub3."
+.PHONY: help latexdiff Makefile
 
-.PHONY: latex
-latex:
-	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
-	@echo
-	@echo "Build finished; the LaTeX files are in $(BUILDDIR)/latex."
-	@echo "Run \`make' in that directory to run these through (pdf)latex" \
-	      "(use \`make latexpdf' here to do that automatically)."
-
-.PHONY: latexdiff
-latexdiff:
-	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
+latexdiff: latex
 	@echo "Generating LaTeX changebars..."
 	$(LATEXDIFF) --type=UNDERLINE --config VERBATIMENV=sphinxVerbatim $(BUILDDIR)/latex-previous/devicetree-specification.tex $(BUILDDIR)/latex/devicetree-specification.tex > $(BUILDDIR)/latex/devicetree-specification-changebars.tex
 	@echo "Running LaTeX files through pdflatex..."
@@ -154,86 +23,7 @@ latexdiff:
 	@echo
 	@echo "latexdiff finished; the PDF files are in $(BUILDDIR)/latex."
 
-.PHONY: latexpdf
-latexpdf:
-	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
-	@echo "Running LaTeX files through pdflatex..."
-	$(MAKE) -C $(BUILDDIR)/latex all-pdf
-	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."
-
-.PHONY: latexpdfja
-latexpdfja:
-	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
-	@echo "Running LaTeX files through platex and dvipdfmx..."
-	$(MAKE) -C $(BUILDDIR)/latex all-pdf-ja
-	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."
-
-.PHONY: text
-text:
-	$(SPHINXBUILD) -b text $(ALLSPHINXOPTS) $(BUILDDIR)/text
-	@echo
-	@echo "Build finished. The text files are in $(BUILDDIR)/text."
-
-.PHONY: man
-man:
-	$(SPHINXBUILD) -b man $(ALLSPHINXOPTS) $(BUILDDIR)/man
-	@echo
-	@echo "Build finished. The manual pages are in $(BUILDDIR)/man."
-
-.PHONY: texinfo
-texinfo:
-	$(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) $(BUILDDIR)/texinfo
-	@echo
-	@echo "Build finished. The Texinfo files are in $(BUILDDIR)/texinfo."
-	@echo "Run \`make' in that directory to run these through makeinfo" \
-	      "(use \`make info' here to do that automatically)."
-
-.PHONY: info
-info:
-	$(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) $(BUILDDIR)/texinfo
-	@echo "Running Texinfo files through makeinfo..."
-	make -C $(BUILDDIR)/texinfo info
-	@echo "makeinfo finished; the Info files are in $(BUILDDIR)/texinfo."
-
-.PHONY: gettext
-gettext:
-	$(SPHINXBUILD) -b gettext $(I18NSPHINXOPTS) $(BUILDDIR)/locale
-	@echo
-	@echo "Build finished. The message catalogs are in $(BUILDDIR)/locale."
-
-.PHONY: changes
-changes:
-	$(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) $(BUILDDIR)/changes
-	@echo
-	@echo "The overview file is in $(BUILDDIR)/changes."
-
-.PHONY: linkcheck
-linkcheck:
-	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck
-	@echo
-	@echo "Link check complete; look for any errors in the above output " \
-	      "or in $(BUILDDIR)/linkcheck/output.txt."
-
-.PHONY: doctest
-doctest:
-	$(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) $(BUILDDIR)/doctest
-	@echo "Testing of doctests in the sources finished, look at the " \
-	      "results in $(BUILDDIR)/doctest/output.txt."
-
-.PHONY: coverage
-coverage:
-	$(SPHINXBUILD) -b coverage $(ALLSPHINXOPTS) $(BUILDDIR)/coverage
-	@echo "Testing of coverage in the sources finished, look at the " \
-	      "results in $(BUILDDIR)/coverage/python.txt."
-
-.PHONY: xml
-xml:
-	$(SPHINXBUILD) -b xml $(ALLSPHINXOPTS) $(BUILDDIR)/xml
-	@echo
-	@echo "Build finished. The XML files are in $(BUILDDIR)/xml."
-
-.PHONY: pseudoxml
-pseudoxml:
-	$(SPHINXBUILD) -b pseudoxml $(ALLSPHINXOPTS) $(BUILDDIR)/pseudoxml
-	@echo
-	@echo "Build finished. The pseudo-XML files are in $(BUILDDIR)/pseudoxml."
+# Catch-all target: route all unknown targets to Sphinx using the new
+# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
+%: Makefile
+	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
-- 
2.20.1

