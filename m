From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [dtschema PATCH] schemas: clock: Add example for 'clock-indices'
Date: Thu, 28 Apr 2022 10:27:19 -0500
Message-ID: <20220428152719.2263164-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>

Add description for assigned-clocks properties from clock-binding.txt in
the Linux kernel.

This is relicensed from GPL-2.0 (the default) to BSD-2-Clause. The Cc list
are the original authors.

Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Please ack the license change.

 dtschema/schemas/clock/clock.yaml | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/dtschema/schemas/clock/clock.yaml b/dtschema/schemas/clock/clock.yaml
index 5299653b80b6..433a858ef31e 100644
--- a/dtschema/schemas/clock/clock.yaml
+++ b/dtschema/schemas/clock/clock.yaml
@@ -94,9 +94,21 @@ properties:
 
   clock-indices:
     $ref: "/schemas/types.yaml#/definitions/uint32-array"
-    description: If the identifying number for the clocks in the node
-      is not linear from zero, then this allows the mapping of identifiers
-      into the clock-output-names array.
+    description: |
+      If the identifying number for the clocks in the node is not linear from
+      zero, then this allows the mapping of identifiers into the
+      clock-output-names array.
+
+      For example, if we have two clocks <&oscillator 1> and <&oscillator 3>:
+
+        oscillator {
+            compatible = "myclocktype";
+            #clock-cells = <1>;
+            clock-indices = <1>, <3>;
+            clock-output-names = "clka", "clkb";
+        }
+
+      This ensures we do not have any empty strings in clock-output-names
 
   # Consumer properties
   clocks:
-- 
2.34.1

