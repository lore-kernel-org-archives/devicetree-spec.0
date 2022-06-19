From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] Add 'dma-noncoherent' property as a standard property
Date: Sun, 19 Jun 2022 22:37:19 +0200
Message-ID: <20220619203719.3604757-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

Similar to the 'dma-coherent' property, some architectures may be coherent
by default with some devices being non-coherent. Add a property for this
case tool.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
Companion patch to RISC-V Zicbom noncoherent dma support
https://lore.kernel.org/linux-riscv/20220619203212.3604485-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org/

 source/chapter2-devicetree-basics.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
index 47d2fad..bdd7b9f 100644
--- a/source/chapter2-devicetree-basics.rst
+++ b/source/chapter2-devicetree-basics.rst
@@ -832,6 +832,19 @@ Description:
    coherent DMA operations. Some architectures have coherent DMA by default
    and this property is not applicable.
 
+dma-noncoherent
+~~~~~~~~~~~~
+
+Property name: ``dma-noncoherent``
+
+Value type: ``<empty>``
+
+Description:
+   For architectures which are by default coherent for I/O, the
+   *dma-noncoherent* property is used to indicate a device is not capable of
+   coherent DMA operations. Some architectures have non-coherent DMA by
+   default and this property is not applicable.
+
 name (deprecated)
 ~~~~~~~~~~~~~~~~~
 
-- 
2.35.1

