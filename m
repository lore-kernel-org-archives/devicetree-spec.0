From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Add 'serial-number' as a root node property
Date: Wed,  4 Mar 2020 18:36:23 -0600
Message-ID: <20200305003623.3828-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

'serial-number' is a root node property originating from OpenFirmware and
has been documented for a long time in Linux kernel's boot-without-of.txt.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/devicenodes.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/source/devicenodes.rst b/source/devicenodes.rst
index 8825ad9add2d..519aa3776884 100644
--- a/source/devicenodes.rst
+++ b/source/devicenodes.rst
@@ -48,6 +48,8 @@ are descendants. The full path to the root node is ``/``.
                                                For example:
 
                                                ``compatible = "fsl,mpc8572ds"``
+   ``serial-number``   O     ``<string>``      Specifies a string representing the device's
+                                               serial number.
    Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
    ===========================================================================================
 
-- 
2.20.1

