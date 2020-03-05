From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Add 'dma-coherent' property as a standard property
Date: Wed,  4 Mar 2020 18:36:31 -0600
Message-ID: <20200305003631.4121-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The 'dma-coherent' property was added for architectures which by default
have non-coherent I/O (e.g. Arm) as a way to specify certain devices are
coherent. It's been in use since 2012.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/devicetree-basics.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index 8292a312ba5a..90d49a1835c7 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -804,6 +804,19 @@ Description:
      from the *#size-cells* of this node (the node in which the dma-ranges
      property appears).
 
+dma-coherent
+~~~~~~~~~~~~
+
+Property name: ``dma-coherent``
+
+Value type: ``<empty>``
+
+Description:
+   For architectures which are by default non-coherent for I/O, the
+   *dma-coherent* property is used to indicate a device is capable of
+   coherent DMA operations. Some architectures have coherent DMA by default
+   and this property is not applicable.
+
 name (deprecated)
 ~~~~~~~~~~~~~~~~~
 
-- 
2.20.1

