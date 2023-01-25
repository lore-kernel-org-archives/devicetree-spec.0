From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dt-bindings: reserved-memory: Refine 'size' and 'alignment' types
Date: Wed, 25 Jan 2023 16:14:50 -0600
Message-ID: <20230125221450.3058762-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Both 'size' and 'alignment' are single values, but can be 32 or 64 bits.
Use the precise types rather than the 2 32-bit cell encoding.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/reserved-memory/reserved-memory.yaml    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
index 44f72bcf1782..b205215b130d 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
@@ -31,17 +31,17 @@ properties:
   reg: true
 
   size:
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-    minItems: 1
-    maxItems: 2
+    oneOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - $ref: /schemas/types.yaml#/definitions/uint64
     description: >
       Length based on parent's \#size-cells. Size in bytes of memory to
       reserve.
 
   alignment:
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-    minItems: 1
-    maxItems: 2
+    oneOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - $ref: /schemas/types.yaml#/definitions/uint64
     description: >
       Length based on parent's \#size-cells. Address boundary for
       alignment of allocation.
-- 
2.39.0

