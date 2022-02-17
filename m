From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] dt-bindings: reserved-memory: Add restricted-dma-pool constraints
Date: Thu, 17 Feb 2022 13:10:04 +0000
Message-ID: <79d1914ff04b44c3005072a990d14291c9ce6fce.1645103404.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The "restricted-dma-pool" definition prohibits combination with either
of the "no-map" and "reusable" properties, but this is only stated in
the description text. Add those constraints to the schema so we can
properly validate them.

Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
---
 .../bindings/reserved-memory/shared-dma-pool.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
index a4bf757d6881..01385581f663 100644
--- a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
@@ -56,6 +56,19 @@ properties:
       If this property is present, then Linux will use the region for
       the default pool of the consistent DMA allocator.
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: restricted-dma-pool
+then:
+  not:
+    anyOf:
+      - required:
+          - no-map
+      - required:
+          - reusable
+
 unevaluatedProperties: false
 
 examples:
-- 
2.28.0.dirty

