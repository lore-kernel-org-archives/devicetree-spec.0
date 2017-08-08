From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Add a Travis CI config
Date: Tue,  8 Aug 2017 18:51:09 -0500
Message-ID: <20170808235109.4099-1-robh@kernel.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add an initial Travis CI configuration file. Currently, the output is
not deployed anywhere, so it's just pass/fail for the building of pdf
and html. The CI build is here:

https://travis-ci.org/devicetree-org/devicetree-specification

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .travis.yml | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 .travis.yml

diff --git a/.travis.yml b/.travis.yml
new file mode 100644
index 000000000000..8426aa80db66
--- /dev/null
+++ b/.travis.yml
@@ -0,0 +1,34 @@
+language: c
+
+sudo: false
+dist: trusty
+
+cache:
+  apt: true
+
+env:
+  global:
+      - SPHINXBUILD=~/.local/bin/sphinx-build
+
+addons:
+  apt:
+    packages:
+      - python-pip
+      - latexmk
+      - latexdiff
+      - texlive 
+      - texlive-latex-extra
+      - texlive-humanities
+      - texlive-generic-recommended
+      - graphviz
+      - texlive-generic-extra
+
+install:
+  - pip install --user mako 
+  - pip install --user Sphinx 
+
+script:
+  - make latexpdf
+  - make html
+  - make singlehtml
+
-- 
2.11.0
