From: Kanta Vekaria <kanta.vekaria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Add build instructions for Mac OS X
Date: Mon, 23 May 2016 12:11:05 +0100
Message-ID: <1464001865-12888-1-git-send-email-kanta.vekaria@linaro.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=k/ve30oasV+u+q4HF3qjZ+/k3jcTNIK7P7gqN9N1zuI=;
        b=fvCoZ7QhDZxwRnI1qDMk/My5kFeQrFbMNvRCqGyedK7wwClsHrHvx7uyLfcD8X52pB
         FwEunDQdQqbqpiunhcALaVg1tyckpr70aZL/3sdnGyGv4veFnizliR4qFGnXi2QgB2AK
         ej6Nph/O0a2vR7acHhfVjoJDLaS11uEoFhGP0=
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Charles.Garcia-Tobin-5wv7dgnIgG8@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, kanta.vekaria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

- Provides build instructions for Mac users
  who either use macports or brew
- Also provides commands to install Sphinx
- Update formatting to accomodate the above
  and tidy layout
- Fixed spelling to python-sphinx

Signed-off-by: Kanta Vekaria <kanta.vekaria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 README.md | 68 +++++++++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 21 deletions(-)

diff --git a/README.md b/README.md
index 60415c0..882abf9 100644
--- a/README.md
+++ b/README.md
@@ -18,27 +18,53 @@ Requirements:
 
 On Ubuntu:
 
-```
-# apt-get install python-sphinx latexdiff texlive texlive-latex-extra \
-                  texlive-humanities texlive-generic-recommended graphviz
-```
-
-If the version of python-spinx installed is too old, then an additional
-new version can be installed with the Python package installer:
-
-```
-$ apt-get install python-pip
-$ pip install --user --upgrade Sphinx
-$ export SPHINXBUILD=~/.local/bin/sphinx-build
-```
-
-Export SPHINXBUILD (see above) if Sphinx was installed with pip --user, then:
-
-```
-$ make latexpdf # For generating pdf
-$ make html # For generating a hierarchy of html pages
-$ make singlehtml # For generating a single html page
-```
+>```
+># apt-get install python-sphinx latexdiff texlive texlive-latex-extra \
+>                  texlive-humanities texlive-generic-recommended graphviz
+>```
+>
+>If the version of python-sphinx installed is too old, then an additional
+>new version can be installed with the Python package installer:
+>
+>```
+>$ apt-get install python-pip
+>$ pip install --user --upgrade Sphinx
+>$ export SPHINXBUILD=~/.local/bin/sphinx-build
+>```
+>
+>Export SPHINXBUILD (see above) if Sphinx was installed with pip --user, then follow Make commands below
+
+On Mac OS X:
+
+> Install [MacTeX](http://tug.org/mactex/)
+>
+> Install pip if you don't have it:
+>```
+>$ sudo easy_install pip
+>```
+>Install Sphinx
+>```
+>pip install --user --upgrade Sphinx
+>Or
+>sudo pip install --upgrade Sphinx
+>```
+>
+>If your are using [brew](http://brew.sh) then you can install graphviz like this:
+>```
+brew install graphviz
+>```
+>If you are using [macports](https://www.macports.org/) then you can install graphviz like this:
+>```
+>$ sudo port install graphviz
+>```
+
+Make commands:
+
+>```
+>$ make latexpdf # For generating pdf
+>$ make html # For generating a hierarchy of html pages
+>$ make singlehtml # For generating a single html page
+>```
 
 Output goes in ./build subdirectory.
 
-- 
2.7.4 (Apple Git-66)
