From: Gimcuan Hui <gimcuan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] devicenodes.rst: fixes reg property value mistake
Date: Sun, 26 Nov 2017 07:21:12 +0000
Message-ID: <20171126072112.13678-1-gimcuan@gmail.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=F/KdHaFx3eHHrcsO7tjP7w4O514kS0j534dX1Ip+xVU=;
        b=F26em7OboLpCygxkhn/UWyLpTerh5BluajUsYve/qOKTKfFNctj653ORBfXR71FGu/
         VUjs4fexwrhm89rv6hrERdqcXVBE9v3a7hR3DEm6yubInn3OJ0oECkoIt7rmJ0lEQRKA
         ibrZi/ZpcF1zOlRBcnfxUL8dz7D5PV7N/cuTFtqN8653sGFGfxt11ZfwrujkmspfJBBF
         DCxCJpG2jbqENkuVse5oAH1rBFJ9Vc6rGyZ1Wq5c26A5iNd8CnnxUuV7xpEigvqXTkC5
         gHI5GeRISm031/M3js1qPHWHdeK8HXgjlAXvXB71Rj/EnVp0W56Jaul0mhCYk4vpmS6o
         ZAUQ==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gimcuan Hui <gimcuan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

In cpu1 node of this example, the reg property's value should be 1.

Signed-off-by: Gimcuan Hui <gimcuan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 source/devicenodes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source/devicenodes.rst b/source/devicenodes.rst
index bf82114..37db79b 100644
--- a/source/devicenodes.rst
+++ b/source/devicenodes.rst
@@ -718,7 +718,7 @@ each with their own on-chip L2 and a shared L3.
 
         cpu@1 {
             device_type = "cpu";
-            reg = <0>;
+            reg = <1>;
             cache-unified;
             cache-block-size = <32>;
             cache-size = <0x8000>; // L1, 32KB
-- 
2.11.0
