From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Add 'hotpluggable' property for /memory nodes
Date: Wed,  4 Mar 2020 18:36:27 -0600
Message-ID: <20200305003627.3994-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The 'hotpluggable' property has been documented and supported in the Linux
kernel since 2016. Add the property to the spec so we can remove the kernel
specific documentation.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/devicenodes.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/source/devicenodes.rst b/source/devicenodes.rst
index 519aa3776884..3aa4650f6a59 100644
--- a/source/devicenodes.rst
+++ b/source/devicenodes.rst
@@ -151,6 +151,9 @@ If the VLE storage attribute is supported, with VLE=0.
                                                            address, size). The effective and physical
                                                            address shall each be 64-bit (``<u64>`` value),
                                                            and the size shall be 32-bits (``<u32>`` value).
+   ``hotpluggable``        O      ``<empty>``              Specifies an explicit hint to the operating
+                                                           system that this memory may potentially be
+                                                           removed later.
    Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
    =======================================================================================================
 
@@ -738,4 +741,3 @@ each with their own on-chip L2 and a shared L3.
             };
         };
     };
-
-- 
2.20.1

