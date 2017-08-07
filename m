From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] conf: Configure html to have github project and sidebar
Date: Mon,  7 Aug 2017 16:39:15 -0700
Message-ID: <20170807233917.17409-2-stephen.boyd@linaro.org>
References: <20170807233917.17409-1-stephen.boyd@linaro.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LBk3lpOkWh9c2sERsXKUzn/5v5lUougamZPAckAc9LI=;
        b=LxWN/n592T2tCifJvYS0OGTWpMZ8j9QC6NmSd2wET+v1HUgKS7hm3yPzL+P0FBQzvc
         tGs/6IpvYUtVxVvpDTIIJFaqbxGBFVSOtNzO/apSIpJSKiIwtTKU7+JhPWUu05JSz1be
         SLqT/SAk6di7i8oU3BvqwfVLGtY5gykqCRoyc=
In-Reply-To: <20170807233917.17409-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The sidebar helps in navigating the document. Otherwise you have
to go to the home page to find the other sections. Also, add the
github repo information so we can link to it automatically with
the "watch" button.

Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 source/conf.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/source/conf.py b/source/conf.py
index 8f7111709646..4654e49761d2 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -133,7 +133,10 @@ html_theme = 'alabaster'
 # Theme options are theme-specific and customize the look and feel of a theme
 # further.  For a list of options available for each theme, see the
 # documentation.
-#html_theme_options = {}
+html_theme_options = {
+        'github_user': 'devicetree-org',
+        'github_repo': 'devicetree-specification',
+}
 
 # Add any paths that contain custom themes here, relative to this directory.
 html_theme_path = [alabaster.get_path()]
@@ -174,8 +177,14 @@ html_static_path = ['_static']
 #html_use_smartypants = True
 
 # Custom sidebar templates, maps document names to template names.
-#html_sidebars = {}
-
+html_sidebars = {
+    '**': [
+        'about.html',
+        'navigation.html',
+        'relations.html',
+        'searchbox.html',
+    ]
+}
 # Additional templates that should be rendered to pages, maps page names to
 # template names.
 #html_additional_pages = {}
-- 
2.10.0.297.gf6727b0
