From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Force Travis-CI to use sphinx 1.5.6
Date: Thu,  7 Dec 2017 13:39:42 +0000
Message-ID: <20171207133942.5810-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=7pF82m5WBd9L/HtaG0ua+xE8XYW54VIsRSd3G20+Nmc=;
        b=KeiGoa8x1Z3jnRPGcB/IEvdLZ+GJpdRxkEZyAdFLtQ/SXpVhB/ga0tBASmeans9LPq
         DGk5hdEnJ4+jeYf8zw/103Yu+HPH98wbb+wQyjJscy3m9I4xmZegT28CT6zYMsoR+bZt
         pIacoQ6b2vZdWIZuBw5VQCLOFDuV85Hbn/cYnDlzo7EYZSxGS5d61ZiLcS08uUZ7wHvq
         zgAup2bOdAKnD8ehoXDxLpPJZvc2e1L8Sz5ovUtU2p30GL36xoxnjtAOy2SjmH/+J2bZ
         Mmj5PCl7agMklpsm5oSpf0RlNF/EqOMhItx5hnm6cReHdkymJqomfQKZdGbtOqVzh8tC
         J1uQ==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Sphinx versions 1.6.1 and later have switched to using the mklatex
script which seems to interact badly with the graphviz output and the
graphics end up being too wide. Until a fix can be found, force Travis
CI to use the older release of Sphinx.

Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---

Rob, can you try this out and see if it solves the image size problem on Travis CI?

Thanks,
g.

 .travis.yml |  2 +-
 README.md   | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 3be8381..e9538d4 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -23,7 +23,7 @@ addons:
 
 install:
   - pip install --user mako
-  - pip install --user Sphinx
+  - pip install --user Sphinx==1.5.6
 
 script:
   - make latexpdf
diff --git a/README.md b/README.md
index 55717b4..6fcb16f 100644
--- a/README.md
+++ b/README.md
@@ -12,10 +12,14 @@ This [repository](https://github.com/devicetree-org/devicetree-specification) ho
 
 Requirements:
 * Sphinx: http://sphinx-doc.org/contents.html
- * version 1.2.3 or later
+ * version 1.2.3 or later, but no later than version 1.5.6
 * LaTeX (and pdflatex, and various LaTeX packages)
 * Graphviz (in particular, "dot"): http://www.graphviz.org/
 
+There is a problem with image layout on Sphinx version 1.6.1 and later that
+causes images to be too wide.
+The problem is being investigated, but in the mean time use the older release.
+
 On Debian and Ubuntu:
 
 >```
@@ -29,7 +33,7 @@ On Debian and Ubuntu:
 >
 >```
 >$ apt-get install python-pip
->$ pip install --user --upgrade Sphinx
+>$ pip install --user --upgrade Sphinx==1.5.6
 >$ export SPHINXBUILD=~/.local/bin/sphinx-build
 >```
 >
@@ -45,9 +49,9 @@ On Mac OS X:
 >```
 >Install Sphinx
 >```
->pip install --user --upgrade Sphinx
+>pip install --user --upgrade Sphinx==1.5.6
 >Or
->sudo pip install --upgrade Sphinx
+>sudo pip install --upgrade Sphinx==1.5.6
 >```
 >
 >If you are using [brew](http://brew.sh) then you can install graphviz like this:
-- 
2.11.0
