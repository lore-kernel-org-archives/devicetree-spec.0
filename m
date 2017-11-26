From: Gimcuan Hui <gimcuan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] devicenodes.rst: fixes reg property value mistake
Date: Sun, 26 Nov 2017 07:28:36 +0000
Message-ID: <20171126072836.13935-1-gimcuan@gmail.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=F/KdHaFx3eHHrcsO7tjP7w4O514kS0j534dX1Ip+xVU=;
        b=tEQYsQqOiUajR9d+vnaauhKEUU1TlicqJyylZWOLKeNIb69O5QUKq3SxysOni9PcTt
         9g6KhO9LcA7W8f5Ch2u2oSiopn+ZvcHJgM8t/O8nyUqx11te5PotyBSlHuDqsHDgLPX0
         nOgwOL/0a7sr871Hzj1SeKcqJtOkVVzsUJ92x0DfKpIb1v1tzgUwu61HTWi5exFYn5zV
         oQnsikVzM0M0RMmHKoYEUjhxkUGgsiSXO9emXQzlvY98JL/WjtVzIk+1y9BS7rEmI4wz
         E7ELUNTUYsMyxEPg1gzdulQO2Rr4dknfDRbmwRKFOnUhmOLN885Mmx3yXBc5OEXzDeAh
         SPrg==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
