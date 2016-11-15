From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] README: add ubuntu package texlive-generic-extra
Date: Tue, 15 Nov 2016 17:58:06 -0600
Message-ID: <20161115235806.31766-1-robh@kernel.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

With Ubuntu 16.10, make latexpdf fails with the error:

! LaTeX Error: File `iftex.sty' not found.

This is fixed by installing texlive-generic-extra. Add this to the setup
instructions.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 README.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 83a51882290c..cd04bceb5d49 100644
--- a/README.md
+++ b/README.md
@@ -20,7 +20,8 @@ On Ubuntu:
 
 >```
 ># apt-get install python-sphinx latexdiff texlive texlive-latex-extra \
->                  texlive-humanities texlive-generic-recommended graphviz
+>                  texlive-humanities texlive-generic-recommended graphviz \
+>                  texlive-generic-extra
 >```
 >
 >If the version of python-sphinx installed is too old, then an additional
-- 
2.10.1
