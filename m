From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Add target to generate changebar pdfs
Date: Fri,  6 May 2016 15:36:08 +0100
Message-ID: <1462545368-21103-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=rj7CwrtlCOG6By7rWQYRfyi3ENPurFSjlsyatc34fps=;
        b=iOXrGm97WQrmSWZI7mGV1ClR3qJ6M0haqUsNENU26TCWK2VMQYtKrzfIkqta8GW11P
         nSaMf7qboQasawTZpQ6kxPzLHY+0aa5AbhnnzuP/0tMkEGB3ILq6sOUw2fKL4LVFX30Z
         52GceqWY7d1j+O0BTnwYiRq0/Zzgzx5A9tREgsW+XjS54UXMb5R6GU6YaYhrj4FqqaFb
         EAJaj30rZ9Q+/04Jz5kNiy7FBRGO2Dq0sLT/PmGYkTSasukt305O+d3jdEIdczhCvFM0
         Xo0UNmK5rPcAupCsFn7ho+m1lI3k+u6qrGhgTrcXblk8OoHWttOueZ/8jEIp2LvN+AGh
         oh+w==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Add the "latexdiff" make target to generate a diff between the current
build and the previous release of the document. Type "make latexdiff" to
use this new target.

This patch is inelegant since it hard codes the file name, but it works.
It can be cleaned up to be more generic, but that isn't immediately
necessary.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Makefile  | 13 +++++++++++++
 README.md |  5 ++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6c1247b3d0f4..8e3bd9f7c733 100644
--- a/Makefile
+++ b/Makefile
@@ -5,7 +5,9 @@
 SPHINXOPTS    =
 SPHINXBUILD   = sphinx-build
 PAPER         =
+RELEASEDIR    = release
 BUILDDIR      = build
+LATEXDIFF     = latexdiff
 
 # User-friendly check for sphinx-build
 ifeq ($(shell which $(SPHINXBUILD) >/dev/null 2>&1; echo $$?), 1)
@@ -34,6 +36,7 @@ help:
 	@echo "  epub       to make an epub"
 	@echo "  epub3      to make an epub3"
 	@echo "  latex      to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
+	@echo "  latexdiff  to make LaTeX files including changebars against previous release"
 	@echo "  latexpdf   to make LaTeX files and run them through pdflatex"
 	@echo "  latexpdfja to make LaTeX files and run them through platex/dvipdfmx"
 	@echo "  text       to make text files"
@@ -138,6 +141,16 @@ latex:
 	@echo "Run \`make' in that directory to run these through (pdf)latex" \
 	      "(use \`make latexpdf' here to do that automatically)."
 
+.PHONY: latexdiff
+latexdiff:
+	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
+	@echo "Generating LaTeX changebars..."
+	$(LATEXDIFF) --type=CULINECHBAR $(RELEASEDIR)/latex/devicetree-specification.tex $(BUILDDIR)/latex/devicetree-specification.tex > $(BUILDDIR)/latex/devicetree-specification-changebars.tex
+	@echo "Running LaTeX files through pdflatex..."
+	$(MAKE) -C $(BUILDDIR)/latex all-pdf
+	@echo
+	@echo "latexdiff finished; the PDF files are in $(BUILDDIR)/latex."
+
 .PHONY: latexpdf
 latexpdf:
 	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
diff --git a/README.md b/README.md
index 9f56146a1d2f..60415c07dc97 100644
--- a/README.md
+++ b/README.md
@@ -18,7 +18,10 @@ Requirements:
 
 On Ubuntu:
 
-`# apt-get install python-sphinx texlive texlive-latex-extra texlive-humanities graphviz`
+```
+# apt-get install python-sphinx latexdiff texlive texlive-latex-extra \
+                  texlive-humanities texlive-generic-recommended graphviz
+```
 
 If the version of python-spinx installed is too old, then an additional
 new version can be installed with the Python package installer:
-- 
2.5.0
