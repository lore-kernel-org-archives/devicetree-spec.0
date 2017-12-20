From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Fix incorrect revert to uart example.
Date: Wed, 20 Dec 2017 16:45:08 +0000
Message-ID: <20171220164508.26486-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=0S55fpSDgYqlw4hDd4koarGeaLgSFXjO86pRzMokg+A=;
        b=xWYSxF3zn7nD/PXcqkn432nEKOzEltY7c2vfgkWkO89MCXKKWeYnB7ChkvkxoorCng
         CLZcroKrTBTVDopnhviD2GSF1JtVMZoNIYZYcFD8qEJ3VSSKPIL7Em8Go+iREO+Wo89J
         gLArZwF5Tk72CNnx4FTfGY2qg5dzw2huYB/mOP+AeWe0fDTScALaD166n5xf6mobHAs1
         /zHNYfAdsXWL9Lt+fDcYIMJFzwa48xcApjjh3GF7/8Zbfr+kwQML+AzteJ5nZY21o4rV
         B21Bv6jR5y739X8qmCMbHtBA7LtQ6YNkL4/zYX5BYLysPkY7Xrqfq1QD8xiX2jlZCfBP
         +8tg==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Commit 727c7fa9, "Revert change to fsl,mpc8641 example" flubbed the
revert by omitting the -uart suffix. Add it back in.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/devicetree-basics.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index 1900cc8..b18c2d8 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -469,10 +469,10 @@ Description:
 
 Example:
 
-   ``compatible = "fsl,mpc8641", "ns16550";``
+   ``compatible = "fsl,mpc8641-uart", "ns16550";``
 
    In this example, an operating system would first try to locate a device
-   driver that supported fsl,mpc8641. If a driver was not found, it
+   driver that supported fsl,mpc8641-uart. If a driver was not found, it
    would then try to locate a driver that supported the more general
    ns16550 device type.
 
-- 
2.11.0
