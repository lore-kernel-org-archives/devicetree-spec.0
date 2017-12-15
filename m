From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC] Fix changebar pdf build and add to Travis releases
Date: Fri, 15 Dec 2017 14:19:12 +0000
Message-ID: <20171215141912.14414-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=m0PDUVq9u0mQKkoDuWHRxWEQBGbMhBbs0y1fgIoh9/4=;
        b=WT756MBVDPuGeSxFN+P1rrBRkuy61HNR2mL5lTzLXT3YvqgGrNQAdzdw7nSUNvT2hV
         x0QJAdYAgshm14g0GytWw7t7UdecKtGmhbIll9ppSTPUY/sN1wrJ5g8RO/V4BdLsOmWw
         tNb6G3loNSQ5NLW1hmXv7+jdFdnZPI6tx9NyyqHAUVxOSJGmjRcUmV8H+yT04UG1PtI6
         2w0d3cSsykmzKULNGWYkrbli2lPr3vKEaJDBZ13Bx7mp8GRiUfzvKVUe6MNd/jiBop3V
         jISmmXGF4V0TsmNtlYuHKc8c6xhujxhcxrIgBt4KpabfwylrCBP+5azS4KU58zPiVL+g
         evOw==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Fix the changebar build caused by a bad interaction between Sphinx and
latexdiff. latexdiff was not doing the right thing for changes in
chapter headers due to "red" and "blue" getting uppercased to "RED" and
"BLUE", and creating invalid output when adding some verbatim sections.
Fixed by moving to latest latexdiff and adding sphinxVerbatim to the
VERBATIMENV config variable.

Also update the travis-ci control file to also build the changebar
version of the document.

Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---
Hi Rob,

I've not figured out how to test this yet. I'll ping you on IRC about running it through its paces before committing the patch.

Cheers,
g.

 .travis.yml | 19 +++++++++++++++++--
 Makefile    |  2 +-
 README.md   | 12 +++++++++++-
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 4026ecb..a4ab9bd 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -7,13 +7,16 @@ cache:
 env:
   global:
       - SPHINXBUILD=~/.local/bin/sphinx-build
+      - DIFF_COMMIT=v0.1
+
+git:
+  depth: false
 
 addons:
   apt:
     packages:
       - python-pip
       - latexmk
-      - latexdiff
       - texlive
       - texlive-latex-extra
       - texlive-humanities
@@ -25,8 +28,18 @@ install:
   - pip install --user mako
   - pip install --user Sphinx
 
+before_script:
+  - wget https://github.com/ftilmann/latexdiff/releases/download/1.2.1/latexdiff-1.2.1.tar.gz /tmp/latexdiff.tar.gz
+  - tar xvf /tmp/latexdiff.tar.gz
+  - export PATH=$PWD/latexdiff-1.2.1/:$PATH
+
 script:
+  - git checkout $DIFF_COMMIT
+  - make latexpdf
+  - mv build/latex build/latex-previous
+  - git checkout $TRAVIS_COMMIT
   - make latexpdf
+  - make latexdiff
   - make html
   - make singlehtml
 
@@ -36,7 +49,9 @@ deploy:
     api_key:
       secure: sUwxm3Vbv9p8Uvn/BedgpSbPwnqRJvg0k7ezicEWcJlOF3X6dewX8Qk2x9k9PQ2A8v8GPsf+66D4CABBgz2hIUs68GV7r5ngPHbYQDejI5TjOnYyAuOz8AaCt9+K1nfblqyvg2/4TXKRpHJh9MPzq3WlVB4fvYleGDp1P08xLGCUwrrpyVlA3FQlR3rjPl430GRVCsj/6gEtBs6jHe3/9YhJYUkdgnj8VJI0ISqsSia/wxQyyf1QoydaEhwXVwsapFFCGSX60uo72fs/HBZtBpJOPnkw4g6sZw6lory1k6ZpWxtgRANlDvYXpvnTddiViNprGGJdxvRaKn2uyg/vU4wnrxZsg34uCuvYIyudwDeLkmvsB6NEaRTmqozPH35CLjEkOSrrnTVawYbGVsCX3mtMtVM4ocuxkZSD5CeSX4CNixWMqRMcAtvyh2jtu+gGuuxESgnaWCUoKsPWik8zkBAdCvraN5N7SdwNRRgOiJKMqTAQMFeUklXXPVQt5tm4H79Qjz9vylboeYNDHEaj07/AXX9QSXxXSIXLEvF+haPDPMeoamhCuA1SGlKyBWKT7Uq/BpjpnfpPwvZv0tyW3roq6GN8CqfRQYdj6zKOsIJnU69pVgq8cXCTMTSrjLnlis7hp1gp9hS7kJts58J21v2Qw20+YwhBH3s/OCL4gvg=
     file_glob: true
-    file: "build/latex/devicetree-specification.pdf"
+    file:
+      - "build/latex/devicetree-specification.pdf"
+      - "build/latex/devicetree-specification-changebars.pdf"
     skip_cleanup: true
     on:
       tags: true
diff --git a/Makefile b/Makefile
index d8eb85e..a2c41a9 100644
--- a/Makefile
+++ b/Makefile
@@ -144,7 +144,7 @@ latex:
 latexdiff:
 	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
 	@echo "Generating LaTeX changebars..."
-	$(LATEXDIFF) --type=CULINECHBAR $(BUILDDIR)/latex-previous/devicetree-specification.tex $(BUILDDIR)/latex/devicetree-specification.tex > $(BUILDDIR)/latex/devicetree-specification-changebars.tex
+	$(LATEXDIFF) --type=UNDERLINE --config VERBATIMENV=sphinxVerbatim $(BUILDDIR)/latex-previous/devicetree-specification.tex $(BUILDDIR)/latex/devicetree-specification.tex > $(BUILDDIR)/latex/devicetree-specification-changebars.tex
 	@echo "Running LaTeX files through pdflatex..."
 	$(MAKE) -C $(BUILDDIR)/latex all-pdf
 	@echo
diff --git a/README.md b/README.md
index 55717b4..e519a58 100644
--- a/README.md
+++ b/README.md
@@ -19,7 +19,7 @@ Requirements:
 On Debian and Ubuntu:
 
 >```
-># apt-get install python-sphinx latexdiff texlive texlive-latex-extra \
+># apt-get install python-sphinx texlive texlive-latex-extra \
 >                  texlive-humanities texlive-generic-recommended graphviz \
 >                  texlive-generic-extra
 >```
@@ -33,6 +33,16 @@ On Debian and Ubuntu:
 >$ export SPHINXBUILD=~/.local/bin/sphinx-build
 >```
 >
+>You will need latexdiff v1.2.1 or later to create the changebars PDF version
+>of the document.
+>Until distributions catch up with the latest release you will need to install
+>it directly from the github repo.
+>
+>```
+>$ git clone https://github.com/ftilmann/latexdiff
+>$ export PATH=$PWD/latexdiff/:$PATH
+>```
+>
 >Export SPHINXBUILD (see above) if Sphinx was installed with pip --user, then follow Make commands below
 
 On Mac OS X:
-- 
2.11.0
