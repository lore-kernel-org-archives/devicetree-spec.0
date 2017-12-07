From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Extract document version from git tag
Date: Thu,  7 Dec 2017 16:33:06 +0000
Message-ID: <20171207163306.24679-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=u9vpQjyBZyAttufka0OkvCTOw5yAeA+SNRQb/iRX1UI=;
        b=hpzsLDf3WiLppMn9G7yZdVtsQ28HxUvv0PD4CBNFLNEctSsV820cj6XcLphUXJzYGe
         rVBhOk0unH6tEDhj5OHPzDUD7NT9YBjK3O51PSKc0mPpwFmDqUzwWZLwSgh8I7/8ymG6
         P6O0q5VBaj17YdjgB3EdAMuEbLG6R+8Ne8Gec5coi2pl7DU+/OCDN4E5iEhQEGO/TpXw
         zW7uPD+SyEIrXJGu4jikecxTZrf8HB6Tb3JRcq2ydr6XOXaUbFdbHjuPat2KETvpaXbV
         9qQd8NvnrX7SI9dkYQQ6U+zms2t7hbq5d5NH1HukUDGekaOCIbhW4Gbpo52hgS6OAMk+
         YWwg==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

Instead of hard coding the document version in the config file, use
'git describe' to get the version number from the tags and use that.
Just like before, if the version string contains a '-', then it is not
an official release and a watermark will be added to the PDF. This
catches prereleases "-pre*", untagged revisions "-g<hash>", and
uncommitted changes "-dirty".

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---
 source/conf.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/source/conf.py b/source/conf.py
index 54b87ef..6bb639c 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -15,6 +15,7 @@
 import sys
 import os
 import time
+import subprocess
 
 # If extensions (or modules to document with autodoc) are in another directory,
 # add these directories to sys.path here. If the directory is relative to the
@@ -64,7 +65,10 @@ author = u'devicetree.org'
 # built documents.
 #
 # The short X.Y version.
-version = u'0.2-pre2'
+try:
+    version = subprocess.check_output(["git", "describe", "--dirty"]).strip()
+except:
+    version = "unknown-rev"
 # The full version, including alpha/beta/rc tags.
 release = version
 
@@ -79,7 +83,7 @@ language = None
 # non-false value, then it is used:
 #today = ''
 # Else, today_fmt is used as the format for a strftime call.
-today_fmt = '%d %B %Y'
+today_fmt = '%d %b %Y'
 
 # List of patterns, relative to source directory, that match files and
 # directories to ignore when looking for source files.
@@ -253,7 +257,7 @@ latex_elements = {
 
 # Release numbers with a qualifier (ex. '-rc', '-pre') get a watermark.
 if '-' in release:
-    latex_elements['preamble'] = '\\usepackage{draftwatermark}\\SetWatermarkScale{.45}\\SetWatermarkText{DRAFT v%s %s}' % (release, time.strftime(today_fmt))
+    latex_elements['preamble'] = '\\usepackage{draftwatermark}\\SetWatermarkScale{.45}\\SetWatermarkText{%s}' % (release)
 
 # Grouping the document tree into LaTeX files. List of tuples
 # (source start file, target name, title,
-- 
2.11.0
