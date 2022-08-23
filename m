From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: [PATCH] schemas: pci-bus: make reg optional for Marvell PCI controllers
Date: Tue, 23 Aug 2022 22:00:33 +0200
Message-ID: <20220823200033.3428436-1-andrew@lunn.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
        Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
        Content-Disposition:In-Reply-To:References;
        bh=NREv87sZnjM0/sgNohT1eOjsNMrj7gEt2qWGeUQfWtM=; b=TNy42mqS6L7WDJswHythv/Qsbl
        dx0sb+D5FN0bWcIBqQB4fsyDmPDkbceCQTOvbf2DAyTDKKw3eO+GlPg+ZnPKq4TxvN9CLaNGG4ljl
        hhAefXWh8/NFULOdg87picEcWIvTcmRlrPynYkvHiKwAlIBB7ln67LBXjceE4RvT0CUQ=;
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

Marvell devices have PCE endpoints, but no PCI controller. The driver
provides an emulated PCI controller. As such, it does not have a reg
property.

Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
---

I've not posted the conversion of the Marvell PCI driver from .txt to
.yaml yet. When i do, i will need something like this.

dtschema/schemas/pci/pci-bus.yaml | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/dtschema/schemas/pci/pci-bus.yaml b/dtschema/schemas/pci/pci-bus.yaml
index 31bc1b9..0481bf6 100644
--- a/dtschema/schemas/pci/pci-bus.yaml
+++ b/dtschema/schemas/pci/pci-bus.yaml
@@ -178,10 +178,23 @@ patternProperties:
 required:
   - device_type
   - ranges
-  - reg
   - "#address-cells"
   - "#size-cells"
 
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          enum:
+            - marvell,armada-370-pcie
+            - marvell,armada-xp-pcie
+            - marvell,dove-pcie
+            - marvell,kirkwood-pcie
+then:
+  required:
+    - reg
+
 dependentRequired:
   msi-map-mask: [ msi-map ]
 
-- 
2.37.2

