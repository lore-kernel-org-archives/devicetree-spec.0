From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Add Github Action CI workflow
Date: Mon, 14 Jun 2021 11:36:23 -0600
Message-ID: <20210614173623.1125220-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bill Mills <bill.mills-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Travis-ci.org is going away and moving to Travis-ci.com requires some
work. It would probably involve fixing authentication issues yet again.
Instead, let's just move to a GH actions job which is fairly trivial to
setup. This has the side benefit of CI will run on anyone's fork without
further setup.

As part of this, the specification file name gains a 'git-describe'
based version number.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .github/workflows/ci.yml | 60 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 .github/workflows/ci.yml

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
new file mode 100644
index 000000000000..f8fe08d52cb0
--- /dev/null
+++ b/.github/workflows/ci.yml
@@ -0,0 +1,60 @@
+name: Github Action CI
+
+on:
+  push:
+    branches: 
+    - '*'
+    tags:
+    - 'v*'
+  pull_request:
+    branches: 
+      master
+
+jobs:
+  build:
+    runs-on: ubuntu-latest
+
+    steps:
+    - uses: actions/checkout@v2
+      with:
+        fetch-depth: 0
+
+    - name: install
+      run: |
+        sudo apt-get update
+        sudo apt-get install latexmk libalgorithm-diff-perl texlive texlive-latex-extra texlive-humanities graphviz
+        pip3 install --user mako
+        pip3 install --user typing
+        pip3 install --user Sphinx
+        pip3 install --user codespell
+
+    - name: build pdf
+      run: |
+        make latexpdf
+        git fetch --tags --force # Needed to make git-describe work
+        mv build/latex/devicetree-specification.pdf build/latex/devicetree-specification-$(git describe).pdf
+    - name: build html
+      run: make html
+    - name: build singlehtml
+      run: make singlehtml
+
+    - name: upload
+      uses: actions/upload-artifact@v2
+      with:
+        name: artifacts
+        path: |
+          build/latex/devicetree-specification-*.pdf
+
+    - name: deploy
+      uses: peaceiris/actions-gh-pages@v3
+      with:
+        github_token: ${{ secrets.GITHUB_TOKEN }}
+        publish_dir: ./build/singlehtml
+
+    - name: release
+      uses: softprops/action-gh-release@v1
+      if: startsWith(github.ref, 'refs/tags/')
+      with:
+        files: build/latex/devicetree-specification-*.pdf
+      env:
+        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
-- 
2.27.0

