From: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/4] fix python3 compatibility
Date: Tue, 15 Sep 2020 10:03:33 +0100
Message-ID: <20200915090335.9167-3-grant.likely@arm.com>
References: <20200915090335.9167-1-grant.likely@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ancZsqXWBpGKnAn3t+Y8Il2HzPG4lJndZCK2FJFX1zw=;
 b=a4Z9iluF11CIYAm0jSLCkbVkLGHfIDz/gMkf6enHRFA7F5VJLgPQCghuxRiYxGOPmnzco0yIeNJoZXr+AtGlKALw6lnev8SIjx84WS0VuHg3sBLN27pb6STYGwFL6zXMpjE7G7dsPciI0gO+oV4oVPW8uXh1tqrSAqmOh0AUeXg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ancZsqXWBpGKnAn3t+Y8Il2HzPG4lJndZCK2FJFX1zw=;
 b=a4Z9iluF11CIYAm0jSLCkbVkLGHfIDz/gMkf6enHRFA7F5VJLgPQCghuxRiYxGOPmnzco0yIeNJoZXr+AtGlKALw6lnev8SIjx84WS0VuHg3sBLN27pb6STYGwFL6zXMpjE7G7dsPciI0gO+oV4oVPW8uXh1tqrSAqmOh0AUeXg=
In-Reply-To: <20200915090335.9167-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nd-5wv7dgnIgG8@public.gmane.org, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

Fix query of git commit tag to work with python3. The existing code
falls over when using Sphinx on Python 3 due to the string datatype
changes. Fix the code to be more robust.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---
 source/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source/conf.py b/source/conf.py
index c6cddb9..c84edc3 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -66,7 +66,7 @@ author = u'devicetree.org'
 #
 # The short X.Y version.
 try:
-    version = subprocess.check_output(["git", "describe", "--dirty"]).strip().encode()
+    version = str(subprocess.check_output(["git", "describe", "--dirty"]), 'utf-8').strip()
 except:
     version = "unknown-rev"
 # The full version, including alpha/beta/rc tags.
-- 
2.20.1

