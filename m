From: Janne Grunau <j@jannau.net>
Subject: [PATCH v2 1/4] dt-bindings: net: Add network-class schema for
 mac-address properties
Date: Sun, 12 Feb 2023 13:16:29 +0100
Message-ID: <20230203-dt-bindings-network-class-v2-1-499686795073@jannau.net>
References: <20230203-dt-bindings-network-class-v2-0-499686795073@jannau.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20230203-dt-bindings-network-class-v2-0-499686795073-w2YMFpIX6D+sTnJN9+BGXg@public.gmane.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4501; i=j@jannau.net;
 h=from:subject:message-id; bh=8HRhQ9UDUyunqEi/R8RirwwIC4gcDZhwkLZD91gnvCY=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuQXN+ZNdPuo4jAjVC+vj0Phyu2gGx+v9zVPY4tYrfkz9
 M9cH/uGjlIWBjEOBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABNpF2b4n94SrMX/dfqZXJ+w
 v5NifxzVUI4zvSv926d3aje3mcRpU4Z/eqeCfRq8dPYu2vikp9tEy2/ZeQmBhgPH39+9ZvZf/Jg
 KBwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Chee Nouk Phoon <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Janne Grunau <j@jannau.net>

The ethernet-controller schema specifies "mac-address" and
"local-mac-address" but other network devices such as wireless network
adapters use mac addresses as well.
The Devicetree Specification, Release v0.3 specifies in section 4.3.1
a generic "Network Class Binding" with "address-bits", "mac-address",
"local-mac-address" and "max-frame-size". This schema specifies the
"address-bits" property and moves the remaining properties over from
the ethernet-controller.yaml schema.

The "max-frame-size" property is used to describe the maximal payload
size despite its name. Keep the description from ethernet-controller
specifying this property as MTU. The contradictory description in the
Devicetree Specification is ignored.

Signed-off-by: Janne Grunau <j@jannau.net>

---
Changed in v2:
- restrict address-size to 48 bits for strict mac address size
  validation
- move max-frame-size as well
---
 .../bindings/net/ethernet-controller.yaml          | 25 +-----------
 .../devicetree/bindings/net/network-class.yaml     | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 00be387984ac..1ad66af55d77 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -17,30 +17,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: Human readable label on a port of a box.
 
-  local-mac-address:
-    description:
-      Specifies the MAC address that was assigned to the network device.
-    $ref: /schemas/types.yaml#/definitions/uint8-array
-    minItems: 6
-    maxItems: 6
-
-  mac-address:
-    description:
-      Specifies the MAC address that was last used by the boot
-      program; should be used in cases where the MAC address assigned
-      to the device by the boot program is different from the
-      local-mac-address property.
-    $ref: /schemas/types.yaml#/definitions/uint8-array
-    minItems: 6
-    maxItems: 6
-
-  max-frame-size:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      Maximum transfer unit (IEEE defined MTU), rather than the
-      maximum frame size (there\'s contradiction in the Devicetree
-      Specification).
-
   max-speed:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -226,6 +202,7 @@ dependencies:
   pcs-handle-names: [pcs-handle]
 
 allOf:
+  - $ref: /schemas/net/network-class.yaml#
   - if:
       properties:
         phy-mode:
diff --git a/Documentation/devicetree/bindings/net/network-class.yaml b/Documentation/devicetree/bindings/net/network-class.yaml
new file mode 100644
index 000000000000..6c42c783cb03
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/network-class.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/network-class.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Network Class Common Properties
+
+maintainers:
+  - Devicetree Specification Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
+
+properties:
+  address-bits:
+    description:
+      Specifies number of address bits required to address the device described
+      by this node. This property specifies number of bits in MAC address.
+    default: 48
+    const: 48
+
+  local-mac-address:
+    description:
+      Specifies MAC address that was assigned to the network device described by
+      the node containing this property.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 6
+    maxItems: 6
+
+  mac-address:
+    description:
+      Specifies the MAC address that was last used by the boot program. This
+      property should be used in cases where the MAC address assigned to the
+      device by the boot program is different from the
+      local-mac-address property. This property shall be used only if the value
+      differs from local-mac-address property value.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 6
+    maxItems: 6
+
+  max-frame-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Maximum transfer unit (IEEE defined MTU).
+
+additionalProperties: true

-- 
2.39.1

