From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] conf: Use the svg for html logo
Date: Mon,  7 Aug 2017 16:39:17 -0700
Message-ID: <20170807233917.17409-4-stephen.boyd@linaro.org>
References: <20170807233917.17409-1-stephen.boyd@linaro.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=O3aT6FCkVCZlhiSFEINFBMU+eUg7qBDbcbi1cIcCamA=;
        b=LMLTZcZrx4ExJjwsdllk8SxG0oQI0L2VTgdxCDOE6dwIEwnVRvawBCcP6ALjYnPaY+
         QijItG89goMBY1m1C76nCnvb2JjGvnOqo1+0qAtyOLHBrkSGqdypNPa3QmTLyOVeYID0
         5DXSvoeluy8BWLNO5xl98qrzQ+BSGXrmcO5Ro=
In-Reply-To: <20170807233917.17409-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

I couldn't get the pdf output to use the svg, but at least we can
get the html output to.

Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 source/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source/conf.py b/source/conf.py
index 4654e49761d2..1881e29c8414 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -150,7 +150,7 @@ html_theme_path = [alabaster.get_path()]
 
 # The name of an image file (relative to this directory) to place at the top
 # of the sidebar.
-html_logo = "devicetree-logo.png"
+html_logo = "devicetree-logo.svg"
 
 # The name of an image file (relative to this directory) to use as a favicon of
 # the docs.  This file should be a Windows icon file (.ico) being 16x16 or 32x32
-- 
2.10.0.297.gf6727b0
