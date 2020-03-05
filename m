From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Fix python3 compatibility for sphinx conf.py
Date: Wed,  4 Mar 2020 18:36:16 -0600
Message-ID: <20200305003616.3626-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

In python3, subprocess.check_output() returns a bytearray. We need to
encode this into a string type for 'version' and fix this error:

Configuration error:
There is a programmable error in your configuration file:

Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/sphinx/config.py", line 368, in eval_config_file
    execfile_(filename, namespace)
  File "/usr/lib/python3/dist-packages/sphinx/util/pycompat.py", line 150, in execfile_
    exec_(code, _globals)
  File "/home/rob/proj/git/devicetree-specification/source/conf.py", line 260, in <module>
    if '-' in release:
TypeError: a bytes-like object is required, not 'str'

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source/conf.py b/source/conf.py
index 3f5cc2c27538..c6cddb9afa3a 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -66,7 +66,7 @@ author = u'devicetree.org'
 #
 # The short X.Y version.
 try:
-    version = subprocess.check_output(["git", "describe", "--dirty"]).strip()
+    version = subprocess.check_output(["git", "describe", "--dirty"]).strip().encode()
 except:
     version = "unknown-rev"
 # The full version, including alpha/beta/rc tags.
-- 
2.20.1

